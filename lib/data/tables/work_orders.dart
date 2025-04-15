// File: lib/data/tables/work_orders.dart
import 'package:drift/drift.dart';

class WorkOrders extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId => integer()();
  TextColumn get businessName => text()();

  // Site location fields
  TextColumn get siteAddress => text()();
  TextColumn get siteCity => text()();
  TextColumn get siteProvince => text()();
  TextColumn get sitePostalCode => text()();

  // Optional billing address fields
  TextColumn get billingAddress => text().nullable()();
  TextColumn get billingCity => text().nullable()();
  TextColumn get billingProvince => text().nullable()();
  TextColumn get billingPostalCode => text().nullable()();

  // Other metadata
  TextColumn get gpsLocation => text().nullable()();
  TextColumn get customerNotes => text().nullable()();
  TextColumn get workOrderNumber => text().nullable()();

  // Status flags
  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  BoolColumn get auditFlag => boolean().withDefault(const Constant(false))();
}
