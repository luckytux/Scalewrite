// File: lib/data/tables/work_order_charges.dart
import 'package:drift/drift.dart';
import 'work_orders.dart';

/// “Other billable entries” (labour, OT, travel, test-truck, etc.)
class WorkOrderCharges extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workOrderId => integer().references(WorkOrders, #id)();

  /// Stable code so we can upsert without duplicates: e.g. LABOUR, OVERTIME, TECH_TRAVEL, TEST_TRUCK_ONSITE, ...
  TextColumn get code => text()();

  /// Display label you show in the UI (can evolve without breaking the code)
  TextColumn get label => text()();

  /// Quantity unit is implied by code (hours, km, flat, etc.)
  RealColumn get quantity => real().withDefault(const Constant(0))();

  /// Unit price resolved from your Prices table at save time
  RealColumn get unitPrice => real().withDefault(const Constant(0))();

  /// amount = quantity * unitPrice (or computed per rule); we store the snapshot used on the WO
  RealColumn get amount => real().withDefault(const Constant(0))();

  TextColumn get notes => text().nullable()();

  /// Prevent duplicates per (WO, code)
  @override
  List<String> get customConstraints => [
        'UNIQUE(work_order_id, code)'
      ];
}
