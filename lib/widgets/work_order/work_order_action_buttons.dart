// File: lib/widgets/work_order/work_order_action_buttons.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/pages/create_service_report_page.dart';
import 'package:scalewrite_v2/pages/work_order_billing_page.dart';
import 'package:scalewrite_v2/providers/drift_providers.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';

class WorkOrderActionButtons extends ConsumerWidget {
  const WorkOrderActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);
    final db = ref.read(databaseProvider);

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        // Save Work Order
        SizedBox(
          width: 280,
          child: ElevatedButton.icon(
            onPressed: () async {
              final success = await controller.save();
              if (context.mounted && success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Work Order Saved')),
                );
                Navigator.pop(context);
              }
            },
            icon: const Icon(Icons.save),
            label: const Text('Save Work Order'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
          ),
        ),

        // Create Service Report (allow blank even if no scales yet)
        SizedBox(
          width: 280,
          child: ElevatedButton.icon(
            onPressed: () async {
              final success = await controller.save();
              if (!context.mounted || !success) return;

              final workOrderId = controller.editingWorkOrderId;
              if (workOrderId == null) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please complete and save the Work Order before proceeding.'),
                    ),
                  );
                }
                return;
              }

              final workOrder = await db.workOrderDao.getWorkOrderById(workOrderId);
              if (workOrder == null) return;

              // 🚫 Removed the "no scale found" blocker. We always open a blank SR if needed.
              if (!context.mounted) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CreateServiceReportPage(
                    workOrderId: workOrder.id,
                    customerId: workOrder.customerId,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.note_add),
            label: const Text('Create Service Report'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
          ),
        ),

        // Billing
        SizedBox(
          width: 280,
          child: ElevatedButton.icon(
            onPressed: () async {
              final saved = await controller.save();
              if (!context.mounted || !saved) return;

              final workOrderId = controller.editingWorkOrderId;
              if (workOrderId == null) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please save the Work Order first.')),
                  );
                }
                return;
              }

              final workOrder = await db.workOrderDao.getWorkOrderById(workOrderId);
              if (!context.mounted || workOrder == null) return;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WorkOrderBillingPage(
                    workOrderId: workOrderId,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.receipt_long),
            label: const Text('Billing'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}
