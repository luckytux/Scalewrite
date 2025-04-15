// File: lib/providers/work_order_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import 'drift_providers.dart';

final workOrderListProvider = StreamProvider.autoDispose((ref) {
  final dao = ref.watch(workOrderDaoProvider);
  return dao.watchWorkOrders();
});

final workOrderByIdProvider = FutureProvider.family.autoDispose((ref, int id) {
  final dao = ref.watch(workOrderDaoProvider);
  return dao.getWorkOrderById(id);
});
