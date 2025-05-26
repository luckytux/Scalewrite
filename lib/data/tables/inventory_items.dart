// File: lib/data/tables/inventory_items.dart

import 'package:drift/drift.dart';
import 'customers.dart';
import 'work_orders.dart';

class InventoryItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get partNumber => text()();
  TextColumn get description => text()();
  TextColumn get type => text().nullable()();


  // Newly added fields:
  TextColumn get make => text().nullable()();
  TextColumn get model => text().nullable()();
  TextColumn get serial => text().nullable()();

  IntColumn get quantity => integer().withDefault(const Constant(0))();
  RealColumn get price => real().nullable()();

  TextColumn get location => text().nullable()();
  TextColumn get barcode => text().nullable()();

  BoolColumn get isSold => boolean().withDefault(const Constant(false))();
  IntColumn get customerId => integer().nullable().references(Customers, #id)();
  IntColumn get workOrderId => integer().nullable().references(WorkOrders, #id)();
  DateTimeColumn get lastModified => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}
