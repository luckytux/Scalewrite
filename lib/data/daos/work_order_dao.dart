// File: lib/data/daos/work_order_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/work_orders.dart';
import '../tables/customers.dart';

part 'work_order_dao.g.dart';

@DriftAccessor(tables: [WorkOrders, Customers])
class WorkOrderDao extends DatabaseAccessor<AppDatabase> with _$WorkOrderDaoMixin {
  WorkOrderDao(super.db);

  Future<int> insertWorkOrder(WorkOrdersCompanion entry) {
    // Ensure lastModified is stamped on insert unless caller explicitly set it.
    final withStamp = entry.copyWith(
      lastModified: entry.lastModified.present
          ? entry.lastModified
          : Value(DateTime.now()),
    );
    return into(workOrders).insert(withStamp);
  }

  Future<List<WorkOrder>> getAllWorkOrders() =>
      (select(workOrders)..orderBy([(w) => OrderingTerm.desc(w.id)])).get();

  Future<void> deleteWorkOrder(int id) async {
    await (delete(workOrders)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<WorkOrder?> getWorkOrderById(int id) {
    return (select(workOrders)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  // Existing WorkOrder model updater (kept); stamps lastModified.
  Future<void> updateWorkOrderFromModel(WorkOrder updated) async {
    await (update(workOrders)..where((w) => w.id.equals(updated.id))).write(
      WorkOrdersCompanion(
        id: Value(updated.id),
        customerId: Value(updated.customerId),
        workOrderNumber: Value(updated.workOrderNumber),
        siteAddress: Value(updated.siteAddress),
        siteCity: Value(updated.siteCity),
        siteProvince: Value(updated.siteProvince),
        sitePostalCode: Value(updated.sitePostalCode),
        billingAddress: Value(updated.billingAddress),
        billingCity: Value(updated.billingCity),
        billingProvince: Value(updated.billingProvince),
        billingPostalCode: Value(updated.billingPostalCode),
        gpsLocation: Value(updated.gpsLocation),
        customerNotes: Value(updated.customerNotes),
        auditFlag: const Value(true),
        synced: Value(updated.synced),
        lastModified: Value(DateTime.now()),
      ),
    );
  }

  // Companion-based updater used by the form; always stamps lastModified.
  Future<void> updateWorkOrder(int id, WorkOrdersCompanion entry) async {
    final withStamp = entry.copyWith(lastModified: Value(DateTime.now()));
    await (update(workOrders)..where((w) => w.id.equals(id))).write(withStamp);
  }

  Future<WorkOrder?> getMostRecentForCustomer(int customerId) {
    return (select(workOrders)
          ..where((w) => w.customerId.equals(customerId))
          ..orderBy([(w) => OrderingTerm.desc(w.id)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<List<WorkOrder>> getUnsyncedWorkOrders({int limit = 50}) {
    return (select(workOrders)
          ..where((w) => w.synced.equals(false))
          ..orderBy([(w) => OrderingTerm.desc(w.id)])
          ..limit(limit))
        .get();
  }

  Future<List<(WorkOrder, Customer)>> getAllWorkOrdersWithCustomers() {
    final query = select(workOrders).join([
      innerJoin(customers, customers.id.equalsExp(workOrders.customerId)),
    ])
      ..orderBy([
        OrderingTerm.desc(workOrders.id),
      ]);

    return query.map((row) {
      return (row.readTable(workOrders), row.readTable(customers));
    }).get();
  }

  // Used in main.dart to determine if seed is needed
  Future<int> countWorkOrders() async {
    final query = selectOnly(workOrders)..addColumns([workOrders.id.count()]);
    final row = await query.getSingle();
    return row.read(workOrders.id.count()) ?? 0;
  }
}
