import 'package:drift/drift.dart';
import 'work_orders.dart';

class WorkOrderParts extends Table {
  IntColumn get id => integer().autoIncrement()();

  /// The work order this part belongs to
  IntColumn get workOrderId => integer().references(WorkOrders, #id)();

  /// Your internal part number / SKU
  TextColumn get partNumber => text()();

  /// Human-friendly description
  TextColumn get description => text().nullable()();

  /// Quantity of this part
  RealColumn get quantity => real().withDefault(const Constant(1))();

  /// Unit price captured at time of save
  RealColumn get unitPrice => real().withDefault(const Constant(0))();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
