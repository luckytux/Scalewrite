// File: lib/data/daos/customer_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/customers.dart';
import '../tables/contacts.dart';

part 'customer_dao.g.dart';

@DriftAccessor(tables: [Customers, Contacts])
class CustomerDao extends DatabaseAccessor<AppDatabase> with _$CustomerDaoMixin {
  CustomerDao(AppDatabase db) : super(db);

  Future<List<Customer>> getAllActiveCustomers() {
    return (select(customers)..where((c) => c.deactivate.equals(false))).get();
  }

  Future<List<Contact>> getContactsForCustomer(int customerId) {
    return (select(contacts)
          ..where((c) =>
              c.customerId.equals(customerId) &
              c.deactivate.equals(false)))
        .get();
  }

  Future<void> insertCustomer(CustomersCompanion entry) => into(customers).insert(entry);

  Future<void> insertContact(ContactsCompanion entry) => into(contacts).insert(entry);
}
