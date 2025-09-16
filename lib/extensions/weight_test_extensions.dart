// File: lib/extensions/weight_test_extensions.dart

import '../../data/database.dart';

extension WeightTestAccessors on WeightTest {
  double? getEccentricity(int i) => switch (i) {
    1 => eccentricity1,
    2 => eccentricity2,
    3 => eccentricity3,
    4 => eccentricity4,
    5 => eccentricity5,
    6 => eccentricity6,
    7 => eccentricity7,
    8 => eccentricity8,
    9 => eccentricity9,
    10 => eccentricity10,
    11 => eccentricity11,
    12 => eccentricity12,
    13 => eccentricity13,
    14 => eccentricity14,
    15 => eccentricity15,
    16 => eccentricity16,
    17 => eccentricity17,
    18 => eccentricity18,
    19 => eccentricity19,
    20 => eccentricity20,
    _ => null,
  };

  double? getAsLeftEccentricity(int i) => switch (i) {
    1 => asLeftEccentricity1,
    2 => asLeftEccentricity2,
    3 => asLeftEccentricity3,
    4 => asLeftEccentricity4,
    5 => asLeftEccentricity5,
    6 => asLeftEccentricity6,
    7 => asLeftEccentricity7,
    8 => asLeftEccentricity8,
    9 => asLeftEccentricity9,
    10 => asLeftEccentricity10,
    11 => asLeftEccentricity11,
    12 => asLeftEccentricity12,
    13 => asLeftEccentricity13,
    14 => asLeftEccentricity14,
    15 => asLeftEccentricity15,
    16 => asLeftEccentricity16,
    17 => asLeftEccentricity17,
    18 => asLeftEccentricity18,
    19 => asLeftEccentricity19,
    20 => asLeftEccentricity20,
    _ => null,
  };

  double? getAsFoundTest(int i) => switch (i) {
    1 => asFoundTest1,
    2 => asFoundTest2,
    3 => asFoundTest3,
    4 => asFoundTest4,
    5 => asFoundTest5,
    6 => asFoundTest6,
    _ => null,
  };

  double? getAsFoundRead(int i) => switch (i) {
    1 => asFoundRead1,
    2 => asFoundRead2,
    3 => asFoundRead3,
    4 => asFoundRead4,
    5 => asFoundRead5,
    6 => asFoundRead6,
    _ => null,
  };

  double? getAsLeftTest(int i) => switch (i) {
    1 => asLeftTest1,
    2 => asLeftTest2,
    3 => asLeftTest3,
    4 => asLeftTest4,
    5 => asLeftTest5,
    6 => asLeftTest6,
    _ => null,
  };

  double? getAsLeftRead(int i) => switch (i) {
    1 => asLeftRead1,
    2 => asLeftRead2,
    3 => asLeftRead3,
    4 => asLeftRead4,
    5 => asLeftRead5,
    6 => asLeftRead6,
    _ => null,
  };
}

extension WeightTestLists on WeightTest {
  List<double?> get eccentricity => List.generate(20, (i) => getEccentricity(i + 1));
  List<double?> get asLeftEccentricity => List.generate(20, (i) => getAsLeftEccentricity(i + 1));
  List<double?> get asFoundTest => List.generate(6, (i) => getAsFoundTest(i + 1));
  List<double?> get asFoundRead => List.generate(6, (i) => getAsFoundRead(i + 1));
  List<double?> get asLeftTest => List.generate(6, (i) => getAsLeftTest(i + 1));
  List<double?> get asLeftRead => List.generate(6, (i) => getAsLeftRead(i + 1));

  String? get unit => weightTestUnit;
}
