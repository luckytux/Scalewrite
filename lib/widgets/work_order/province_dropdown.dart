// File: lib/widgets/work_order/province_dropdown.dart

import 'package:flutter/material.dart';

class ProvinceDropdown extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;

  ProvinceDropdown({
    super.key,
    required this.controller,
    this.enabled = true,
  });

  final List<String> provinces = const [
    'Alberta',
    'British Columbia',
    'Saskatchewan',
    'Manitoba',
    'Ontario',
    'Quebec',
    'New Brunswick',
    'Nova Scotia',
    'Prince Edward Island',
    'Newfoundland and Labrador',
    'Yukon',
    'Northwest Territories',
    'Nunavut',
  ];

  @override
  Widget build(BuildContext context) {
    // Ensure Alberta is default if empty
    final String currentValue = controller.text.isNotEmpty ? controller.text : 'Alberta';

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(labelText: 'Province'),
      value: provinces.contains(currentValue) ? currentValue : 'Alberta',
      items: provinces
          .map((province) => DropdownMenuItem<String>(
                value: province,
                child: Text(province),
              ))
          .toList(),
      onChanged: enabled
          ? (val) {
              controller.text = val ?? 'Alberta';
            }
          : null,
    );
  }
}
