// File: lib/utils/scale_precision.dart

import 'dart:math';

int decimalsForDivision(num division) {
  if (division <= 0) return 0;
  final s = division.toString();
  final dot = s.indexOf('.');
  if (dot < 0) return 0;
  return s.length - dot - 1;
}

double quantizeToDivision(num value, num division) {
  if (division <= 0) return value.toDouble();
  final q = (value / division).round();
  return (q * division).toDouble(); // ✅ ensure double
}

bool isMultipleOfDivision(num value, num division, {double eps = 1e-9}) {
  if (division <= 0) return true;
  final r = (value / division) - (value / division).round();
  return r.abs() < eps;
}

({double error, double divsExact, int divsRounded})
computeError(num read, num test, num division) {
  final err = (read - test).toDouble();
  final de = division <= 0 ? 0.0 : (err / division);
  final dr = division <= 0 ? 0 : (err / division).round();
  return (error: err, divsExact: de, divsRounded: dr);
}

String formatFixed(num value, int decimals) =>
    value.toStringAsFixed(max(0, decimals));
