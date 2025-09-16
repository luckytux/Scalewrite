// File: lib/utils/test_plan_suggester.dart

import 'dart:math' as math;
import 'scale_precision.dart';
import 'critical_test_points.dart';

/// Fixed shop logistics.
/// maxCarry is **always** 10 000 (still limited by capacity).
class LogisticsConfig {
  final double smallMax;            // up to this, use 1-2-5 ladder
  final double mediumMax;           // up to this, use mediumStep increments
  final double mediumStep;          // default 20 kg
  final double heavyBlockStep;      // block size for heavy region (e.g., 500 kg)
  final double heavyPreferredStep;  // preferred heavy steps (e.g., 2000 kg)
  final double heavyStart;          // start heavy stepping (e.g., 4000 kg)
  final double maxCarry;            // locked to 10 000

  const LogisticsConfig({
    this.smallMax = 20,
    this.mediumMax = 500,
    this.mediumStep = 20,
    this.heavyBlockStep = 500,
    this.heavyPreferredStep = 2000,
    this.heavyStart = 4000,
    double maxCarry = 10000,
  }) : maxCarry = 10000; // lock
}

/// Suggest test masses that respect:
/// 1) Regulatory/class breakpoints,
/// 2) Your kits: 1-2-5 up to 20, 20-kg steps to 500, 500-kg blocks + 2-t milestones,
/// 3) Always include MAX (aligned to e),
/// 4) Fill remaining slots with well-spaced kit-compatible points up to maxPoints,
/// 5) All values are multiples of e, bounded by min(capacity, 10 000).
List<double> suggestTestMasses({
  required String scaleClass,  // 'III', 'IIIHD', 'IIII', ...
  required double division,    // e
  required double capacity,    // max capacity
  int? n,                      // counts (capacity / e)
  LogisticsConfig cfg = const LogisticsConfig(),
  int maxPoints = 6,
}) {
  final hi = math.min(capacity, cfg.maxCarry);
  final maxAligned = _maxAligned(hi, division);

  // 1) Class/regulatory criticals
  final seeds = <double>{
    ...criticalMassesByClass(scaleClass, division, n: n, capacity: hi),
  };

  // 2) Logistics additions
  seeds.addAll(_kitMasses(division, hi, cfg));

  // 3) Snap all to e; heavy region: also align to block size
  final adjusted = <double>{};
  for (var v in seeds) {
    if (v <= 0) continue;
    if (v > cfg.mediumMax) {
      final step = _commonStep(cfg.heavyBlockStep, division);
      v = _nearestMultiple(v, step);
    }
    v = quantizeToDivision(v, division);
    if (v >= division && v <= hi + 1e-9) adjusted.add(v);
  }

  // 4) Always include MAX (aligned)
  adjusted.add(maxAligned);

  // 5) If we still have fewer than maxPoints, fill evenly with kit-compatible points
  var list = adjusted.toList()..sort();
  if (list.length < maxPoints) {
    final needed = maxPoints - list.length;
    final fillers = _fillBetween(
      existing: list,
      division: division,
      hi: hi,
      cfg: cfg,
      count: needed,
    );
    adjusted.addAll(fillers);
    list = adjusted.toList()..sort();
  }

  // 6) If too many, trim while preserving: all criticals + MAX, spread the rest.
  if (list.length > maxPoints) {
    final criticals = criticalMassesByClass(scaleClass, division, n: n, capacity: hi).toSet();
    final locked = {...criticals, maxAligned}.where((m) => m >= division && m <= hi + 1e-9).toSet();

    // If locked already exceeds maxPoints (rare, e.g., IIIHD with many breaks), sample evenly.
    if (locked.length >= maxPoints) {
      final lk = locked.toList()..sort();
      return _spreadPickFixed(lk, maxPoints);
    }

    // Keep all locked, then spread-pick remaining from the others.
    final remainingBudget = maxPoints - locked.length;
    final others = list.where((m) => !locked.contains(m)).toList();
    final picks = _spreadPickFixed(others, remainingBudget);
    final out = <double>{...locked, ...picks}.toList()..sort();
    return out;
  }

  return list;
}

