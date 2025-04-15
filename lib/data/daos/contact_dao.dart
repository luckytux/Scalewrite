// File: lib/data/daos/contact_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/contacts.dart';

part 'contact_dao.g.dart';

@DriftAccessor(tables: [Contacts])
class ContactDao extends DatabaseAccessor<AppDatabase> with _$ContactDaoMixin {
  ContactDao(AppDatabase db) : super(db);

  Future<int> insertContact(ContactsCompanion contact) =>
      into(contacts).insert(contact);

  Future<List<Contact>> getContactsForCustomer(int customerId) {
    return (select(contacts)
          ..where((tbl) =>
              tbl.customerId.equals(customerId) &
              tbl.deactivate.equals(false)))
        .get();
  }

  Stream<List<Contact>> watchContactsForCustomer(int customerId) {
    return (select(contacts)
          ..where((tbl) =>
              tbl.customerId.equals(customerId) &
              tbl.deactivate.equals(false)))
        .watch();
  }

  Future<bool> updateContact(Contact contact) =>
      update(contacts).replace(contact);

  Future<int> deleteContact(int id) =>
      (delete(contacts)..where((tbl) => tbl.id.equals(id))).go();

  Future<void> setMainContact(int customerId, int contactId) async {
    final allContacts = await getContactsForCustomer(customerId);
    for (final c in allContacts) {
      final isMain = c.id == contactId;
      await update(contacts).replace(
        c.copyWith(isMain: isMain),
      );
    }
  }
}
