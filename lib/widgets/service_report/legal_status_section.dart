// File: lib/widgets/service_report/legal_status_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/service_report_form_provider.dart';
import '../common/rounded_text_field.dart';
import '../common/rounded_dropdown_field.dart';

class LegalStatusSection extends ConsumerWidget {
  const LegalStatusSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(serviceReportFormProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CheckboxListTile(
          title: const Text('Legal for Trade'),
          value: controller.isLegalForTrade,
          onChanged: controller.editable
              ? (val) => controller.setLegalForTrade(val ?? false)
              : null,
        ),
        if (controller.isLegalForTrade)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: RoundedTextField(
                    controller: controller.inspectionExpiryController,
                    label: 'Inspection Expiry',
                    readOnly: !controller.editable,
                    fillColor: controller.editable
                        ? Colors.teal.shade50
                        : Colors.grey.shade200,
                    onTap: controller.editable
                        ? () async {
                            final picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2100),
                            );
                            if (picked != null) {
                              controller.setInspectionExpiry(picked);
                            }
                          }
                        : null,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: RoundedDropdownField<String>(
                    label: 'Seal Status',
                    value: controller.sealStatus,
                    enabled: controller.editable,
                    onChanged: controller.setSealStatus,
                    items: const [
                      'Intact',
                      'Broken',
                      'Missing',
                      'N/A',
                    ].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 2,
                  child: RoundedDropdownField<String>(
                    label: 'Inspection Result',
                    value: controller.inspectionResult,
                    enabled: controller.editable,
                    onChanged: controller.setInspectionResult,
                    items: const [
                      'Pass',
                      'Fail',
                      'Pending',
                      'N/A',
                    ].map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
