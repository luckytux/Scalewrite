// File: lib/data/daos/contact_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/contacts.dart';

part 'contact_dao.g.dart';

@DriftAccessor(tables: [Contacts])
class ContactDao extends DatabaseAccessor<AppDatabase> with _$ContactDaoMixin {
  ContactDao(AppDatabase db) : super(db);

  Future<int> insertContact(ContactsCompanion entry) => into(contacts).insert(entry);

  Future<List<Contact>> getContactsForCustomer(int customerId) {
    return (select(contacts)
          ..where((c) => c.customerId.equals(customerId) & c.deactivate.equals(false)))
        .get();
  }

  Future<void> updateContact(Contact contact) async {
    await update(contacts).replace(contact);
  }

  Future<void> markAsDeactivated(int id) async {
    await (update(contacts)..where((c) => c.id.equals(id))).write(const ContactsCompanion(
      deactivate: Value(true),
    ));
  }

  Future<void> insertOrUpdateContact(ContactsCompanion entry) async {
    await into(contacts).insertOnConflictUpdate(entry);
  }
}
