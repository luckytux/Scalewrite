// File: lib/data/daos/customer_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/customers.dart'; // You need to import this

part 'customer_dao.g.dart';

@DriftAccessor(tables: [Customers])
class CustomerDao extends DatabaseAccessor<AppDatabase> with _$CustomerDaoMixin {
  CustomerDao(AppDatabase db) : super(db);

  Future<List<Customer>> getAllCustomers() => (select(customers)
    ..where((tbl) => tbl.deactivate.equals(false))
    ..orderBy([(tbl) => OrderingTerm(expression: tbl.name)])).get();

  Stream<List<Customer>> watchAllCustomers() => (select(customers)
    ..where((tbl) => tbl.deactivate.equals(false))).watch();

  Future<int> insertCustomer(CustomersCompanion customer) => into(customers).insert(customer);

  Future<bool> updateCustomer(Customer customer) => update(customers).replace(customer);
}
