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
import 'tables/prices.dart';

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
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase({String? overridePath}) : super(_openConnection(overridePath));

  // 🔢 bump so upgrades run on existing installs
  @override
  int get schemaVersion => 6;

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

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) async {
          await m.createAll();
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
        },
        beforeOpen: (details) async {
          // Seed and then normalize any legacy alias codes
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
    return NativeDatabase(File(dbPath));
  });
}

Future<String> _defaultPath() async {
  final dir = Directory.current;
  return p.join(dir.path, 'scalewrite.sqlite');
}
