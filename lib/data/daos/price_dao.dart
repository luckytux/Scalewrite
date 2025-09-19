// File: lib/data/daos/price_dao.dart
import 'package:drift/drift.dart';
import '../tables/prices.dart';
import '../database.dart';

part 'price_dao.g.dart';

class PriceCodes {
  static const labour           = 'labour';
  static const overtime         = 'overtime';
  static const testTruckFlat    = 'test_truck_flat';
  static const testTruckKm      = 'test_truck_km';
  static const testTruckOnSite  = 'test_truck_on_site';
  static const serviceVehicleKm = 'service_vehicle_km';
  static const techTravel       = 'tech_travel';
  static const miscPercent      = 'misc_percent'; // % of (labour + OT + travel)
  static const parts            = 'parts';
  static const taxGst           = 'tax_gst';
}

enum PriceKind { money, percent }

/// Integer-safe price view:
/// - money: `value` = cents
/// - percent: `value` = tenths of a percent (12.0% => 120)
class PriceInfo {
  final String unit;
  final int value;
  final PriceKind kind;
  final bool active;

  const PriceInfo({
    required this.unit,
    required this.value,
    required this.kind,
    this.active = true,
  });

  bool get isMoney => kind == PriceKind.money;
  bool get isPercent => kind == PriceKind.percent;

  /// For money kinds, returns cents.
  int get cents {
    if (!isMoney) throw StateError('Not a money price');
    return value;
  }

  /// For percent kinds, returns tenths of a percent (bps10).
  /// Example: 12.0% => 120
  int get bps10 {
    if (!isPercent) throw StateError('Not a percent price');
    return value;
  }

  /// Human label, integer-safe (no doubles in state).
  String formatted({String? qtyLabel}) {
    if (isPercent) {
      final pctStr = (bps10 / 10).toStringAsFixed(1); // 12.0
      return '$pctStr%';
    }
    final dollars = (cents / 100).toStringAsFixed(2);
    final qty = qtyLabel ?? _defaultQtyLabel(unit);
    return '$qty @ \$$dollars / $unit';
  }

  static String _defaultQtyLabel(String unit) {
    switch (unit) {
      case 'hour': return 'hours';
      case 'km':   return 'km';
      case 'flat': return 'flat';
      case 'each': return 'each';
      default:     return unit;
    }
  }

  /// Apply this percentage to a money amount (in cents), rounded to nearest cent.
  /// Only valid when `isPercent == true`.
  int applyPercentToCents(int baseCents) {
    if (!isPercent) throw StateError('applyPercentToCents requires a percent price');
    // bps10 is tenths of a percent => divide by 1000 to get decimal
    // round to nearest cent:
    final numerator = baseCents * bps10;
    return (numerator + 500) ~/ 1000; // +500 for rounding
  }
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

  /// Integer-safe getter:
  /// - money: cents (int)
  /// - percent: tenths-of-a-percent (int, e.g., 12.0% -> 120)
  Future<PriceInfo?> getUnitPrice(String code) async {
    final p = await getByCode(code);
    if (p == null) return null;

    if (p.unit.toLowerCase() == 'percent') {
      // Store as tenths-of-a-percent to allow one decimal place.
      final bps10 = (p.rate * 10).round(); // 12.0 -> 120
      return PriceInfo(
        unit: p.unit,
        value: bps10,
        kind: PriceKind.percent,
        active: p.active,
      );
    } else {
      // Money → cents
      final cents = (p.rate * 100).round();
      return PriceInfo(
        unit: p.unit,
        value: cents,
        kind: PriceKind.money,
        active: p.active,
      );
    }
  }

  /// Convenience: human label like "hours @ $127.00 / hour" or "12.0%"
  Future<String> formatUnitPrice(String code, {String? qtyLabel}) async {
    final info = await getUnitPrice(code);
    if (info == null) return '';
    return info.formatted(qtyLabel: qtyLabel);
  }

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
  static const Map<String, List<String>> _aliases = {
    PriceCodes.testTruckOnSite: ['test_truck_onsite', 'tt_on_site', 'testtruck_on_site'],
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
      row(code: PriceCodes.miscPercent,      desc: 'Misc Material & Expense',         unit: 'percent', rate: 12.0),
      row(code: PriceCodes.taxGst,           desc: 'GST',                             unit: 'percent', rate: 5.0),
    ];

    for (final d in defaults) {
      await upsertByCode(d);
    }

    await canonicalizeAliases();
  }
}
