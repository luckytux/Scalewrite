// File: lib/models/work_order_with_customer.dart

import '../data/database.dart';

class WorkOrderWithCustomer {
  final WorkOrder workOrder;
  final Customer customer;

  WorkOrderWithCustomer({
    required this.workOrder,
    required this.customer,
  });
}
