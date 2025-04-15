// File: lib/providers/customer_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import 'drift_providers.dart';

final customerListProvider = StreamProvider.autoDispose((ref) {
  final dao = ref.watch(customerDaoProvider);
  return dao.watchAllCustomers();
});

final customerByIdProvider = FutureProvider.family.autoDispose((ref, int id) {
  final dao = ref.watch(customerDaoProvider);
  return dao.getCustomerById(id);
});
