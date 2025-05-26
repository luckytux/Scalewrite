// File: lib/data/tables/inventory_transactions.dart

import 'package:drift/drift.dart';
import 'inventory_items.dart';
import 'customers.dart';
import 'work_orders.dart';
import 'users.dart'; // ✅ Add Users reference

class InventoryTransactions extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Item involved in transaction
  IntColumn get inventoryItemId => integer().references(InventoryItems, #id)();

  // Quantity involved
  IntColumn get quantity => integer().withDefault(const Constant(1))();

  // Transaction Type: e.g., sold, restocked, transfer, adjustment
  TextColumn get type => text().withDefault(const Constant('sold'))();

  // For sales or related work orders
  IntColumn get customerId => integer().nullable().references(Customers, #id)();
  IntColumn get workOrderId => integer().nullable().references(WorkOrders, #id)();

  // Source/Target Locations (e.g., Calgary or Lethbridge)
  TextColumn get sourceLocation => text().nullable()();
  TextColumn get targetLocation => text().nullable()();

  // Who performed the transaction (UID)
  IntColumn get userId => integer().references(Users, #id)();

  // Notes, timestamp, and sync status
  TextColumn get note => text().nullable()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}
