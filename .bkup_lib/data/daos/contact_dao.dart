// File: lib/data/daos/contact_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/contacts.dart'; // Required for Drift codegen

part 'contact_dao.g.dart';

@DriftAccessor(tables: [Contacts])
class ContactDao extends DatabaseAccessor<AppDatabase> with _$ContactDaoMixin {
  ContactDao(AppDatabase db) : super(db);

  Future<List<Contact>> getContactsForCustomer(int customerId) => (select(contacts)
    ..where((tbl) => tbl.customerId.equals(customerId) & tbl.deactivate.equals(false)))
    .get();

  Stream<List<Contact>> watchContactsForCustomer(int customerId) => (select(contacts)
    ..where((tbl) => tbl.customerId.equals(customerId) & tbl.deactivate.equals(false)))
    .watch();

  Future<int> insertContact(ContactsCompanion contact) => into(contacts).insert(contact);

  Future<bool> updateContact(Contact contact) => update(contacts).replace(contact);

  Future<void> setMainContact(int contactId, int customerId) async {
    await (update(contacts)
      ..where((tbl) => tbl.customerId.equals(customerId)))
      .write(const ContactsCompanion(isMain: Value(false)));

    await (update(contacts)
      ..where((tbl) => tbl.id.equals(contactId)))
      .write(const ContactsCompanion(isMain: Value(true)));
  }
}
