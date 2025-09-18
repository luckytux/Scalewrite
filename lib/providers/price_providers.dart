// File: lib/providers/price_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import 'drift_providers.dart';
import '../data/daos/price_dao.dart';

final pricesStreamProvider = StreamProvider<List<Price>>((ref) {
  final dao = ref.read(priceDaoProvider);
  return dao.watchActive();
});

final priceByCodeProvider =
    FutureProvider.family<Price?, String>((ref, code) async {
  final dao = ref.read(priceDaoProvider);
  return dao.getByCode(code);
});

// Convenience getters for specific codes
final labourPriceProvider =
    FutureProvider<Price?>((ref) => ref.read(priceDaoProvider).getByCode(PriceCodes.labour));
final overtimePriceProvider =
    FutureProvider<Price?>((ref) => ref.read(priceDaoProvider).getByCode(PriceCodes.overtime));
final miscPercentProvider =
    FutureProvider<Price?>((ref) => ref.read(priceDaoProvider).getByCode(PriceCodes.miscPercent));
final gstProvider =
    FutureProvider<Price?>((ref) => ref.read(priceDaoProvider).getByCode(PriceCodes.taxGst));

// DAO provider
final priceDaoProvider = Provider<PriceDao>((ref) {
  return ref.read(databaseProvider).priceDao;
});
