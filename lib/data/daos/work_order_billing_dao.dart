// File: lib/data/daos/work_order_billing_dao.dart
import 'package:drift/drift.dart';
import '../database.dart';
import '../tables/work_order_charges.dart';
import '../tables/work_order_parts.dart';

part 'work_order_billing_dao.g.dart';

@DriftAccessor(tables: [WorkOrderCharges, WorkOrderParts])
class WorkOrderBillingDao extends DatabaseAccessor<AppDatabase>
    with _$WorkOrderBillingDaoMixin {
  WorkOrderBillingDao(super.db);

  // CHARGES ---------------------------------------------------------------

  Future<void> upsertCharge({
    required int workOrderId,
    required String code,
    required String label,
    required double quantity,
    required double unitPrice,
    String? notes,
  }) async {
    final amount = (quantity * unitPrice);
    // try update
    final updated = await (update(workOrderCharges)
          ..where((t) => t.workOrderId.equals(workOrderId) & t.code.equals(code)))
        .write(
      WorkOrderChargesCompanion(
        label: Value(label),
        quantity: Value(quantity),
        unitPrice: Value(unitPrice),
        amount: Value(amount),
        notes: Value(notes),
      ),
    );

    if (updated == 0) {
      // insert
      await into(workOrderCharges).insert(
        WorkOrderChargesCompanion(
          workOrderId: Value(workOrderId),
          code: Value(code),
          label: Value(label),
          quantity: Value(quantity),
          unitPrice: Value(unitPrice),
          amount: Value(amount),
          notes: Value(notes),
        ),
        mode: InsertMode.insertOrIgnore, // respect UNIQUE(work_order_id, code)
      );

      // if IGNORE happened (row existed), force an update to set new qty/price
      await (update(workOrderCharges)
            ..where((t) => t.workOrderId.equals(workOrderId) & t.code.equals(code)))
          .write(
        WorkOrderChargesCompanion(
          label: Value(label),
          quantity: Value(quantity),
          unitPrice: Value(unitPrice),
          amount: Value(amount),
          notes: Value(notes),
        ),
      );
    }
  }

  Future<List<WorkOrderCharge>> getCharges(int workOrderId) {
    return (select(workOrderCharges)
          ..where((t) => t.workOrderId.equals(workOrderId)))
        .get();
  }

  // PARTS ----------------------------------------------------------------

  Future<void> upsertPart({
    required int workOrderId,
    required int inventoryItemId,
    required double quantity,
    required double unitPrice,
    String? notes,
  }) async {
    final amount = quantity * unitPrice;

    final updated = await (update(workOrderParts)
          ..where((t) =>
              t.workOrderId.equals(workOrderId) &
              t.inventoryItemId.equals(inventoryItemId)))
        .write(
      WorkOrderPartsCompanion(
        quantity: Value(quantity),
        unitPrice: Value(unitPrice),
        amount: Value(amount),
        notes: Value(notes),
      ),
    );

    if (updated == 0) {
      await into(workOrderParts).insert(
        WorkOrderPartsCompanion(
          workOrderId: Value(workOrderId),
          inventoryItemId: Value(inventoryItemId),
          quantity: Value(quantity),
          unitPrice: Value(unitPrice),
          amount: Value(amount),
          notes: Value(notes),
        ),
        mode: InsertMode.insertOrIgnore,
      );

      await (update(workOrderParts)
            ..where((t) =>
                t.workOrderId.equals(workOrderId) &
                t.inventoryItemId.equals(inventoryItemId)))
          .write(
        WorkOrderPartsCompanion(
          quantity: Value(quantity),
          unitPrice: Value(unitPrice),
          amount: Value(amount),
          notes: Value(notes),
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
}
