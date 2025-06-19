// File: lib/data/tables/weight_tests.dart

import 'package:drift/drift.dart';
import 'service_reports.dart';

class WeightTests extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Link to ServiceReport
  IntColumn get serviceReportId => integer().references(ServiceReports, #id)();

  // Type of eccentricity test (sectional or directional)
  TextColumn get eccentricityType => text().withLength(min: 1, max: 20)();

  // Number of sections or directions
  IntColumn get eccentricityPoints => integer().withDefault(const Constant(4))();

  // Direction labels (for directional tests)
  TextColumn get eccentricityDirections => text().nullable()();

  // Eccentricity test results (up to 10 points)
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
  TextColumn get eccentricityError => text().nullable()();

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

  // Notes and weight test unit
  TextColumn get notes => text().nullable()();
  TextColumn get weightTestUnit => text().withLength(min: 1, max: 10).nullable()();

  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();

  // ✅ Enforce 1:1 mapping with ServiceReports
  @override
  List<Set<Column>>? get uniqueKeys => [
    {serviceReportId},
  ];
}
