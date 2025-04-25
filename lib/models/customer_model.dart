// File: lib/data/models/customer.dart

import 'package:drift/drift.dart';

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Business name and general info
  TextColumn get businessName => text()();
  TextColumn get gpsLocation => text().nullable()();
  TextColumn get notes => text().nullable()();

  // Site Address fields
  TextColumn get siteAddress => text().nullable()();
  TextColumn get siteCity => text().nullable()();
  TextColumn get siteProvince => text().nullable()();
  TextColumn get sitePostalCode => text().nullable()();

  // Billing Address fields
  TextColumn get billingAddress => text().nullable()();
  TextColumn get billingCity => text().nullable()();
  TextColumn get billingProvince => text().nullable()();
  TextColumn get billingPostalCode => text().nullable()();

  // Metadata flags
  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  BoolColumn get auditFlag => boolean().withDefault(const Constant(false))();
}
