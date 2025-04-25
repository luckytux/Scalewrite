// File: lib/data/tables/customers.dart

import 'package:drift/drift.dart';

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get businessName => text()();

  // Site Address
  TextColumn get siteAddress => text().nullable()();
  TextColumn get siteCity => text().nullable()();
  TextColumn get siteProvince => text().nullable()();
  TextColumn get sitePostalCode => text().nullable()();

  // Billing Address
  TextColumn get billingAddress => text().nullable()();
  TextColumn get billingCity => text().nullable()();
  TextColumn get billingProvince => text().nullable()();
  TextColumn get billingPostalCode => text().nullable()();

  TextColumn get gpsLocation => text().nullable()();
  TextColumn get notes => text().nullable()();

  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  BoolColumn get auditFlag => boolean().withDefault(const Constant(false))();
}
