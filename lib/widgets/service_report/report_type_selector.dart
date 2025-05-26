// File: lib/widgets/service_report/report_type_selector.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/service_report_form_provider.dart';

class ReportTypeSelector extends ConsumerWidget {
  final String? selected;
  final ValueChanged<String?>? onChanged;
  final bool readOnly;

  const ReportTypeSelector({
    super.key,
    required this.selected,
    required this.onChanged,
    required this.readOnly,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      value: selected,
      decoration: const InputDecoration(
        labelText: 'Report Type',
        border: OutlineInputBorder(),
      ),
      onChanged: readOnly ? null : onChanged,
      items: const [
        'Standard',
        'Follow-Up',
        'Repair',
        'Reverification',
      ].map((value) => DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          ))
      .toList(),
    );
  }
}
