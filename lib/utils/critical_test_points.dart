// File: lib/utils/critical_test_points.dart

import 'dart:math' as math;
import 'scale_precision.dart';

/// Convert counts (n) to a mass list using [division], clamped by [capacity] if provided.
List<double> _countsToMasses(
  List<int> counts,
  double division, {
  double? capacity,
}) {
  final hi = capacity ?? double.infinity;
  return counts
      .map((c) => c * division)
      .where((m) => m > 0 && m <= hi + 1e-9)
      .toList();
}

/// Limits-of-error break **counts** for each class (where the LOE band changes).
/// Returned values are counts (multiples of e). We convert to mass later.
///
/// Class I:   breaks at 50 000, 200 000
/// Class II:  breaks at 5 000, 20 000, 100 000
/// Class III: breaks at 500, 2 000, 4 000
/// Class IIII:breaks at 50, 200, 400, 1 200
///
/// Class IIIHD (special): ±1e up to 500e; then add ±1e each additional 800e,
/// up to a maximum of ±22e. We model “breaks” at 500e, 500e+800e, 500e+2×800e, …
List<int> _breakCountsForClass(String scaleClass, {int? n}) {
  final klass = scaleClass.trim().toUpperCase();

  List<int> cutoffs;
  switch (klass) {
    case 'I':
      cutoffs = [50000, 200000];
      break;
    case 'II':
      cutoffs = [5000, 20000, 100000];
      break;
    case 'III':
      cutoffs = [500, 2000, 4000];
      break;
    case 'IIII':
      cutoffs = [50, 200, 400, 1200];
      break;
    case 'IIIHD':
      final out = <int>[];
      final limit = n ?? (1 << 30);
      if (500 <= limit) out.add(500);
      // 500 + k*800, k = 1..21 (to reach ±22e), or until capacity limit
      for (int k = 1; k <= 21; k++) {
        final v = 500 + k * 800;
        if (v > limit) break;
        out.add(v);
      }
      return out;
    default:
      // Fallback to Class III profile
      cutoffs = [500, 2000, 4000];
      break;
  }

  if (n != null) {
    cutoffs = cutoffs.where((c) => c <= n).toList();
  }
  return cutoffs;
}

/// Public: critical **masses** (kg/lb) for the given class/division/capacity.
/// If [n] (counts) isn’t passed, it will be inferred from [capacity]/[division] when possible.
List<double> criticalMassesByClass(
  String scaleClass,
  double division, {
  int? n,
  double? capacity,
}) {
  final inferredN =
      n ?? ((capacity != null && division > 0) ? (capacity / division).floor() : null);
  final counts = _breakCountsForClass(scaleClass, n: inferredN);
  return _countsToMasses(counts, division, capacity: capacity);
}

/// Return the list of **critical masses that are missing** from the user’s [testMasses].
/// Matching is tolerant: each user mass is snapped to a multiple of [division],
/// then considered a hit if it’s within ±division/2 of a required critical mass.
///
/// - [scaleClass] : 'III', 'IIIHD', 'IIII', etc.
/// - [division]   : e (same unit as capacity & testMasses)
/// - [testMasses] : the masses the user actually entered (may be non-multiples of e)
/// - [capacity]   : device max capacity (suggestions are capped by min(capacity, 10_000))
/// - [n]          : counts = capacity/e (optional; inferred if not given)
/// - [maxCarry]   : shop policy; default 10 000 and further limited by capacity
List<double> missingCriticalMasses({
  required String scaleClass,
  required double division,
  required List<double?> testMasses,
  double? capacity,
  int? n,
  double maxCarry = 10000,
}) {
  // Cap by policy (10 000) and device capacity if provided.
  final hi = capacity == null ? maxCarry : math.min(capacity, maxCarry);

  // Required critical points from class break counts.
  final required = criticalMassesByClass(
    scaleClass,
    division,
    n: n,
    capacity: hi,
  );

  if (required.isEmpty) return const [];

  // Normalize user entries: snap to e, drop out-of-range/invalid.
  final normalized = testMasses
      .whereType<double>()
      .map((m) => quantizeToDivision(m, division))
      .where((m) => m > 0 && m <= hi + 1e-9)
      .toSet();

  // Tolerance: half a division.
  final eps = division / 2;

  final missing = <double>[];
  for (final req in required) {
    final covered = normalized.any((m) => (m - req).abs() <= eps);
    if (!covered) missing.add(req);
  }
  return missing;
}
