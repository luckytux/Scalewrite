// File: lib/data/tables/work_order_parts.dart
import 'package:drift/drift.dart';
import 'work_orders.dart';
import 'inventory_items.dart';

/// Parts pulled from inventory for a given WO.
class WorkOrderParts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workOrderId => integer().references(WorkOrders, #id)();
  IntColumn get inventoryItemId => integer().references(InventoryItems, #id)();

  RealColumn get quantity => real().withDefault(const Constant(1))();
  RealColumn get unitPrice => real().withDefault(const Constant(0))();
  RealColumn get amount => real().withDefault(const Constant(0))();

  TextColumn get notes => text().nullable()();

  /// one row per item per WO (if you want multiple rows per item, drop this)
  @override
  List<String> get customConstraints => [
        'UNIQUE(work_order_id, inventory_item_id)'
      ];
}
