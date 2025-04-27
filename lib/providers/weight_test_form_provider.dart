// File: lib/providers/weight_test_form_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import '../providers/drift_providers.dart';
import 'package:drift/drift.dart';

final weightTestFormProvider = ChangeNotifierProvider<WeightTestFormController>((ref) {
  return WeightTestFormController(ref);
});

class WeightTestFormController extends ChangeNotifier {
  final Ref ref;
  final formKey = GlobalKey<FormState>();

  int? serviceReportId; // Always required

  // 🔵 ADD: Division field
  double division = 10;

  // Eccentricity test fields
  String eccentricityType = 'Section'; // 'Section' or 'Directional'
  int eccentricityPoints = 4;
  String? eccentricityDirections; // Only if Directional
  List<double?> eccentricityValues = List.filled(20, null); // Up to 20 for directional
  String? eccentricityError;

  // Increasing Load Test - As Found
  List<double?> asFoundTests = List.filled(6, null);
  List<double?> asFoundReads = List.filled(6, null);
  List<double?> asFoundDiffs = List.filled(6, null);

  // Increasing Load Test - As Left
  List<double?> asLeftTests = List.filled(6, null);
  List<double?> asLeftReads = List.filled(6, null);
  List<double?> asLeftDiffs = List.filled(6, null);

  bool showAsLeft = false; // Toggle As Left tests

  String? notes;
  String weightTestUnit = 'kg'; // NEW

  WeightTestFormController(this.ref);

  void setServiceReportId(int id) {
    serviceReportId = id;
    notifyListeners();
  }

  // 🔵 ADD: Division setter
  void setDivision(double value) {
    division = value;
    notifyListeners();
  }

  void setEccentricityType(String type) {
    eccentricityType = type;
    notifyListeners();
  }

  void setEccentricityPoints(int points) {
    eccentricityPoints = points.clamp(1, 10);
    notifyListeners();
  }

  void setEccentricityDirections(String? value) {
    eccentricityDirections = value;
    notifyListeners();
  }

  void setEccentricityValue(int index, double? value) {
    if (index >= 0 && index < eccentricityValues.length) {
      eccentricityValues[index] = value;
      notifyListeners();
    }
  }

  // 🔵 ADD: Eccentricity value getter
  double? getEccentricityValue(int index) {
    if (index >= 0 && index < eccentricityValues.length) {
      return eccentricityValues[index];
    }
    return null;
  }

  void setEccentricityError(String? value) {
    eccentricityError = value;
    notifyListeners();
  }

  // 🔵 ADD: Directions options getter
  List<String> get directionOptions => [
    'North', 'East', 'South', 'West', 'NE', 'SE', 'SW', 'NW'
  ];

  void setAsFoundTest(int index, double? value) {
    if (index >= 0 && index < asFoundTests.length) {
      asFoundTests[index] = value;
      _updateAsFoundDiff(index);
      notifyListeners();
    }
  }

  void setAsFoundRead(int index, double? value) {
    if (index >= 0 && index < asFoundReads.length) {
      asFoundReads[index] = value;
      _updateAsFoundDiff(index);
      notifyListeners();
    }
  }

  void _updateAsFoundDiff(int index) {
    final test = asFoundTests[index];
    final read = asFoundReads[index];
    if (test != null && read != null) {
      asFoundDiffs[index] = read - test;
    }
  }

  void setAsLeftTest(int index, double? value) {
    if (index >= 0 && index < asLeftTests.length) {
      asLeftTests[index] = value;
      _updateAsLeftDiff(index);
      notifyListeners();
    }
  }

  void setAsLeftRead(int index, double? value) {
    if (index >= 0 && index < asLeftReads.length) {
      asLeftReads[index] = value;
      _updateAsLeftDiff(index);
      notifyListeners();
    }
  }

  void _updateAsLeftDiff(int index) {
    final test = asLeftTests[index];
    final read = asLeftReads[index];
    if (test != null && read != null) {
      asLeftDiffs[index] = read - test;
    }
  }

