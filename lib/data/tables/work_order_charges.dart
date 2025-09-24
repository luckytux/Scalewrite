import 'package:drift/drift.dart';
import 'work_orders.dart';

class WorkOrderCharges extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// The work order this charge belongs to
  IntColumn get workOrderId => integer().references(WorkOrders, #id)();

  /// Canonical code (should match PriceDao codes, e.g. 'labour', 'overtime', etc.)
  TextColumn get code => text()();

  /// Friendly label snapshot shown on the invoice (optional)
  TextColumn get label => text().nullable()();

  /// Quantity entered (hours, km, 1 for flat, etc.)
  RealColumn get quantity => real().withDefault(const Constant(0))();

  /// Unit price at time of save (so totals don’t drift when prices change)
  RealColumn get unitPrice => real().withDefault(const Constant(0))();

  /// Optional unit snapshot ('hour', 'km', 'flat', etc.)
  TextColumn get unit => text().nullable()();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  /// Enforce one row per (workOrder, code)
  @override
  List<Set<Column>> get uniqueKeys => [
    {workOrderId, code},
  ];
}
