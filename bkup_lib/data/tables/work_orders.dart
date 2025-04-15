// File: lib/data/tables/work_orders.dart

import 'package:drift/drift.dart';
import 'customers.dart';

class WorkOrders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId => integer().references(Customers, #id)();

  TextColumn get workOrderNumber => text()(); // Required field
  TextColumn get businessName => text()();
  TextColumn get billingAddress => text()();
  TextColumn get city => text()();
  TextColumn get province => text()();
  TextColumn get postal => text()();

  TextColumn get mainContactName => text()();
  TextColumn get mainContactPhone => text().nullable()();
  TextColumn get mainContactEmail => text().nullable()();
  TextColumn get mainContactNote => text().nullable()();

  TextColumn get gpsLocation => text().nullable()();
  TextColumn get customerNotes => text().nullable()();

  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}
