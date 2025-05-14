// File: lib/widgets/service_report/report_type_selector.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/service_report_form_provider.dart';

class ReportTypeSelector extends ConsumerWidget {
  const ReportTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(serviceReportFormProvider);

    return DropdownButtonFormField<String>(
      value: controller.reportType,
      decoration: const InputDecoration(
        labelText: 'Report Type',
        border: OutlineInputBorder(),
      ),
      onChanged: controller.editable
          ? (val) => controller.setReportType(val ?? 'Standard')
          : null,
      items: const [
        'Standard',
        'Follow-Up',
        'Repair',
        'Reverification',
      ].map((value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList(),
    );
  }
}
