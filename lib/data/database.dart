// File: lib/data/database.dart

import 'dart:io';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart'; // DB under AppData
import 'package:bcrypt/bcrypt.dart'; // <-- NEW: to hash default admin password
import './json_converter.dart';

// Tables
import 'tables/customers.dart';
import 'tables/contacts.dart';
import 'tables/work_orders.dart';
import 'tables/scales.dart';
import 'tables/service_reports.dart';
import 'tables/weight_tests.dart';
import 'tables/users.dart';
import 'tables/inventory_items.dart';
import 'tables/inventory_transactions.dart';
import 'tables/prices.dart';
import 'tables/work_order_charges.dart';     // ← NEW
import 'tables/work_order_parts.dart';       // ← NEW

// DAOs
import 'daos/customer_dao.dart';
import 'daos/contact_dao.dart';
import 'daos/work_order_dao.dart';
import 'daos/scale_dao.dart';
import 'daos/service_report_dao.dart';
import 'daos/weight_test_dao.dart';
import 'daos/work_order_with_customer_dao.dart';
import 'daos/user_dao.dart';
import 'daos/inventory_dao.dart';
import 'daos/price_dao.dart';
import 'daos/work_order_billing_dao.dart';   // ← NEW

part 'database.g.dart';

@DriftDatabase(
  tables: [
    Customers,
    Contacts,
    WorkOrders,
    Scales,
    ServiceReports,
    WeightTests,
    Users,
    InventoryItems,
    InventoryTransactions,
    Prices,
    WorkOrderCharges,   // ← NEW
    WorkOrderParts,     // ← NEW
  ],
  daos: [
    CustomerDao,
    ContactDao,
    WorkOrderDao,
    ScaleDao,
    ServiceReportDao,
    WeightTestDao,
    WorkOrderWithCustomerDao,
    UserDao,
    InventoryDao,
    PriceDao,
    WorkOrderBillingDao, // ← NEW
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({String? overridePath}) : super(_openConnection(overridePath));

  // 🔢 bump so upgrades run on existing installs
  @override
  int get schemaVersion => 9; // ← was 8

  // 🔌 handy DAO fields
  late final customerDao = CustomerDao(this);
  late final contactDao = ContactDao(this);
  late final workOrderDao = WorkOrderDao(this);
  late final scaleDao = ScaleDao(this);
  late final serviceReportDao = ServiceReportDao(this);
  late final weightTestDao = WeightTestDao(this);
  late final workOrderWithCustomerDao = WorkOrderWithCustomerDao(this);
  late final userDao = UserDao(this);
  late final inventoryDao = InventoryDao(this);
  late final priceDao = PriceDao(this);
  late final workOrderBillingDao = WorkOrderBillingDao(this); // ← NEW

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
          // v8 unique index is also ensured in beforeOpen (idempotent).
        },
        onUpgrade: (migrator, from, to) async {
          // v3: inventory table fix
          if (from < 3) {
            await migrator.deleteTable('inventory_items');
            await migrator.createTable(inventoryItems);
            await migrator.createTable(inventoryTransactions);
          }
          // v6: ensure Prices exists on upgrade
          if (from < 6) {
            await migrator.createTable(prices);
          }
          // v7: contacts created_at / updated_at columns
          if (from < 7) {
            try {
              await migrator.addColumn(contacts, contacts.createdAt);
            } catch (_) {}
            try {
              await migrator.addColumn(contacts, contacts.updatedAt);
            } catch (_) {}
          }
          // v8: enforce uniqueness for ServiceReports (work_order_id, scale_id)
          if (from < 8) {
            // 1) Deduplicate existing rows, keep the newest per pair
            await customStatement('''
              DELETE FROM service_reports
              WHERE id NOT IN (
                SELECT MAX(id)
                FROM service_reports
                GROUP BY work_order_id, scale_id
              );
            ''');

            // 2) Create the unique index (idempotent)
            await customStatement('''
              CREATE UNIQUE INDEX IF NOT EXISTS idx_sr_unique_wo_scale
              ON service_reports(work_order_id, scale_id);
            ''');
          }
          // v9: new billing tables
          if (from < 9) {
            await migrator.createTable(workOrderCharges);
            await migrator.createTable(workOrderParts);
          }
        },
        beforeOpen: (details) async {
          // --- Contacts: ensure columns exist + normalize to epoch ms ---
          try {
            final rows = await customSelect(
              'PRAGMA table_info(contacts);',
              readsFrom: {contacts},
            ).get();

            final cols = rows.map((r) => r.data['name']).join(', ');
            print('📋 contacts columns: $cols');

            bool hasCreatedAt = false;
            bool hasUpdatedAt = false;
            for (final r in rows) {
              final name = (r.data['name'] as String).toLowerCase();
              if (name == 'created_at') hasCreatedAt = true;
              if (name == 'updated_at') hasUpdatedAt = true;
            }

            if (!hasCreatedAt) {
              await customStatement('ALTER TABLE contacts ADD COLUMN created_at TEXT;');
              print('🛠️ added contacts.created_at');
            }
            if (!hasUpdatedAt) {
              await customStatement('ALTER TABLE contacts ADD COLUMN updated_at TEXT;');
              print('🛠️ added contacts.updated_at');
            }

            // Normalize any ISO-like values to epoch ms
            await customStatement('''
              UPDATE contacts
              SET created_at = CAST(strftime('%s', created_at) AS INTEGER) * 1000
              WHERE created_at IS NOT NULL AND created_at LIKE '____-__-__%';
            ''');
            await customStatement('''
              UPDATE contacts
              SET updated_at = CAST(strftime('%s', updated_at) AS INTEGER) * 1000
              WHERE updated_at IS NOT NULL AND updated_at LIKE '____-__-__%';
            ''');

            // Fill null/empty with now
            await customStatement('''
              UPDATE contacts
              SET created_at = CAST(strftime('%s', 'now') AS INTEGER) * 1000
              WHERE created_at IS NULL OR TRIM(created_at) = '';
            ''');
            await customStatement('''
              UPDATE contacts
              SET updated_at = CAST(strftime('%s', 'now') AS INTEGER) * 1000
              WHERE updated_at IS NULL OR TRIM(updated_at) = '';
            ''');

            // Force numeric storage (helps Drift parse reliably)
            await customStatement('''
              UPDATE contacts
              SET created_at = CAST(created_at AS INTEGER)
              WHERE typeof(created_at) IN ('text');
            ''');
            await customStatement('''
              UPDATE contacts
              SET updated_at = CAST(updated_at AS INTEGER)
              WHERE typeof(updated_at) IN ('text');
            ''');

            // Triggers to keep updated_at fresh
            await customStatement('DROP TRIGGER IF EXISTS contacts_timestamps_insert;');
            await customStatement('DROP TRIGGER IF EXISTS contacts_timestamps_update;');

            await customStatement('''
              CREATE TRIGGER IF NOT EXISTS contacts_timestamps_insert
              AFTER INSERT ON contacts
              BEGIN
                UPDATE contacts
                  SET created_at = COALESCE(NEW.created_at,
                                             CAST(strftime('%s','now') AS INTEGER) * 1000),
                      updated_at = COALESCE(NEW.updated_at,
                                             CAST(strftime('%s','now') AS INTEGER) * 1000)
                WHERE id = NEW.id;
              END;
            ''');

            await customStatement('''
              CREATE TRIGGER IF NOT EXISTS contacts_timestamps_update
              AFTER UPDATE ON contacts
              BEGIN
                UPDATE contacts
                  SET updated_at = CAST(strftime('%s','now') AS INTEGER) * 1000
                WHERE id = NEW.id;
              END;
            ''');
          } catch (e) {
            print('⚠️ contacts self-heal/normalize failed: $e');
          }

          // --- ServiceReports: belt-and-suspenders ensure unique index exists ---
          try {
            await customStatement('''
              CREATE UNIQUE INDEX IF NOT EXISTS idx_sr_unique_wo_scale
              ON service_reports(work_order_id, scale_id);
            ''');
          } catch (e) {
            print('⚠️ ensure unique idx on service_reports failed: $e');
          }

          // ✅ Mandatory admin user seed (idempotent, safe for upgrades/fresh installs)
          try {
            await _ensureAdminUserExists(this);
          } catch (e) {
            print('⚠️ ensure admin user failed: $e');
          }

          // Prices seed/normalize
          await priceDao.ensureDefaultPrices();
          await priceDao.canonicalizeAliases();
        },
      );
}

