// File: lib/data/tables/inventory_items.dart

import 'package:drift/drift.dart';
import 'customers.dart';
import 'work_orders.dart';

class InventoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Basic part details
  TextColumn get partNumber => text()();
  TextColumn get description => text()();
  TextColumn get type => text().nullable()();

  // Manufacturer details
  TextColumn get make => text().nullable()();
  TextColumn get model => text().nullable()();
  TextColumn get serial => text().nullable()();
  TextColumn get capacity => text().nullable()();

  // Stock control
  IntColumn get quantity => integer().withDefault(const Constant(0))();
  RealColumn get price => real().nullable()();
  TextColumn get location => text().nullable()();
  TextColumn get barcode => text().nullable()();

  // Sales tracking
  BoolColumn get isSold => boolean().withDefault(const Constant(false))();
  IntColumn get customerId => integer().nullable().references(Customers, #id)();
  IntColumn get workOrderId => integer().nullable().references(WorkOrders, #id)();

  // ✅ Added: Track which user added or edited this item
  TextColumn get uid => text().nullable()();

  // Sync + modification tracking
  DateTimeColumn get lastModified => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}
