// File: lib/data/tables/customers.dart

import 'package:drift/drift.dart';

class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get billingAddress => text()();
  TextColumn get city => text()();
  TextColumn get province => text()();
  TextColumn get postal => text()();

  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get auditFlag => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}
