// File: lib/utils/scale_classification.dart

/// Compute number of verification intervals n = capacity / e.
int? countsFromCapacity({required double? capacity, required double? division}) {
  if (capacity == null || division == null || division <= 0) return null;
  return (capacity / division).floor();
}

/// Heuristic classification using chart ranges if class not stored.
/// Priority heuristics (SI):
/// - IIIHD if e >= 2 kg
/// - IIII if n in [100, 1200] and e >= 0.005 kg
/// - III  if n in [100, 10000] and e >= 0.0001 kg
/// - II   if n in [100, 100000]
/// - I    if n >= 50000
String inferScaleClass({
  required double? division, // kg
  required int? n,
}) {
  final e = division ?? 0;

  if (e >= 2.0) return 'IIIHD';
  if (n != null) {
    if (n >= 50000) return 'I';
    if (n >= 100 && n <= 1200 && e >= 0.005) return 'IIII';
    if (n >= 100 && n <= 10000 && e >= 0.0001) return 'III';
    if (n >= 100 && n <= 100000) return 'II';
  }
  return 'III';
}
