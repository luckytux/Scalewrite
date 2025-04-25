// File: lib/data/daos/work_order_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/work_orders.dart';

part 'work_order_dao.g.dart';

@DriftAccessor(tables: [WorkOrders])
class WorkOrderDao extends DatabaseAccessor<AppDatabase> with _$WorkOrderDaoMixin {
  WorkOrderDao(AppDatabase db) : super(db);

  Future<int> insertWorkOrder(WorkOrdersCompanion workOrder) {
    print('[WorkOrderDao] Inserting work order: $workOrder');
    return into(workOrders).insert(workOrder);
  }

  Future<WorkOrder?> getWorkOrderById(int id) {
    return (select(workOrders)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Stream<List<WorkOrder>> watchWorkOrders() {
    return (select(workOrders)..orderBy([(tbl) => OrderingTerm.desc(tbl.id)])).watch();
  }

  Future<bool> updateWorkOrder(WorkOrder workOrder) {
    return update(workOrders).replace(workOrder);
  }

  Future<int> deleteWorkOrder(int id) {
    return (delete(workOrders)..where((tbl) => tbl.id.equals(id))).go();
  }
}