/// Build “kit” masses:
/// - [0, smallMax] → 1-2-5 ladder
/// - (smallMax, mediumMax] → mediumStep increments (20 kg)
/// - > mediumMax → heavyPreferredStep milestones (2000, 4000, ...), ≤ hi
List<double> _kitMasses(double division, double hi, LogisticsConfig cfg) {
  final masses = <double>[];

  // Small ladder (1-2-5) up to 20
  final smallHi = math.min(hi, cfg.smallMax);
  if (smallHi >= division) {
    masses.addAll(_ladder125UpTo(smallHi));
  }

  // Medium: 20-kg steps up to 500 (quantize later to e)
  final mediumHi = math.min(hi, cfg.mediumMax);
  if (mediumHi > cfg.smallMax) {
    final step = _commonStep(cfg.mediumStep, division);
    for (double m = step; m <= mediumHi + 1e-9; m += step) {
      masses.add(m);
    }
  }

  // Heavy: preferred big steps from heavyStart, clipped by 10 000 and capacity.
  if (hi > cfg.mediumMax) {
    for (double m = cfg.heavyPreferredStep; m <= hi + 1e-9; m += cfg.heavyPreferredStep) {
      if (m >= cfg.heavyStart) masses.add(m);
    }
  }

  return masses;
}

/// Create up to [count] additional points between existing and hi, preferring kit steps
/// (20-kg in medium region) and snapping to e. Ensures uniqueness.
List<double> _fillBetween({
  required List<double> existing,
  required double division,
  required double hi,
  required LogisticsConfig cfg,
  required int count,
}) {
  if (count <= 0) return const [];

  final out = <double>{};
  final used = existing.toSet();

  // Generate a medium series (20-kg compatible with e), capped by hi
  final medStep = _commonStep(cfg.mediumStep, division);
  final medSeries = <double>[];
  for (double m = medStep; m <= math.min(hi, cfg.mediumMax) + 1e-9; m += medStep) {
    medSeries.add(quantizeToDivision(m, division));
  }

  // Targets: even fractions of hi (e.g., 0.25, 0.5, 0.75 → 40, 80, 120 for hi=150)
  final targets = <double>[];
  for (int i = 1; i <= count; i++) {
    final frac = (i) / (count + 1); // spreads inside (0,1)
    targets.add(frac * hi);
  }

  // For each target, pick nearest available from medSeries (or fall back to division grid).
  for (final t in targets) {
    double? pick;

    // Try medium series first
    if (medSeries.isNotEmpty) {
      pick = _nearestFromList(t, medSeries, forbidden: used);
    }

    // Fallback to e-grid
    pick ??= quantizeToDivision(t, division);

    // Keep within bounds & not duplicate
    if (pick >= division && pick <= hi + 1e-9 && !used.contains(pick)) {
      out.add(pick);
      used.add(pick);
      if (out.length >= count) break;
    }
  }

  return out.toList()..sort();
}

double _maxAligned(double capacity, double division) {
  if (division <= 0) return capacity;
  final k = (capacity / division).floor();
  return k * division;
}

/// Evenly pick up to [k] values from [sorted] (assumes ascending).
List<double> _spreadPickFixed(List<double> sorted, int k) {
  if (sorted.isEmpty || k <= 0) return const [];
  if (sorted.length <= k) return List<double>.from(sorted);
  final out = <double>[];
  for (int i = 0; i < k; i++) {
    final idx = ((i * (sorted.length - 1)) / (k - 1)).round();
    out.add(sorted[idx]);
  }
  return out.toSet().toList()..sort();
}

/// 1-2-5 ladder up to [max] (1,2,5,10,20,50,100,200,500,...)
List<double> _ladder125UpTo(double max) {
  final out = <double>[];
  final base = [1.0, 2.0, 5.0];
  double decade = 1.0;
  while (true) {
    bool added = false;
    for (final b in base) {
      final v = b * decade;
      if (v <= max + 1e-9) {
        out.add(v);
        added = true;
      }
    }
    if (!added) break;
    decade *= 10;
  }
  return out;
}

/// Snap [value] to nearest multiple of [step].
double _nearestMultiple(double value, double step) {
  if (step <= 0) return value;
  final k = (value / step).round();
  return k * step;
}

/// From [list], pick nearest to [target] that is not in [forbidden].
double? _nearestFromList(double target, List<double> list, {Set<double>? forbidden}) {
  if (list.isEmpty) return null;
  forbidden ??= {};
  double? best;
  double bestD = double.infinity;
  for (final v in list) {
    if (forbidden.contains(v)) continue;
    final d = (v - target).abs();
    if (d < bestD) {
      bestD = d;
      best = v;
    }
  }
  return best;
}

/// If [blockStep] isn’t a multiple of [division], bump to the next multiple.
double _commonStep(double blockStep, double division) {
  if (isMultipleOfDivision(blockStep, division)) return blockStep;
  final k = (blockStep / division).ceil();
  return k * division;
}
