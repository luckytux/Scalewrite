// File: lib/utils/eccentricity_load.dart

import 'dart:math' as math;
import 'scale_precision.dart';

/// Suggest a single eccentricity load (~30% of capacity),
/// snapped to the nearest division.  If the 35% bound exceeds 10 000,
/// no suggestion is returned (0.0).
double suggestEccentricityLoad({
  required double division,
  required double capacity,
  double minPct = 0.25,
  double maxPct = 0.35,
}) {
  if (division <= 0 || capacity <= 0) return 0.0;

  // If the ECC band would require >10 000, don't suggest at all.
  final maxRaw = maxPct * capacity;
  if (maxRaw > 10000.0) return 0.0;

  final target = ((minPct + maxPct) / 2.0) * capacity; // ~30%
  final snapped = quantizeToDivision(target, division);

  // Clamp to the device's valid range [e .. capacity]
  return snapped.clamp(division, capacity);
}

/// Return the exact 25–35% band, snapped to the nearest division.
/// If the 35% bound exceeds 10 000, returns (0.0, 0.0) to signal "no suggestion".
(double, double) suggestEccentricityRange({
  required double division,
  required double capacity,
  double minPct = 0.25,
  double maxPct = 0.35,
}) {
  if (division <= 0 || capacity <= 0) return (0.0, 0.0);

  // If the ECC band would require >10 000, don't suggest at all.
  final maxRaw = maxPct * capacity;
  if (maxRaw > 10000.0) return (0.0, 0.0);

  final lowRaw = minPct * capacity;
  final highRaw = maxPct * capacity;

  var low = quantizeToDivision(lowRaw, division).clamp(division, capacity);
  var high = quantizeToDivision(highRaw, division).clamp(division, capacity);

  if (high < low) {
    final tmp = low; low = high; high = tmp;
  }
  return (low, high);
}
