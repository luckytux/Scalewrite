// File: lib/widgets/work_order/billing_address_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/utils/formatters.dart';
import 'package:scalewrite_v2/widgets/common/rounded_text_field.dart';
import 'package:scalewrite_v2/widgets/work_order/province_dropdown.dart';

class BillingAddressSection extends ConsumerWidget {
  final bool enabled;
  final Color? fillColor;

  const BillingAddressSection({
    super.key,
    required this.enabled,
    this.fillColor,
  });

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
          readOnly: !enabled,
                ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: RoundedTextField(
                controller: controller.billingCityController,
                label: 'City',
                readOnly: !enabled,
                            ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: ProvinceDropdown(
                controller: controller.billingProvinceController,
                enabled: enabled,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: RoundedTextField(
                controller: controller.billingPostalController,
                label: 'Postal Code',
                readOnly: !enabled,
                keyboardType: TextInputType.text,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9 ]')),
                  PostalCodeFormatter(),
                ],
                validator: (value) => isValidCanadianPostalCode(value ?? '')
                    ? null
                    : 'Format: A1A 1A1',
              ),
            ),

          ],
        ),
      ],
    );
  }
}
