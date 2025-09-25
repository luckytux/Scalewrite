// File: lib/widgets/service_report/service_report_action_buttons.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scalewrite/providers/service_report_form_provider.dart';
import 'package:scalewrite/pages/create_weight_test_page.dart';
import 'package:scalewrite/pages/home_page.dart';

import 'package:scalewrite/providers/drift_providers.dart'; // databaseProvider, daos
import 'package:scalewrite/data/dao_shims/service_report_dao_shims.dart'; // getServiceReportById shim

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
                // Load the persisted SR (via shim or your DAO)
                final serviceReport =
                    await db.serviceReportDao.getServiceReportById(srId);
                if (serviceReport == null) {
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not load Service Report.')),
                  );
                  return;
                }

                // Seed division/sections/capacity from the *form* first (works even with no saved Scale)
                double division =
                    double.tryParse(controller.divisionController.text) ??
                        (controller.selectedScale?.division ?? 10);
                int sections =
                    int.tryParse(controller.sectionsController.text) ??
                        (controller.selectedScale?.numberOfSections ?? 4);
                double? capacity =
                    double.tryParse(controller.capacityController.text) ??
                        controller.selectedScale?.capacity;

                // If the SR is linked to a Scale, prefer the saved Scale values
                final int? scaleId = serviceReport.scaleId;
                if (scaleId != null) {
                  final scale = await db.scaleDao.getScaleById(scaleId);
                  if (scale == null) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content:
                              Text('Scale not found for this Service Report.')),
                    );
                    return;
                  }
                  division = scale.division;
                  sections = scale.numberOfSections;
                  capacity = scale.capacity;
                }

                if (!context.mounted) return;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateWeightTestPage(
                      serviceReportId: srId,
                      division: division,
                      numberOfSections: sections,
                      maxCapacity: capacity,
                      // scaleClass: optional; can infer in page if needed
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
