// File: lib/data/tables/service_reports.dart
import 'package:drift/drift.dart';
import 'work_orders.dart';
import 'scales.dart';
import '../json_converter.dart';

class ServiceReports extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get workOrderId => integer().references(WorkOrders, #id)();
  IntColumn get scaleId     => integer().references(Scales, #id)();

  TextColumn get reportType => text()(); // e.g. Inspection, WeightTest
  TextColumn get notes      => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  BoolColumn get complete => boolean().withDefault(const Constant(false))();
  BoolColumn get synced   => boolean().withDefault(const Constant(false))();

  TextColumn get ipoStateJson =>
      text().nullable().map(const JsonConverter())();

  // ✅ Enforce one SR per (workOrderId, scaleId)
  @override
  List<Set<Column>> get uniqueKeys => [
    { workOrderId, scaleId },
  ];

  // (Optional) If you still want a non-unique index for lookup performance,
  // you can keep this, but it's usually redundant with the UNIQUE constraint:
  // @override
  // List<Index> get indexes => [
  //   Index('idx_sr_wo_scale', [workOrderId, scaleId]),
  // ];
}
