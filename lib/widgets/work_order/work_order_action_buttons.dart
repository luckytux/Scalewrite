// File: lib/widgets/work_order/work_order_action_buttons.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/data/database.dart';
import 'package:scalewrite_v2/pages/create_service_report_page.dart';
import 'package:scalewrite_v2/providers/drift_providers.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';

class WorkOrderActionButtons extends ConsumerWidget {
  const WorkOrderActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);

    return Row(
      children: [
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () async {
              final success = await controller.save();
              if (context.mounted && success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Work Order Saved')),
                );
                Navigator.pop(context); // return to home
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
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton.icon(
            onPressed: () async {
              final customerId = controller.selectedCustomerId;
              if (customerId == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a customer before proceeding.')),
                );
                return;
              }

              final success = await controller.save();
              if (context.mounted && success) {
                final db = ref.read(databaseProvider);
                final latest = await db.workOrderDao.getMostRecentForCustomer(customerId);
                if (latest != null && context.mounted) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreateServiceReportPage(
                        customerId: latest.customerId,
                        workOrderId: latest.id,
                      ),
                    ),
                  );
                }
              }
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
      ],
    );
  }
}
