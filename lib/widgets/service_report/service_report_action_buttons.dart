// File: lib/widgets/service_report/service_report_action_buttons.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/service_report_form_provider.dart';
import 'package:scalewrite_v2/pages/create_weight_test_page.dart';
import 'package:scalewrite_v2/pages/home_page.dart';
import 'package:scalewrite_v2/providers/drift_providers.dart'; // for database/DAOs
import 'package:scalewrite_v2/data/dao_shims/service_report_dao_shims.dart'; // ✅ analyzer-visible shim

class ServiceReportActionButtons extends ConsumerWidget {
  const ServiceReportActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(serviceReportFormProvider);
    final db = ref.read(databaseProvider);

    return Row(
      children: [
        // Save Service Report
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.save),
            label: const Text('Save Service Report'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () async {
              final success = await controller.save();
              if (!context.mounted) return;

              if (success) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Service Report Saved')),
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                  (route) => false,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Failed to save Service Report')),
                );
              }
            },
          ),
        ),
        const SizedBox(width: 12),

        // Add Forms (e.g., Weight Test)
        Expanded(
          child: ElevatedButton.icon(
            icon: const Icon(Icons.add_circle_outline),
            label: const Text('Add Forms'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () async {
              // Save latest changes first
              final saved = await controller.save();
              if (!context.mounted || !saved) return;

              final srId = controller.selectedServiceReportId;
              if (srId == null) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please save the Service Report first.')),
                );
                return;
              }

              try {
                // Use shimmed helper (or your real DAO method if present)
                final serviceReport = await db.serviceReportDao.getServiceReportById(srId);
                if (serviceReport == null) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not load Service Report.')),
                  );
                  return;
                }

                final scaleId = serviceReport.scaleId;
                if (scaleId == null) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No scale is linked to this Service Report.')),
                  );
                  return;
                }

                final scale = await db.scaleDao.getScaleById(scaleId);
                if (scale == null) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Scale not found for this Service Report.')),
                  );
                  return;
                }

                if (!context.mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateWeightTestPage(
                      serviceReportId: srId,
                      division: scale.division,
                      numberOfSections: scale.numberOfSections,
                    ),
                  ),
                );
              } catch (e) {
                if (!context.mounted) return;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error preparing Weight Test: $e')),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
