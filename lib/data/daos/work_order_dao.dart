// File: lib/data/daos/work_order_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/work_orders.dart';

part 'work_order_dao.g.dart';

@DriftAccessor(tables: [WorkOrders])
class WorkOrderDao extends DatabaseAccessor<AppDatabase> with _$WorkOrderDaoMixin {
  WorkOrderDao(AppDatabase db) : super(db);

  Future<int> insertWorkOrder(WorkOrdersCompanion entry) {
    return into(workOrders).insert(entry);
  }

  Future<List<WorkOrder>> getAllWorkOrders() {
    return select(workOrders).get();
  }

  Stream<List<WorkOrder>> watchAllWorkOrders() {
    return select(workOrders).watch();
  }

  Future<bool> updateWorkOrder(WorkOrder updated) {
    return update(workOrders).replace(updated);
  }

  Future<int> deleteWorkOrder(int id) {
    return (delete(workOrders)..where((tbl) => tbl.id.equals(id))).go();
  }
}
