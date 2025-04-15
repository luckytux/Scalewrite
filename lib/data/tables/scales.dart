// File: lib/data/tables/scales.dart
import 'package:drift/drift.dart';
import 'customers.dart';

class Scales extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get customerId => integer().references(Customers, #id)();

  BoolColumn get configuration => boolean()(); // M = true, C = false
  TextColumn get scaleType => text()();
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

  TextColumn get notes => text().nullable()();
  BoolColumn get deactivate => boolean().withDefault(const Constant(false))();
  BoolColumn get auditFlag => boolean().withDefault(const Constant(false))();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}
