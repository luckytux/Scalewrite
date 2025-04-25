// File: lib/widgets/work_order/billing_address_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/widgets/rounded_text_field.dart';

const provinceOptions = [
  {'label': 'Alberta', 'value': 'AB'},
  {'label': 'British Columbia', 'value': 'BC'},
  {'label': 'Saskatchewan', 'value': 'SK'},
  {'label': 'Manitoba', 'value': 'MB'},
  {'label': 'Ontario', 'value': 'ON'},
  {'label': 'Quebec', 'value': 'QC'},
  {'label': 'New Brunswick', 'value': 'NB'},
  {'label': 'Nova Scotia', 'value': 'NS'},
  {'label': 'Prince Edward Island', 'value': 'PE'},
  {'label': 'Newfoundland and Labrador', 'value': 'NL'},
  {'label': 'Yukon', 'value': 'YT'},
  {'label': 'Northwest Territories', 'value': 'NT'},
  {'label': 'Nunavut', 'value': 'NU'},
];

class BillingAddressSection extends ConsumerWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);

    if (!controller.showBilling) return const SizedBox.shrink();

    return Column(
      children: [
        RoundedTextField(
          controller: controller.billingAddress,
          label: 'Billing Address',
          readOnly: !controller.customerFieldsEnabled,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: RoundedTextField(
                controller: controller.billingCity,
                label: 'City',
                readOnly: !controller.customerFieldsEnabled,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Province'),
                value: provinceOptions.any((p) => p['value'] == controller.billingProvince.text)
                    ? controller.billingProvince.text
                    : null,
                items: provinceOptions
                    .map((p) => DropdownMenuItem(value: p['value'], child: Text(p['label']!)))
                    .toList(),
                onChanged: controller.customerFieldsEnabled
                    ? (value) => controller.billingProvince.text = value ?? ''
                    : null,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: RoundedTextField(
                controller: controller.billingPostal,
                label: 'Postal Code',
                readOnly: !controller.customerFieldsEnabled,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
