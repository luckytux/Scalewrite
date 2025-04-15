// File: lib/data/tables/customers.dart
import 'package:drift/drift.dart';

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get businessName => text()();
  TextColumn get address => text()();
  TextColumn get city => text()();
  TextColumn get province => text()();
  TextColumn get postalCode => text()();

  TextColumn get gpsLocation => text().nullable()();
  TextColumn get notes => text().nullable()();

  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  BoolColumn get auditFlag => boolean().withDefault(const Constant(false))();
}