  void toggleShowAsLeft(bool value) {
    showAsLeft = value;
    notifyListeners();
  }

  void setNotes(String? value) {
    notes = value;
    notifyListeners();
  }

  void setWeightTestUnit(String value) {
    weightTestUnit = value;
    notifyListeners();
  }

  String formatDiff(double diff, double division) {
    final eValue = (diff / division).abs();
    final formattedDiff = diff.toStringAsFixed(
      division >= 10 ? 0 : (division >= 1 ? 1 : (division >= 0.1 ? 2 : 3)),
    );
    final formattedE = eValue.toStringAsFixed(0); // Always whole number
    return '$formattedDiff (e=$formattedE)';
  }

  Future<bool> save() async {
    if (!formKey.currentState!.validate() || serviceReportId == null) {
      return false;
    }

    final dao = ref.read(weightTestDaoProvider);

    final entry = WeightTestsCompanion(
      serviceReportId: Value(serviceReportId!),
      eccentricityType: Value(eccentricityType),
      eccentricityPoints: Value(eccentricityPoints),
      eccentricityDirections: Value(eccentricityDirections),
      weightTestUnit: Value(weightTestUnit),
      eccentricity1: Value(eccentricityValues[0]),
      eccentricity2: Value(eccentricityValues[1]),
      eccentricity3: Value(eccentricityValues[2]),
      eccentricity4: Value(eccentricityValues[3]),
      eccentricity5: Value(eccentricityValues[4]),
      eccentricity6: Value(eccentricityValues[5]),
      eccentricity7: Value(eccentricityValues[6]),
      eccentricity8: Value(eccentricityValues[7]),
      eccentricity9: Value(eccentricityValues[8]),
      eccentricity10: Value(eccentricityValues[9]),
      eccentricityError: Value(eccentricityError),
      asFoundTest1: Value(asFoundTests[0]),
      asFoundRead1: Value(asFoundReads[0]),
      asFoundDiff1: Value(asFoundDiffs[0]),
      asFoundTest2: Value(asFoundTests[1]),
      asFoundRead2: Value(asFoundReads[1]),
      asFoundDiff2: Value(asFoundDiffs[1]),
      asFoundTest3: Value(asFoundTests[2]),
      asFoundRead3: Value(asFoundReads[2]),
      asFoundDiff3: Value(asFoundDiffs[2]),
      asFoundTest4: Value(asFoundTests[3]),
      asFoundRead4: Value(asFoundReads[3]),
      asFoundDiff4: Value(asFoundDiffs[3]),
      asFoundTest5: Value(asFoundTests[4]),
      asFoundRead5: Value(asFoundReads[4]),
      asFoundDiff5: Value(asFoundDiffs[4]),
      asFoundTest6: Value(asFoundTests[5]),
      asFoundRead6: Value(asFoundReads[5]),
      asFoundDiff6: Value(asFoundDiffs[5]),
      asLeftTest1: Value(asLeftTests[0]),
      asLeftRead1: Value(asLeftReads[0]),
      asLeftDiff1: Value(asLeftDiffs[0]),
      asLeftTest2: Value(asLeftTests[1]),
      asLeftRead2: Value(asLeftReads[1]),
      asLeftDiff2: Value(asLeftDiffs[1]),
      asLeftTest3: Value(asLeftTests[2]),
      asLeftRead3: Value(asLeftReads[2]),
      asLeftDiff3: Value(asLeftDiffs[2]),
      asLeftTest4: Value(asLeftTests[3]),
      asLeftRead4: Value(asLeftReads[3]),
      asLeftDiff4: Value(asLeftDiffs[3]),
      asLeftTest5: Value(asLeftTests[4]),
      asLeftRead5: Value(asLeftReads[4]),
      asLeftDiff5: Value(asLeftDiffs[4]),
      asLeftTest6: Value(asLeftTests[5]),
      asLeftRead6: Value(asLeftReads[5]),
      asLeftDiff6: Value(asLeftDiffs[5]),
      notes: Value(notes ?? ''),
    );

    await dao.insertWeightTest(entry);
    return true;
  }
}
