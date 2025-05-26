// File: lib/data/daos/work_order_with_customer_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/work_orders.dart';
import '../tables/customers.dart';
import '../../models/work_order_with_customer.dart';

part 'work_order_with_customer_dao.g.dart';

@DriftAccessor(tables: [WorkOrders, Customers])
class WorkOrderWithCustomerDao extends DatabaseAccessor<AppDatabase>
    with _$WorkOrderWithCustomerDaoMixin {
  WorkOrderWithCustomerDao(super.db);

  Future<List<WorkOrderWithCustomer>> getWorkOrdersWithCustomerName() async {
    final query = select(workOrders).join([
      innerJoin(
        customers,
        customers.id.equalsExp(workOrders.customerId),
      ),
    ])
      ..orderBy([
        OrderingTerm(
          expression: CustomExpression<String>(
            "substr(work_orders.work_order_number, instr(work_orders.work_order_number, '-') + 1)"
          ),
          mode: OrderingMode.desc,
        ),
      ]);

    final rows = await query.get();

    return rows.map((row) {
      final wo = row.readTable(workOrders);
      final customer = row.readTable(customers);
      return WorkOrderWithCustomer(
        workOrder: wo,
        customer: customer,
      );
    }).toList();
  }

  Future<List<WorkOrderWithCustomer>> getUnsyncedWorkOrders() async {
    final query = select(workOrders).join([
      innerJoin(
        customers,
        customers.id.equalsExp(workOrders.customerId),
      ),
    ])
      ..where(workOrders.synced.equals(false))
      ..orderBy([
        OrderingTerm(
          expression: CustomExpression<String>(
            "substr(work_orders.work_order_number, instr(work_orders.work_order_number, '-') + 1)"
          ),
          mode: OrderingMode.desc,
        ),
      ]);

    final rows = await query.get();

    return rows.map((row) {
      final wo = row.readTable(workOrders);
      final customer = row.readTable(customers);
      return WorkOrderWithCustomer(
        workOrder: wo,
        customer: customer,
      );
    }).toList();
  }
}
