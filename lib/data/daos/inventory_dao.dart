// File: lib/data/daos/inventory_dao.dart

import 'package:drift/drift.dart';
import '../tables/inventory_items.dart';
import '../tables/inventory_transactions.dart';
import '../database.dart';

part 'inventory_dao.g.dart';

@DriftAccessor(tables: [InventoryItems, InventoryTransactions])
class InventoryDao extends DatabaseAccessor<AppDatabase> with _$InventoryDaoMixin {
  InventoryDao(super.db);

  // 🚚 INVENTORY CRUD OPERATIONS

  /// Get all inventory items
  Future<List<InventoryItem>> getAllInventory() => select(inventoryItems).get();

  /// Watch all inventory items in real-time
  Stream<List<InventoryItem>> watchAllInventory() => select(inventoryItems).watch();

  /// Insert a new inventory item
  Future<int> insertInventory(InventoryItemsCompanion entry) =>
      into(inventoryItems).insert(entry);

  /// Update an existing inventory item
  Future<bool> updateInventory(InventoryItem item) =>
      update(inventoryItems).replace(item);

  /// Delete an inventory item by ID
  Future<int> deleteInventory(int id) =>
      (delete(inventoryItems)..where((tbl) => tbl.id.equals(id))).go();

  // 📝 TRANSACTION LOGGING

  /// Log any inventory transaction (generic)
  Future<int> logTransaction(InventoryTransactionsCompanion entry) =>
      into(inventoryTransactions).insert(entry);

  /// Get all transactions for a specific inventory item
  Future<List<InventoryTransaction>> getTransactionsForItem(int itemId) =>
      (select(inventoryTransactions)
            ..where((t) => t.inventoryItemId.equals(itemId))
            ..orderBy([(t) => OrderingTerm.desc(t.timestamp)]))
          .get();

  // 🔍 SEARCH INVENTORY

  /// Search inventory items by part number, description, or barcode
  Future<List<InventoryItem>> searchInventory(String query) {
    final q = '%$query%';
    return (select(inventoryItems)
          ..where((tbl) =>
              tbl.partNumber.like(q) |
              tbl.description.like(q) |
              tbl.barcode.like(q)))
        .get();
  }

  // 📤 EXPORT DATA

  /// Get all inventory items for export (optional: exclude sold)
  Future<List<InventoryItem>> getExportData({bool includeSold = true}) {
    final query = select(inventoryItems);
    if (!includeSold) {
      query.where((tbl) => tbl.isSold.equals(false));
    }
    return query.get();
  }

  // ✅ MARK ITEM AS SOLD

  /// Mark an item as sold, update its work order & customer references, and log the transaction
  Future<void> markAsSold({
    required int itemId,
    required int customerId,
    required int workOrderId,
    required int userId,
    String? note,
  }) async {
    await transaction(() async {
      await (update(inventoryItems)..where((t) => t.id.equals(itemId))).write(
        InventoryItemsCompanion(
          isSold: const Value(true),
          workOrderId: Value(workOrderId),
          customerId: Value(customerId),
          lastModified: Value(DateTime.now()),
        ),
      );

      await logTransaction(
        InventoryTransactionsCompanion(
          inventoryItemId: Value(itemId),
          type: const Value('sold'),
          quantity: const Value(1),
          customerId: Value(customerId),
          workOrderId: Value(workOrderId),
          userId: Value(userId),
          note: Value(note ?? ''),
          timestamp: Value(DateTime.now()),
        ),
      );
    });
  }

  // 🔄 TRANSFER ITEM BETWEEN LOCATIONS

  /// Transfer an item between Calgary and Lethbridge, logging the transaction
  Future<void> transferItem({
    required int itemId,
    required int userId,
    required String sourceLocation,
    required String targetLocation,
    int quantity = 1,
    String? note,
  }) async {
    await transaction(() async {
      await (update(inventoryItems)..where((t) => t.id.equals(itemId))).write(
        InventoryItemsCompanion(
          location: Value(targetLocation),
          lastModified: Value(DateTime.now()),
        ),
      );

      await logTransaction(
        InventoryTransactionsCompanion(
          inventoryItemId: Value(itemId),
          type: const Value('transfer'),
          quantity: Value(quantity),
          sourceLocation: Value(sourceLocation),
          targetLocation: Value(targetLocation),
          userId: Value(userId),
          note: Value(note ?? ''),
          timestamp: Value(DateTime.now()),
        ),
      );
    });
  }
}
