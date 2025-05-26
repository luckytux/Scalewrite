// File: lib/widgets/service_report/scale_dropdown.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/database.dart';
import '../../../providers/drift_providers.dart';
import '../../../providers/service_report_form_provider.dart';

class ScaleDropdown extends ConsumerWidget {
  final int customerId;
  final int? selectedScaleId;
  final void Function(Scale?) onChanged;

  const ScaleDropdown({
    super.key,
    required this.customerId,
    required this.selectedScaleId,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<List<Scale>>(
      future: ref.read(scaleDaoProvider).getScalesForCustomer(customerId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final scales = snapshot.data!;
        final dropdownItems = [
          ...scales.map(
            (s) => DropdownMenuItem<Scale?>(
              value: s,
              child: Text('${s.scaleType} - ${s.indicatorModel} (${s.indicatorSerial})'),
            ),
          ),
          const DropdownMenuItem<Scale?>(
            value: null,
            child: Text('➕ Create New Scale'),
          ),
        ];

        Scale? selectedScale;
        try {
          selectedScale = scales.firstWhere((s) => s.id == selectedScaleId);
        } catch (_) {
          selectedScale = null;
        }

        return DropdownButtonFormField<Scale?>(
          value: selectedScale,
          items: dropdownItems,
          onChanged: (value) {
            final controller = ref.read(serviceReportFormProvider.notifier);
            if (value == null) {
              controller.setIsCreatingNewScale(true);
              onChanged(null);
            } else {
              controller.setIsCreatingNewScale(false);
              onChanged(value);
            }
          },
          decoration: InputDecoration(
            labelText: 'Scale',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.teal.shade50,
          ),
        );
      },
    );
  }
}