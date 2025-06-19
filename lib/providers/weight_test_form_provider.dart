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

  int? serviceReportId;

  double division = 10;
  String eccentricityType = 'Section';
  int eccentricityPoints = 4;
  String? eccentricityDirections;

  List<double?> eccentricityValues = List.filled(20, null);
  List<double?> asLeftEccentricityValues = List.filled(20, null);
  String? eccentricityError;

  List<String> sectionLabels = ['1', '2', '3', '4'];

  List<double?> asFoundTests = List.filled(6, null);
  List<double?> asFoundReads = List.filled(6, null);
  List<double?> asFoundDiffs = List.filled(6, null);

  List<double?> asLeftTests = List.filled(6, null);
  List<double?> asLeftReads = List.filled(6, null);
  List<double?> asLeftDiffs = List.filled(6, null);

  bool showAsLeft = false;

  String? notes;
  String weightTestUnit = 'kg';

  // Controllers
  final List<TextEditingController> asLeftEccControllers = List.generate(20, (_) => TextEditingController());
  final List<TextEditingController> asLeftTestControllers = List.generate(6, (_) => TextEditingController());
  final List<TextEditingController> asLeftReadControllers = List.generate(6, (_) => TextEditingController());

  WeightTestFormController(this.ref);

  bool get isDirectional => eccentricityType.toLowerCase() == 'directional';

  Future<void> setServiceReportId(int id) async {
    serviceReportId = id;
    final db = ref.read(databaseProvider);
    final srWithScale = await db.serviceReportsDao.getById(id);

    if (srWithScale != null) {
      final sectionCount = srWithScale.scale.numberOfSections;
      final labels = List.generate(sectionCount, (i) => (i + 1).toString());
      setSectionLabels(labels);
    } else {
      setSectionLabels(['1', '2', '3', '4']);
    }

    notifyListeners();
  }

  void setDivision(double value) {
    division = value;
    notifyListeners();
  }

  void setEccentricityType(String type) {
    eccentricityType = type;
    notifyListeners();
  }

  void setEccentricityPoints(int points) {
    eccentricityPoints = points.clamp(1, 20);
    notifyListeners();
  }

  void setSectionLabels(List<String> labels) {
    sectionLabels = labels;
    eccentricityPoints = labels.length;
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

  double? getEccentricityValue(int index) {
    if (index >= 0 && index < eccentricityValues.length) {
      return eccentricityValues[index];
    }
    return null;
  }

  void setAsLeftEccentricityValue(int index, double? value) {
    if (index >= 0 && index < asLeftEccentricityValues.length) {
      asLeftEccentricityValues[index] = value;
      asLeftEccControllers[index].text = value?.toString() ?? '';
      notifyListeners();
    }
  }

  double? getAsLeftEccentricityValue(int index) {
    if (index >= 0 && index < asLeftEccentricityValues.length) {
      return asLeftEccentricityValues[index];
    }
    return null;
  }

  void setEccentricityError(String? value) {
    eccentricityError = value;
    notifyListeners();
  }

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
      final roundedTest = (test / division).round() * division;
      final diff = read - roundedTest;
      asFoundDiffs[index] = diff;
    }
  }

  void setAsLeftTest(int index, double? value) {
    if (index >= 0 && index < asLeftTests.length) {
      asLeftTests[index] = value;
      asLeftTestControllers[index].text = value?.toString() ?? '';
      _updateAsLeftDiff(index);
      notifyListeners();
    }
  }

  void setAsLeftRead(int index, double? value) {
    if (index >= 0 && index < asLeftReads.length) {
      asLeftReads[index] = value;
      asLeftReadControllers[index].text = value?.toString() ?? '';
      _updateAsLeftDiff(index);
      notifyListeners();
    }
  }

  void _updateAsLeftDiff(int index) {
    final test = asLeftTests[index];
    final read = asLeftReads[index];
    if (test != null && read != null) {
      final roundedTest = (test / division).round() * division;
      final diff = read - roundedTest;
      asLeftDiffs[index] = diff;
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
    final rounded = diff.abs() < 0.0001 ? 0.0 : diff;
    final eValue = (rounded / division).abs();
    final formattedDiff = rounded.toStringAsFixed(
      division >= 10 ? 0 : (division >= 1 ? 1 : (division >= 0.1 ? 2 : 3)),
    );
    final formattedE = eValue.toStringAsFixed(0);
    return '$formattedDiff (e=$formattedE)';
  }

  void copyEccentricityValues() {
    for (int i = 0; i < eccentricityValues.length; i++) {
      final value = eccentricityValues[i];
      asLeftEccentricityValues[i] = value;
      asLeftEccControllers[i].text = value?.toString() ?? '';
    }
    notifyListeners();
  }

  void copyIncreasingValues() {
    for (int i = 0; i < asFoundTests.length; i++) {
      final test = asFoundTests[i];
      final read = asFoundReads[i];

      asLeftTests[i] = test;
      asLeftReads[i] = read;

      asLeftTestControllers[i].text = test?.toString() ?? '';
      asLeftReadControllers[i].text = read?.toString() ?? '';

      _updateAsLeftDiff(i);
    }
    notifyListeners();
  }

  void resetForm() {
    division = 10;
    eccentricityType = 'Section';
    eccentricityPoints = 4;
    eccentricityDirections = null;
    eccentricityValues = List.filled(20, null);
    asLeftEccentricityValues = List.filled(20, null);
    eccentricityError = null;
    asFoundTests = List.filled(6, null);
    asFoundReads = List.filled(6, null);
    asFoundDiffs = List.filled(6, null);
    asLeftTests = List.filled(6, null);
    asLeftReads = List.filled(6, null);
    asLeftDiffs = List.filled(6, null);
    showAsLeft = false;
    notes = null;
    weightTestUnit = 'kg';

    for (final c in asLeftEccControllers) {
      c.clear();
    }
    for (final c in asLeftTestControllers) {
      c.clear();
    }
    for (final c in asLeftReadControllers) {
      c.clear();
    }

    notifyListeners();
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
