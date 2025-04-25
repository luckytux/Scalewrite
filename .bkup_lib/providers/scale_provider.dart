// File: lib/providers/scale_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import 'drift_providers.dart';

final scaleListByCustomerProvider = StreamProvider.family.autoDispose((ref, int customerId) {
  final dao = ref.watch(scaleDaoProvider);
  return dao.watchScalesForCustomer(customerId);
});

final scaleByIdProvider = FutureProvider.family.autoDispose((ref, int scaleId) {
  final dao = ref.watch(scaleDaoProvider);
  return dao.getScaleById(scaleId);
});
