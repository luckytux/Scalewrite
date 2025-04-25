// File: lib/data/daos/customer_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/customers.dart';

part 'customer_dao.g.dart';

@DriftAccessor(tables: [Customers])
class CustomerDao extends DatabaseAccessor<AppDatabase> with _$CustomerDaoMixin {
  CustomerDao(AppDatabase db) : super(db);

  Future<Customer?> getCustomerById(int id) {
    return (select(customers)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  /// Use this in providers or UI
  Future<List<Customer>> getAllActiveCustomers() {
    return (select(customers)
          ..where((tbl) => tbl.deactivate.equals(false))
          ..orderBy([(c) => OrderingTerm(expression: c.businessName)]))
        .get();
  }

  Future<int> insertCustomer(CustomersCompanion entry) {
    return into(customers).insert(entry);
  }

  Future<bool> updateCustomer(CustomersCompanion entry) async {
    final updated = await (update(customers)..where((tbl) => tbl.id.equals(entry.id.value)))
        .write(entry);
    return updated > 0;
  }

  Future<void> upsertCustomer(CustomersCompanion entry) async {
    if (entry.id.present) {
      final existing = await getCustomerById(entry.id.value);
      if (existing != null) {
        await updateCustomer(entry);
        return;
      }
    }
    await insertCustomer(entry);
  }
}
