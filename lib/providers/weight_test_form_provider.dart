// File: lib/providers/weight_test_form_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;

import '../extensions/weight_test_extensions.dart';
import '../data/database.dart';
import 'drift_providers.dart';
import '../utils/scale_precision.dart';

class WeightTestFormController extends ChangeNotifier {
  final Ref ref;
  WeightTestFormController(this.ref);

  final formKey = GlobalKey<FormState>();

  int? _serviceReportId;
  double division = 10;
  String eccentricityType = 'Section';
  int eccentricityPoints = 4;
  String weightTestUnit = 'kg';
  String? eccentricityDirections;
  bool showAsLeft = false;

  List<double?> eccentricityValues = List.filled(20, null);
  List<double?> asLeftEccentricityValues = List.filled(20, null);

  List<double?> asFoundTests = List.filled(6, null);
  List<double?> asFoundReads = List.filled(6, null);
  List<double?> asLeftTests = List.filled(6, null);
  List<double?> asLeftReads = List.filled(6, null);

  // ---------- Reset for a brand-new form ----------
  void reset({double? newDivision, int? newEccPoints}) {
    _serviceReportId = null;
    division = newDivision ?? division;
    eccentricityType = 'Section';
    eccentricityPoints = newEccPoints ?? 4;
    weightTestUnit = 'kg';
    eccentricityDirections = null;
    showAsLeft = false;

    eccentricityValues = List.filled(20, null);
    asLeftEccentricityValues = List.filled(20, null);
    asFoundTests = List.filled(6, null);
    asFoundReads = List.filled(6, null);
    asLeftTests = List.filled(6, null);
    asLeftReads = List.filled(6, null);

    notifyListeners();
  }
  // -----------------------------------------------

  List<double?> get asFoundDiffs => List.generate(6, (i) {
        final test = asFoundTests[i];
        final read = asFoundReads[i];
        if (test == null || read == null) return null;
        return read - test;
      });

  List<double?> get asLeftDiffs => List.generate(6, (i) {
        final test = asLeftTests[i];
        final read = asLeftReads[i];
        if (test == null || read == null) return null;
        return read - test;
      });

  List<String> get directionOptions => ['N', 'S', 'E', 'W', 'NE', 'NW', 'SE', 'SW'];
  bool get isDirectional => eccentricityType.toLowerCase() == 'directional';

  void setServiceReportId(int id) => _serviceReportId = id;

  void setDivision(double value) {
    division = value;
    notifyListeners();
  }

  void setEccentricityType(String type) {
    eccentricityType = type;
    notifyListeners();
  }

  void setEccentricityPoints(int value) {
    eccentricityPoints = value;
    notifyListeners();
  }

  void setWeightTestUnit(String unit) {
    weightTestUnit = unit;
    notifyListeners();
  }

  void setEccentricityDirections(String? value) {
    eccentricityDirections = value;
    notifyListeners();
  }

  void toggleShowAsLeft(bool value) {
    showAsLeft = value;
    notifyListeners();
  }

  void setEccentricityValue(int index, double? value) {
    if (index < eccentricityValues.length) {
      eccentricityValues[index] = value;
      notifyListeners();
    }
  }

  void setAsLeftEccentricityValue(int index, double? value) {
    if (index < asLeftEccentricityValues.length) {
      asLeftEccentricityValues[index] = value;
      notifyListeners();
    }
  }

  double? getEccentricityValue(int index) =>
      index < eccentricityValues.length ? eccentricityValues[index] : null;

  double? getAsLeftEccentricityValue(int index) =>
      index < asLeftEccentricityValues.length ? asLeftEccentricityValues[index] : null;

  void setAsFoundTest(int index, double? value) {
    if (index < 6) {
      asFoundTests[index] = value;
      notifyListeners();
    }
  }

  void setAsFoundRead(int index, double? value) {
    if (index < 6) {
      asFoundReads[index] = value;
      notifyListeners();
    }
  }

  void setAsLeftTest(int index, double? value) {
    if (index < 6) {
      asLeftTests[index] = value;
      notifyListeners();
    }
  }

  void setAsLeftRead(int index, double? value) {
    if (index < 6) {
      asLeftReads[index] = value;
      notifyListeners();
    }
  }

  void copyEccentricityValues() {
    for (int i = 0; i < eccentricityValues.length; i++) {
      asLeftEccentricityValues[i] = eccentricityValues[i];
    }
    notifyListeners();
  }

  void copyIncreasingValues() {
    for (int i = 0; i < 6; i++) {
      asLeftTests[i] = asFoundTests[i];
      asLeftReads[i] = asFoundReads[i];
    }
    notifyListeners();
  }

  /// Pretty diff string; when diff == 0, shows "(0e)".
  String formatDiff(double diff) {
    final dec = decimalsForDivision(division);
    final sign = diff > 0 ? '+' : (diff < 0 ? '−' : '±');
    final errStr = (diff.abs()).toStringAsFixed(dec);
    final eDiffRounded = (diff / division).round();
    final ePart = '(${eDiffRounded.abs()}e)';
    return '$sign$errStr $ePart';
  }

