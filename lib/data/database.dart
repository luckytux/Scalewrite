// File: lib/data/database.dart

import 'dart:io';
import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
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
import 'tables/prices.dart'; // ✅ NEW

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
import 'daos/price_dao.dart'; // ✅ NEW

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
    Prices, // ✅ NEW
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
    PriceDao, // ✅ NEW
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({String? overridePath}) : super(_openConnection(overridePath));

  // Schema version
  @override
  int get schemaVersion => 4; // ⬆️ bumped for Prices table

  // Manual DAO access
  late final customerDao = CustomerDao(this);
  late final contactDao = ContactDao(this);
  late final workOrderDao = WorkOrderDao(this);
  late final scaleDao = ScaleDao(this);
  late final serviceReportsDao = ServiceReportDao(this); // ✅ Correct
  late final weightTestDao = WeightTestDao(this);
  late final workOrderWithCustomerDao = WorkOrderWithCustomerDao(this);
  late final userDao = UserDao(this);
  late final inventoryDao = InventoryDao(this);
  late final priceDao = PriceDao(this); // ✅ NEW

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          // Previous inventory fix
          if (from < 3) {
            await m.deleteTable('inventory_items'); // Drop bad constraint
            await m.createTable(inventoryItems);
            await m.createTable(inventoryTransactions);
          }
          // ➕ Create Prices table when upgrading to v4
          if (from < 4) {
            await m.createTable(prices);
          }
        },
        beforeOpen: (details) async {
          // Ensure default price rows exist (safe to call repeatedly)
          // You can remove this if you prefer a separate seeding step.
          await priceDao.ensureDefaultPrices();
        },
      );
}

// Lazy SQLite setup
LazyDatabase _openConnection([String? overridePath]) {
  return LazyDatabase(() async {
    final dbPath = overridePath ?? await _defaultPath();
    print('📂 SQLite DB Path: $dbPath');
    return NativeDatabase(File(dbPath));
  });
}

Future<String> _defaultPath() async {
  final dir = Directory.current;
  return p.join(dir.path, 'scalewrite.sqlite');
}
