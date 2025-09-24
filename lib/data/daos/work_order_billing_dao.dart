// File: lib/data/daos/work_order_billing_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';

// Tables
import '../tables/work_order_charges.dart';
import '../tables/work_order_parts.dart';
import '../tables/inventory_items.dart';
import '../tables/inventory_transactions.dart';

part 'work_order_billing_dao.g.dart';

@DriftAccessor(
  tables: [
    WorkOrderCharges,
    WorkOrderParts,
    InventoryItems,
    InventoryTransactions,
  ],
)
class WorkOrderBillingDao extends DatabaseAccessor<AppDatabase>
    with _$WorkOrderBillingDaoMixin {
  WorkOrderBillingDao(super.db);

  // ---------------------------- CHARGES ---------------------------------

  /// Upsert a charge by (workOrderId, code). Snapshots unit/unitPrice/label.
  Future<void> upsertCharge({
    required int workOrderId,
    required String code,
    String? label,            // snapshot label shown on invoice
    required double quantity, // hours/km/1(flat)
    required double unitPrice,
    String? unit,             // 'hour' | 'km' | 'flat' ...
  }) async {
    final now = DateTime.now();

    // Try UPDATE first
    final updated = await (update(workOrderCharges)
          ..where((t) =>
              t.workOrderId.equals(workOrderId) & t.code.equals(code)))
        .write(
      WorkOrderChargesCompanion(
        label: Value(label),
        quantity: Value(quantity),
        unitPrice: Value(unitPrice),
        unit: Value(unit),
        updatedAt: Value(now),
      ),
    );

    if (updated == 0) {
      // INSERT (unique on workOrderId+code enforced by table)
      await into(workOrderCharges).insert(
        WorkOrderChargesCompanion(
          workOrderId: Value(workOrderId),
          code: Value(code),
          label: Value(label),
          quantity: Value(quantity),
          unitPrice: Value(unitPrice),
          unit: Value(unit),
        ),
        mode: InsertMode.insertOrIgnore,
      );

      // Ensure the values are up to date if the row already existed
      await (update(workOrderCharges)
            ..where((t) =>
                t.workOrderId.equals(workOrderId) & t.code.equals(code)))
          .write(
        WorkOrderChargesCompanion(
          label: Value(label),
          quantity: Value(quantity),
          unitPrice: Value(unitPrice),
          unit: Value(unit),
          updatedAt: Value(now),
        ),
      );
    }
  }

  Future<List<WorkOrderCharge>> getCharges(int workOrderId) {
    return (select(workOrderCharges)
          ..where((t) => t.workOrderId.equals(workOrderId)))
        .get();
  }

  Future<void> deleteCharge(int id) =>
      (delete(workOrderCharges)..where((t) => t.id.equals(id))).go();

  // ----------------------------- PARTS ----------------------------------

  /// Upsert a manual/free-typed part row by (workOrderId, partNumber).
  /// Stores a snapshot of description & unitPrice.
  Future<void> upsertPart({
    required int workOrderId,
    required String partNumber,
    String? description,
    required double quantity,
    required double unitPrice,
  }) async {
    final now = DateTime.now();

    final updated = await (update(workOrderParts)
          ..where((t) =>
              t.workOrderId.equals(workOrderId) &
              t.partNumber.equals(partNumber)))
        .write(
      WorkOrderPartsCompanion(
        description: Value(description),
        quantity: Value(quantity),
        unitPrice: Value(unitPrice),
        updatedAt: Value(now),
      ),
    );

    if (updated == 0) {
      await into(workOrderParts).insert(
        WorkOrderPartsCompanion(
          workOrderId: Value(workOrderId),
          partNumber: Value(partNumber),
          description: Value(description),
          quantity: Value(quantity),
          unitPrice: Value(unitPrice),
        ),
        mode: InsertMode.insertOrIgnore,
      );

      // If row existed, bring values current
      await (update(workOrderParts)
            ..where((t) =>
                t.workOrderId.equals(workOrderId) &
                t.partNumber.equals(partNumber)))
          .write(
        WorkOrderPartsCompanion(
          description: Value(description),
          quantity: Value(quantity),
          unitPrice: Value(unitPrice),
          updatedAt: Value(now),
        ),
      );
    }
  }

  Future<List<WorkOrderPart>> getParts(int workOrderId) {
    return (select(workOrderParts)
          ..where((t) => t.workOrderId.equals(workOrderId)))
        .get();
  }

  Future<void> deletePart(int id) =>
      (delete(workOrderParts)..where((t) => t.id.equals(id))).go();

  // -------------------- PARTS from INVENTORY ----------------------------

  /// Pull an item from inventory, snapshot it onto the WO parts,
  /// decrement stock, and write an inventory transaction — atomically.
  ///
  /// NOTE:
  /// - `quantity` is **int** for stock; we snapshot a double on the WO line.
  /// - If you want to tie the transaction to a customer, pass `customerId`.
  Future<void> addPartFromInventory({
    required int workOrderId,
    required int inventoryItemId,
    required int userId,
    int quantity = 1,
    int? customerId,
    double? overrideUnitPrice,
    String? transactionType, // defaults to 'sold'
    String? note,
  }) async {
    await transaction(() async {
      final item = await (select(inventoryItems)
            ..where((t) => t.id.equals(inventoryItemId)))
          .getSingleOrNull();

      if (item == null) {
        throw StateError('Inventory item #$inventoryItemId not found');
      }

      final unitPrice = overrideUnitPrice ?? (item.price ?? 0.0);

      // 1) Snapshot onto WorkOrderParts
      await upsertPart(
        workOrderId: workOrderId,
        partNumber: item.partNumber,
        description: item.description,
        quantity: quantity.toDouble(),
        unitPrice: unitPrice,
      );

      // 2) Insert inventory transaction
      await into(inventoryTransactions).insert(
        InventoryTransactionsCompanion(
          inventoryItemId: Value(inventoryItemId),
          quantity: Value(quantity),
          type: Value(transactionType ?? 'sold'),
          customerId: Value(customerId),
          workOrderId: Value(workOrderId),
          sourceLocation: Value(item.location),
          targetLocation: const Value.absent(),
          userId: Value(userId),
          note: Value(note),
          // timestamp/synced default from table
        ),
      );

      // 3) Decrement stock (clamp at zero), mark unsynced + update timestamp
      final newQty = (item.quantity - quantity);
      await (update(inventoryItems)..where((t) => t.id.equals(inventoryItemId)))
          .write(
        InventoryItemsCompanion(
          quantity: Value(newQty < 0 ? 0 : newQty),
          lastModified: Value(DateTime.now()),
          synced: const Value(false),
        ),
      );
    });
  }
}
