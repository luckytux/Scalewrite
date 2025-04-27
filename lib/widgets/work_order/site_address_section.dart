// File: lib/widgets/work_order/site_address_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/widgets/common/rounded_text_field.dart';
import 'package:scalewrite_v2/widgets/work_order/province_dropdown.dart';

class SiteAddressSection extends ConsumerWidget {
  const SiteAddressSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Site Address', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        RoundedTextField(
          controller: controller.siteAddressController,
          label: 'Street Address',
          readOnly: !controller.customerFieldsEnabled,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: RoundedTextField(
                controller: controller.siteCityController,
                label: 'City',
                readOnly: !controller.customerFieldsEnabled,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 1,
              child: ProvinceDropdown(
                controller: controller.siteProvinceController,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        RoundedTextField(
          controller: controller.sitePostalController,
          label: 'Postal Code',
          readOnly: !controller.customerFieldsEnabled,
        ),
        const SizedBox(height: 8),
        RoundedTextField(
          controller: controller.gpsLocationController,
          label: 'GPS Location (Optional)',
          readOnly: !controller.customerFieldsEnabled,
        ),
      ],
    );
  }
}
