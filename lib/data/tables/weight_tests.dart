// File: lib/data/tables/weight_tests.dart

import 'package:drift/drift.dart';
import 'service_reports.dart';

class WeightTests extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get serviceReportId => integer().references(ServiceReports, #id)();

  TextColumn get eccentricityType => text().withLength(min: 1, max: 20)();
  IntColumn get eccentricityPoints => integer().withDefault(const Constant(4))();
  TextColumn get eccentricityDirections => text().nullable()();

  // Eccentricity values (as found)
  RealColumn get eccentricity1 => real().nullable()();
  RealColumn get eccentricity2 => real().nullable()();
  RealColumn get eccentricity3 => real().nullable()();
  RealColumn get eccentricity4 => real().nullable()();
  RealColumn get eccentricity5 => real().nullable()();
  RealColumn get eccentricity6 => real().nullable()();
  RealColumn get eccentricity7 => real().nullable()();
  RealColumn get eccentricity8 => real().nullable()();
  RealColumn get eccentricity9 => real().nullable()();
  RealColumn get eccentricity10 => real().nullable()();
  RealColumn get eccentricity11 => real().nullable()();
  RealColumn get eccentricity12 => real().nullable()();
  RealColumn get eccentricity13 => real().nullable()();
  RealColumn get eccentricity14 => real().nullable()();
  RealColumn get eccentricity15 => real().nullable()();
  RealColumn get eccentricity16 => real().nullable()();
  RealColumn get eccentricity17 => real().nullable()();
  RealColumn get eccentricity18 => real().nullable()();
  RealColumn get eccentricity19 => real().nullable()();
  RealColumn get eccentricity20 => real().nullable()();

  // Eccentricity values (as left)
  RealColumn get asLeftEccentricity1 => real().nullable()();
  RealColumn get asLeftEccentricity2 => real().nullable()();
  RealColumn get asLeftEccentricity3 => real().nullable()();
  RealColumn get asLeftEccentricity4 => real().nullable()();
  RealColumn get asLeftEccentricity5 => real().nullable()();
  RealColumn get asLeftEccentricity6 => real().nullable()();
  RealColumn get asLeftEccentricity7 => real().nullable()();
  RealColumn get asLeftEccentricity8 => real().nullable()();
  RealColumn get asLeftEccentricity9 => real().nullable()();
  RealColumn get asLeftEccentricity10 => real().nullable()();
  RealColumn get asLeftEccentricity11 => real().nullable()();
  RealColumn get asLeftEccentricity12 => real().nullable()();
  RealColumn get asLeftEccentricity13 => real().nullable()();
  RealColumn get asLeftEccentricity14 => real().nullable()();
  RealColumn get asLeftEccentricity15 => real().nullable()();
  RealColumn get asLeftEccentricity16 => real().nullable()();
  RealColumn get asLeftEccentricity17 => real().nullable()();
  RealColumn get asLeftEccentricity18 => real().nullable()();
  RealColumn get asLeftEccentricity19 => real().nullable()();
  RealColumn get asLeftEccentricity20 => real().nullable()();

  // Eccentricity errors
  TextColumn get eccentricityError => text().nullable()();
  TextColumn get asLeftEccentricityError => text().nullable()();

  // As Found - Increasing Load Test
  RealColumn get asFoundTest1 => real().nullable()();
  RealColumn get asFoundRead1 => real().nullable()();
  RealColumn get asFoundDiff1 => real().nullable()();
  RealColumn get asFoundTest2 => real().nullable()();
  RealColumn get asFoundRead2 => real().nullable()();
  RealColumn get asFoundDiff2 => real().nullable()();
  RealColumn get asFoundTest3 => real().nullable()();
  RealColumn get asFoundRead3 => real().nullable()();
  RealColumn get asFoundDiff3 => real().nullable()();
  RealColumn get asFoundTest4 => real().nullable()();
  RealColumn get asFoundRead4 => real().nullable()();
  RealColumn get asFoundDiff4 => real().nullable()();
  RealColumn get asFoundTest5 => real().nullable()();
  RealColumn get asFoundRead5 => real().nullable()();
  RealColumn get asFoundDiff5 => real().nullable()();
  RealColumn get asFoundTest6 => real().nullable()();
  RealColumn get asFoundRead6 => real().nullable()();
  RealColumn get asFoundDiff6 => real().nullable()();

  // As Left - Increasing Load Test
  RealColumn get asLeftTest1 => real().nullable()();
  RealColumn get asLeftRead1 => real().nullable()();
  RealColumn get asLeftDiff1 => real().nullable()();
  RealColumn get asLeftTest2 => real().nullable()();
  RealColumn get asLeftRead2 => real().nullable()();
  RealColumn get asLeftDiff2 => real().nullable()();
  RealColumn get asLeftTest3 => real().nullable()();
  RealColumn get asLeftRead3 => real().nullable()();
  RealColumn get asLeftDiff3 => real().nullable()();
  RealColumn get asLeftTest4 => real().nullable()();
  RealColumn get asLeftRead4 => real().nullable()();
  RealColumn get asLeftDiff4 => real().nullable()();
  RealColumn get asLeftTest5 => real().nullable()();
  RealColumn get asLeftRead5 => real().nullable()();
  RealColumn get asLeftDiff5 => real().nullable()();
  RealColumn get asLeftTest6 => real().nullable()();
  RealColumn get asLeftRead6 => real().nullable()();
  RealColumn get asLeftDiff6 => real().nullable()();

  // Notes and unit
  TextColumn get notes => text().nullable()();
  TextColumn get weightTestUnit => text().withLength(min: 1, max: 10).nullable()();

  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>>? get uniqueKeys => [
        {serviceReportId},
      ];
}
