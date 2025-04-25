// File: lib/providers/scale_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import 'drift_providers.dart';

final scaleListProvider = FutureProvider.family<List<Scale>, int>((ref, customerId) async {
  final db = ref.read(databaseProvider);
  return db.scaleDao.getScalesForCustomer(customerId);
});