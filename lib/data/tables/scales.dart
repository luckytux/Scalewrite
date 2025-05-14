// File: lib/data/tables/scales.dart
import 'package:drift/drift.dart';
import 'customers.dart';

class Scales extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId => integer().references(Customers, #id)();

  BoolColumn get configuration => boolean()(); // M = true, C = false
  TextColumn get scaleType => text()();
  TextColumn get scaleSubtype => text()();
  TextColumn get customTypeDescription => text().nullable()();

  TextColumn get indicatorMake => text()();
  TextColumn get indicatorModel => text()();
  TextColumn get indicatorSerial => text()();
  TextColumn get approvalPrefix => text()();
  TextColumn get approvalNumber => text()();

  TextColumn get baseMake => text().nullable()();
  TextColumn get baseModel => text().nullable()();
  TextColumn get baseSerial => text().nullable()();
  TextColumn get baseApprovalPrefix => text().nullable()();
  TextColumn get baseApprovalNumber => text().nullable()();

  RealColumn get capacity => real()();
  TextColumn get capacityUnit => text()();
  RealColumn get division => real()();
  IntColumn get numberOfLoadCells => integer()();
  IntColumn get numberOfSections => integer()();
  TextColumn get loadCellModel => text()();
  RealColumn get loadCellCapacity => real()();
  TextColumn get loadCellCapacityUnit => text()();

  BoolColumn get legalForTrade => boolean().withDefault(const Constant(false))();
  DateTimeColumn get inspectionExpiry => dateTime().nullable()();
  TextColumn get sealStatus => text().nullable()();
  TextColumn get inspectionResult => text().nullable()();


  TextColumn get notes => text().nullable()(); // ← Updated to be "Notes / Location"
  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get auditFlag => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}
