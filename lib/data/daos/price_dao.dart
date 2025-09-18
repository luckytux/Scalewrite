// File: lib/data/daos/price_dao.dart
import 'package:drift/drift.dart';
import '../tables/prices.dart';
import '../database.dart';

part 'price_dao.g.dart';

class PriceCodes {
  static const labour           = 'labour';
  static const overtime         = 'overtime';            // per hour
  static const testTruckFlat    = 'test_truck_flat';
  static const testTruckKm      = 'test_truck_km';
  static const testTruckOnSite  = 'test_truck_on_site';  // per hour (canonical)
  static const serviceVehicleKm = 'service_vehicle_km';
  static const techTravel       = 'tech_travel';         // per hour
  static const miscPercent      = 'misc_percent';        // % of (labour + OT + travel)
  static const parts            = 'parts';
  static const taxGst           = 'tax_gst';
}

@DriftAccessor(tables: [Prices])
class PriceDao extends DatabaseAccessor<AppDatabase> with _$PriceDaoMixin {
  PriceDao(super.db);

  Future<List<Price>> getAll() => select(prices).get();

  Stream<List<Price>> watchActive() =>
      (select(prices)
            ..where((p) => p.active.equals(true))
            ..orderBy([(p) => OrderingTerm.asc(p.code)]))
          .watch();

  Future<Price?> getByCode(String code) =>
      (select(prices)..where((p) => p.code.equals(code))).getSingleOrNull();

  /// Upsert by UNIQUE `code`.
  Future<void> upsertByCode(PricesCompanion entry) async {
    final code = entry.code.value;
    await transaction(() async {
      final existing =
          await (select(prices)..where((p) => p.code.equals(code))).getSingleOrNull();

      if (existing == null) {
        await into(prices).insert(entry);
      } else {
        await (update(prices)..where((p) => p.code.equals(code))).write(
          entry.copyWith(
            code: const Value.absent(),
            createdAt: const Value.absent(),
            updatedAt: Value(DateTime.now()),
          ),
        );
      }
    });
  }

  Future<void> updateUnit(String code, String newUnit) =>
      (update(prices)..where((p) => p.code.equals(code))).write(
        PricesCompanion(unit: Value(newUnit), updatedAt: Value(DateTime.now())),
      );

  Future<void> updateRate(String code, double newRate) =>
      (update(prices)..where((p) => p.code.equals(code))).write(
        PricesCompanion(rate: Value(newRate), updatedAt: Value(DateTime.now())),
      );

  // ---- Canonicalize / de-dupe legacy codes ----
  // Merge/remove legacy codes so they don't show up in the admin list.
  static const Map<String, List<String>> _aliases = {
    // e.g. we saw both spellings in some DBs:
    PriceCodes.testTruckOnSite: ['test_truck_onsite', 'tt_on_site', 'testtruck_on_site'],
    // remove old "misc_expense" in favor of "misc_percent"
    PriceCodes.miscPercent: ['misc_expense', 'misc'],
  };

  Future<void> canonicalizeAliases() async {
    await transaction(() async {
      for (final entry in _aliases.entries) {
        final canonical = entry.key;
        Price? canonicalRow = await getByCode(canonical);

        for (final alias in entry.value) {
          final aliasRow = await getByCode(alias);
          if (aliasRow == null) continue;

          if (canonicalRow == null) {
            await (update(prices)..where((p) => p.id.equals(aliasRow.id))).write(
              PricesCompanion(code: Value(canonical), updatedAt: Value(DateTime.now())),
            );
            canonicalRow = await getByCode(canonical);
          } else {
            await (delete(prices)..where((p) => p.code.equals(alias))).go();
          }
        }
      }
    });
  }

  // ---- Defaults / seeding (idempotent) ----
  Future<void> ensureDefaultPrices() async {
    final now = DateTime.now();

    PricesCompanion row({
      required String code,
      required String desc,
      required String unit,
      required double rate,
      bool active = true,
    }) {
      return PricesCompanion(
        code: Value(code),
        description: Value(desc),
        unit: Value(unit),
        rate: Value(rate),
        active: Value(active),
        createdAt: Value(now),
        updatedAt: Value(now),
      );
    }

    final defaults = <PricesCompanion>[
      row(code: PriceCodes.labour,           desc: 'Labour (per hour)',               unit: 'hour',    rate: 127.00),
      row(code: PriceCodes.overtime,         desc: 'Overtime (per hour)',             unit: 'hour',    rate: 190.50),
      row(code: PriceCodes.techTravel,       desc: 'Technician Travel (per hour)',    unit: 'hour',    rate: 127.00),
      row(code: PriceCodes.testTruckFlat,    desc: 'Test Truck - Flat',               unit: 'flat',    rate: 0.0),
      row(code: PriceCodes.testTruckKm,      desc: 'Test Truck - km',                 unit: 'km',      rate: 0.0),
      row(code: PriceCodes.testTruckOnSite,  desc: 'Test Truck - On Site (per hour)', unit: 'hour',    rate: 110.00),
      row(code: PriceCodes.serviceVehicleKm, desc: 'Service Vehicle - km',            unit: 'km',      rate: 1.30),
      row(code: PriceCodes.parts,            desc: 'Parts (each)',                    unit: 'each',    rate: 0.0),
      // 🔹 Keep the code = misc_percent, but show user-friendly description:
      row(code: PriceCodes.miscPercent,      desc: 'Misc Material & Expense',         unit: 'percent', rate: 12.0),
      row(code: PriceCodes.taxGst,           desc: 'GST',                             unit: 'percent', rate: 5.0),
    ];

    for (final d in defaults) {
      await upsertByCode(d);
    }

    // Clean up any legacy codes so they disappear from the admin list.
    await canonicalizeAliases();
  }
}
