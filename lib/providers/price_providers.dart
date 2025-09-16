// File: lib/providers/price_providers.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/daos/price_dao.dart';
import '../providers/drift_providers.dart';

final priceDaoProvider = Provider<PriceDao>((ref) {
  final db = ref.read(databaseProvider);
  return PriceDao(db);
});

/// Watch all active prices (handy for admin editor UIs)
final activePricesStreamProvider = StreamProvider((ref) {
  return ref.read(priceDaoProvider).watchActive();
});
