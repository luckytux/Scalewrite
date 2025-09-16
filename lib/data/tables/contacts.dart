// File: lib/data/tables/contacts.dart
import 'package:drift/drift.dart';
import 'customers.dart';

class Contacts extends Table {
  IntColumn get id => integer().autoIncrement()();

  // If you delete a customer, remove their contacts automatically.
  IntColumn get customerId =>
      integer().references(Customers, #id, onDelete: KeyAction.cascade)();

  // Required
  TextColumn get name => text()();

  // Optional fields
  TextColumn get phone => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get notes => text().nullable()();

  // One can be marked "main"
  BoolColumn get isMain => boolean().withDefault(const Constant(false))();

  // Admin / sync flags
  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
  BoolColumn get auditFlag => boolean().withDefault(const Constant(false))();

  // (Nice to have) timestamps
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  // Optional: Enforce that a customer can't have two identical non-null emails.
  // (SQLite allows multiple NULLs in UNIQUE, so this won’t block missing emails.)
  @override
  List<Set<Column>> get uniqueKeys => [
        {customerId, email},
      ];
}
