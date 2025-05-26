// File: lib/data/tables/users.dart
import 'package:drift/drift.dart';

@DataClassName('AppUser')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get uidNumber => integer().unique().nullable()(); // nullable at first for legacy compatibility
  TextColumn get uid => text().unique()();
  TextColumn get email => text().nullable()();
  TextColumn get displayName => text().nullable()();
  TextColumn get passwordHash => text().nullable()();
  BoolColumn get isAdmin => boolean().withDefault(const Constant(false))();
}