// Lazy SQLite setup
LazyDatabase _openConnection([String? overridePath]) {
  return LazyDatabase(() async {
    final dbPath = overridePath ?? await _defaultPath();
    print('📂 SQLite DB Path: $dbPath');

    // Optional breadcrumb so EXE launches are debuggable without a console
    try {
      final supportDir = await getApplicationSupportDirectory();
      final logDir = Directory(p.join(supportDir.path, 'ScaleWrite_v2', 'logs'));
      await logDir.create(recursive: true);
      final f = File(p.join(logDir.path, 'startup.log'));
      await f.writeAsString('DB path: $dbPath\n', mode: FileMode.append);
    } catch (_) {}

    return NativeDatabase(File(dbPath));
  });
}

Future<String> _defaultPath() async {
  // Per-user writable folder
  final supportDir = await getApplicationSupportDirectory();
  final appDir = Directory(p.join(supportDir.path, 'ScaleWrite_v2'));
  await appDir.create(recursive: true);
  return p.join(appDir.path, 'scalewrite.sqlite');
}

/// Ensures there is at least one admin user, and that it has a valid password.
/// Default password is "password" (bcrypt, random salt).
Future<void> _ensureAdminUserExists(AppDatabase db) async {
  // If any admin exists, do nothing.
  final hasAdmin = await db.customSelect(
    'SELECT id FROM users WHERE is_admin = 1 LIMIT 1;',
    readsFrom: {db.users},
  ).getSingleOrNull();
  if (hasAdmin != null) return;

  // Precompute a default hash once (random salt each run is fine).
  final defaultHash = BCrypt.hashpw('password', BCrypt.gensalt()); // <-- DEFAULT

  // If uid='admin' exists, promote + fill blanks (including password if missing/blank).
  final adminRow = await db.customSelect(
    "SELECT id, uid_number, password_hash FROM users WHERE uid = 'admin' LIMIT 1;",
    readsFrom: {db.users},
  ).getSingleOrNull();

  if (adminRow != null) {
    final id = adminRow.data['id'] as int;
    final pwHash = (adminRow.data['password_hash'] as String?) ?? '';
    final needsPw = pwHash.trim().isEmpty;

    await db.customStatement(
      '''
      UPDATE users
      SET
        is_admin = 1,
        email = COALESCE(NULLIF(email, ''), ?),
        display_name = COALESCE(NULLIF(display_name, ''), ?),
        uid_number = COALESCE(uid_number, ?),
        password_hash = CASE WHEN ? = 1 THEN ? ELSE password_hash END
      WHERE id = ?;
      ''',
      [
        'admin@local',
        'Administrator',
        999,
        needsPw ? 1 : 0,
        defaultHash,
        id,
      ],
    );
    print('👤 Promoted existing uid=admin to admin.${needsPw ? " (Set default password)" : ""}');
    return;
  }

  // Otherwise insert a brand new admin row with default password hash.
  await db.customStatement(
    '''
    INSERT INTO users (uid, uid_number, email, display_name, password_hash, is_admin)
    VALUES (?, ?, ?, ?, ?, 1);
    ''',
    ['admin', 999, 'admin@local', 'Administrator', defaultHash],
  );
  print('👤 Seeded admin user (uid=admin, email=admin@local, default password).');
}
