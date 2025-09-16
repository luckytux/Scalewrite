// File: lib/data/tables/prices.dart

import 'package:drift/drift.dart';

class Prices extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// Stable key you’ll use in code, e.g. "labour", "test_truck_km"
  TextColumn get code => text()();

  /// Human label shown in UI
  TextColumn get description => text().withDefault(const Constant(''))();

  /// Unit for the rate: "hour", "km", "flat", "each"
  TextColumn get unit => text()();

  /// Price per unit
  RealColumn get rate => real()();

  /// Toggle availability (soft-disable a row)
  BoolColumn get active => boolean().withDefault(const Constant(true))();

  /// Optional effective dates (ignore if not needed)
  DateTimeColumn get effectiveFrom => dateTime().nullable()();
  DateTimeColumn get effectiveTo => dateTime().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  List<Set<Column>> get uniqueKeys => [
    {code}, // one active row per code (simple model)
  ];
}
