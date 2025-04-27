// File: lib/providers/weight_test_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/daos/weight_test_dao.dart';
import 'drift_providers.dart';

final weightTestDaoProvider = Provider<WeightTestDao>((ref) {
  return ref.read(databaseProvider).weightTestDao;
});
