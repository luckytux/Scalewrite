// File: lib/providers/work_order_list_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'drift_providers.dart';

final workOrderListProvider = FutureProvider((ref) async {
  final db = ref.read(databaseProvider);
  return db.workOrderDao.getAllWorkOrdersWithCustomers(); // returns List<(WorkOrder, Customer)>
});
