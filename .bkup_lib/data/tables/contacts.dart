// File: lib/data/tables/contacts.dart

import 'package:drift/drift.dart';
import 'customers.dart';

class Contacts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId => integer().references(Customers, #id)();

  TextColumn get name => text()();
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get note => text().nullable()();

  BoolColumn get isMain => boolean().withDefault(const Constant(false))();
  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get auditFlag => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}
