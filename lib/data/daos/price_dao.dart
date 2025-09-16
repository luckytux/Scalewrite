// File: lib/data/daos/price_dao.dart

import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/prices.dart';

part 'price_dao.g.dart';

@DriftAccessor(tables: [Prices])
class PriceDao extends DatabaseAccessor<AppDatabase> with _$PriceDaoMixin {
  PriceDao(super.db);

  Future<List<Price>> getAll() => select(prices).get();

  Stream<List<Price>> watchActive() =>
      (select(prices)..where((t) => t.active.equals(true))).watch();

  Future<Price?> getByCode(String code) =>
      (select(prices)
            ..where((t) => t.code.equals(code) & t.active.equals(true)))
          .getSingleOrNull();

  /// Insert or update by `code`.
  Future<int> upsertByCode({
    required String code,
    required String unit,
    required double rate,
    String description = '',
    bool active = true,
  }) async {
    final existing = await getByCode(code);
    final now = DateTime.now();

    if (existing == null) {
      return into(prices).insert(
        PricesCompanion(
          code: Value(code),
          description: Value(description),
          unit: Value(unit),
          rate: Value(rate),
          active: Value(active),
          createdAt: Value(now),
          updatedAt: Value(now),
        ),
      );
    } else {
      return (update(prices)..where((t) => t.id.equals(existing.id))).write(
        PricesCompanion(
          description: Value(description),
          unit: Value(unit),
          rate: Value(rate),
          active: Value(active),
          updatedAt: Value(now),
        ),
      );
    }
  }

  /// One-shot helper to ensure the standard codes exist.
  Future<void> ensureDefaultPrices() async {
    // NOTE: rates are placeholders; tune them in UI or a seed screen.
    final defaults = <({String code, String unit, double rate, String desc})>[
      (code: 'labour',             unit: 'hour', rate: 0, desc: 'Labour (per hour)'),
      (code: 'parts',              unit: 'each', rate: 0, desc: 'Parts (per item)'),
      (code: 'test_truck_flat',    unit: 'flat', rate: 0, desc: 'Test Truck – Flat Charge'),
      (code: 'test_truck_km',      unit: 'km',   rate: 0, desc: 'Test Truck – Per Kilometre'),
      (code: 'test_truck_on_site', unit: 'hour', rate: 0, desc: 'Test Truck – On Site (per hour)'),
      (code: 'service_vehicle_km', unit: 'km',   rate: 0, desc: 'Service Vehicle – Per Kilometre'),
      (code: 'misc_expense',       unit: 'each', rate: 0, desc: 'Misc Material & Expense'),
      (code: 'tech_travel',        unit: 'hour', rate: 0, desc: 'Technician Travel (per hour)'),
    ];

    for (final d in defaults) {
      final exists = await getByCode(d.code);
      if (exists == null) {
        await upsertByCode(
          code: d.code,
          unit: d.unit,
          rate: d.rate,
          description: d.desc,
        );
      }
    }
  }
}