  Future<void> loadFromExisting(WeightTest test) async {
    _serviceReportId = test.serviceReportId;
    eccentricityType = test.eccentricityType;
    eccentricityDirections = test.eccentricityDirections;
    eccentricityPoints = test.eccentricityPoints;
    weightTestUnit = test.unit ?? 'kg';

    for (int i = 0; i < 20; i++) {
      final value = test.eccentricity[i];
      if (value != null) eccentricityValues[i] = value;
    }
    for (int i = 0; i < 20; i++) {
      final value = test.asLeftEccentricity[i];
      if (value != null) asLeftEccentricityValues[i] = value;
    }
    for (int i = 0; i < 6; i++) {
      if (test.asFoundTest[i] != null) asFoundTests[i] = test.asFoundTest[i]!;
      if (test.asFoundRead[i] != null) asFoundReads[i] = test.asFoundRead[i]!;
      if (test.asLeftTest[i] != null) asLeftTests[i] = test.asLeftTest[i]!;
      if (test.asLeftRead[i] != null) asLeftReads[i] = test.asLeftRead[i]!;
    }
    notifyListeners();
  }

  Future<bool> save() async {
    if (_serviceReportId == null) {
      debugPrint('❌ No serviceReportId set, cannot save weight test.');
      return false;
    }

    final db = ref.read(databaseProvider);

    final entry = WeightTestsCompanion(
      serviceReportId: drift.Value(_serviceReportId!),
      eccentricityType: drift.Value(eccentricityType),
      eccentricityPoints: drift.Value(eccentricityPoints),
      eccentricityDirections: drift.Value(eccentricityDirections),
      weightTestUnit: drift.Value(weightTestUnit),

      // Eccentricity (As Found)
      eccentricity1: drift.Value(eccentricityValues[0]),
      eccentricity2: drift.Value(eccentricityValues[1]),
      eccentricity3: drift.Value(eccentricityValues[2]),
      eccentricity4: drift.Value(eccentricityValues[3]),
      eccentricity5: drift.Value(eccentricityValues[4]),
      eccentricity6: drift.Value(eccentricityValues[5]),
      eccentricity7: drift.Value(eccentricityValues[6]),
      eccentricity8: drift.Value(eccentricityValues[7]),
      eccentricity9: drift.Value(eccentricityValues[8]),
      eccentricity10: drift.Value(eccentricityValues[9]),
      eccentricity11: drift.Value(eccentricityValues[10]),
      eccentricity12: drift.Value(eccentricityValues[11]),
      eccentricity13: drift.Value(eccentricityValues[12]),
      eccentricity14: drift.Value(eccentricityValues[13]),
      eccentricity15: drift.Value(eccentricityValues[14]),
      eccentricity16: drift.Value(eccentricityValues[15]),
      eccentricity17: drift.Value(eccentricityValues[16]),
      eccentricity18: drift.Value(eccentricityValues[17]),
      eccentricity19: drift.Value(eccentricityValues[18]),
      eccentricity20: drift.Value(eccentricityValues[19]),

      // As Found Increasing
      asFoundTest1: drift.Value(asFoundTests[0]),
      asFoundRead1: drift.Value(asFoundReads[0]),
      asFoundTest2: drift.Value(asFoundTests[1]),
      asFoundRead2: drift.Value(asFoundReads[1]),
      asFoundTest3: drift.Value(asFoundTests[2]),
      asFoundRead3: drift.Value(asFoundReads[2]),
      asFoundTest4: drift.Value(asFoundTests[3]),
      asFoundRead4: drift.Value(asFoundReads[3]),
      asFoundTest5: drift.Value(asFoundTests[4]),
      asFoundRead5: drift.Value(asFoundReads[4]),
      asFoundTest6: drift.Value(asFoundTests[5]),
      asFoundRead6: drift.Value(asFoundReads[5]),

      // As Left Increasing
      asLeftTest1: drift.Value(asLeftTests[0]),
      asLeftRead1: drift.Value(asLeftReads[0]),
      asLeftTest2: drift.Value(asLeftTests[1]),
      asLeftRead2: drift.Value(asLeftReads[1]),
      asLeftTest3: drift.Value(asLeftTests[2]),
      asLeftRead3: drift.Value(asLeftReads[2]),
      asLeftTest4: drift.Value(asLeftTests[3]),
      asLeftRead4: drift.Value(asLeftReads[3]),
      asLeftTest5: drift.Value(asLeftTests[4]),
      asLeftRead5: drift.Value(asLeftReads[4]),
      asLeftTest6: drift.Value(asLeftTests[5]),
      asLeftRead6: drift.Value(asLeftReads[5]),
    );

    try {
      await db.weightTestDao.upsertByServiceReportId(entry);
      return true;
    } catch (e, st) {
      debugPrint('❌ Error upserting WeightTest: $e');
      debugPrintStack(stackTrace: st);
      return false;
    }
  }
}

// 🔁 Auto-dispose so state doesn't leak across pages
final weightTestFormProvider =
    ChangeNotifierProvider.autoDispose<WeightTestFormController>((ref) {
  return WeightTestFormController(ref);
});
