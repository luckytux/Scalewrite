// File: lib/data/tables/inventory_transactions.dart

import 'package:drift/drift.dart';
import 'inventory_items.dart';
import 'customers.dart';
import 'work_orders.dart';
import 'users.dart'; // ✅ Reference for user ID

class InventoryTransactions extends Table {
  IntColumn get id => integer().autoIncrement()();

  // Link to the inventory item involved in the transaction
  IntColumn get inventoryItemId => integer().references(InventoryItems, #id)();

  // Quantity moved
  IntColumn get quantity => integer().withDefault(const Constant(1))();

  // Transaction type (sold, restocked, transfer, adjustment, etc.)
  TextColumn get type => text().withDefault(const Constant('sold'))();

  // Optional customer and work order references
  IntColumn get customerId => integer().nullable().references(Customers, #id)();
  IntColumn get workOrderId => integer().nullable().references(WorkOrders, #id)();

  // Location metadata for transfer or origin
  TextColumn get sourceLocation => text().nullable()();
  TextColumn get targetLocation => text().nullable()();

  // ✅ Track who performed the transaction (linked to Users)
  IntColumn get userId => integer().references(Users, #id)();

  // Optional note, timestamp, and sync tracking
  TextColumn get note => text().nullable()();
  DateTimeColumn get timestamp => dateTime().withDefault(currentDateAndTime)();
  BoolColumn get synced => boolean().withDefault(const Constant(false))();
}
