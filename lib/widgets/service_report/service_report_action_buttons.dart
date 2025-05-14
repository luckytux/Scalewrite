// File: lib/widgets/service_report/service_report_action_buttons.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/service_report_form_provider.dart';
import 'package:scalewrite_v2/pages/create_weight_test_page.dart';
import 'package:scalewrite_v2/pages/home_page.dart';

class ServiceReportActionButtons extends ConsumerWidget {
  const ServiceReportActionButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(serviceReportFormProvider);

    return Row(
      children: [
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
              }
            },
          ),
        ),
        const SizedBox(width: 12),
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
              final success = await controller.save();
              if (!context.mounted || !success) return;

              if (controller.selectedServiceReportId != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateWeightTestPage(
                      serviceReportId: controller.selectedServiceReportId!,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
