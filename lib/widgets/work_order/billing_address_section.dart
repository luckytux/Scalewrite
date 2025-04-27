// File: lib/widgets/work_order/billing_address_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/widgets/common/rounded_text_field.dart';
import 'package:scalewrite_v2/widgets/work_order/province_dropdown.dart';

class BillingAddressSection extends ConsumerWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);

    if (!controller.showBilling) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Billing Address', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        RoundedTextField(
          controller: controller.billingAddressController,
          label: 'Street Address',
          readOnly: !controller.customerFieldsEnabled,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: RoundedTextField(
                controller: controller.billingCityController,
                label: 'City',
                readOnly: !controller.customerFieldsEnabled,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: ProvinceDropdown(
                controller: controller.billingProvinceController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        RoundedTextField(
          controller: controller.billingPostalController,
          label: 'Postal Code',
          readOnly: !controller.customerFieldsEnabled,
        ),
      ],
    );
  }
}
