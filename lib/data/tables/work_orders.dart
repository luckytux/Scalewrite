// File: lib/data/tables/work_orders.dart

import 'package:drift/drift.dart';

class WorkOrders extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get customerId => integer()();

  TextColumn get workOrderNumber => text().withLength(min: 1, max: 50)();

  // Site address
  TextColumn get siteAddress => text()();
  TextColumn get siteCity => text()();
  TextColumn get siteProvince => text()();
  TextColumn get sitePostalCode => text()();

  // Billing address (optional)
  TextColumn get billingAddress => text().nullable()();
  TextColumn get billingCity => text().nullable()();
  TextColumn get billingProvince => text().nullable()();
  TextColumn get billingPostalCode => text().nullable()();

  // General
  TextColumn get gpsLocation => text()();
  TextColumn get customerNotes => text().nullable()();

  // Status flags
  BoolColumn get auditFlag => boolean().withDefault(const Constant(true))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();

  // Timestamp for last modified
  DateTimeColumn get lastModified => dateTime().withDefault(currentDateAndTime)();
}
