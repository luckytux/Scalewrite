// File: lib/widgets/common/province_dropdown.dart

import 'package:flutter/material.dart';

class ProvinceDropdown extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;

  static const Map<String, String> provinceMap = {
    'AB': 'Alberta',
    'BC': 'British Columbia',
    'SK': 'Saskatchewan',
    'MB': 'Manitoba',
    'ON': 'Ontario',
    'QC': 'Quebec',
    'NB': 'New Brunswick',
    'NS': 'Nova Scotia',
    'PE': 'Prince Edward Island',
    'NL': 'Newfoundland and Labrador',
    'YT': 'Yukon',
    'NT': 'Northwest Territories',
    'NU': 'Nunavut',
  };

  const ProvinceDropdown({
    super.key,
    required this.controller,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final provinceCodes = provinceMap.keys.toList();
    final currentValue = controller.text.isEmpty || !provinceMap.containsKey(controller.text)
        ? null
        : controller.text;

    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: currentValue,
      onChanged: enabled ? (value) => controller.text = value ?? '' : null,
      items: provinceCodes.map((code) {
        return DropdownMenuItem(
          value: code,
          child: Text(provinceMap[code] ?? code, overflow: TextOverflow.ellipsis),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: 'Province',
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        filled: true,
        fillColor: enabled ? Colors.teal.shade50 : Colors.grey.shade200,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: enabled ? Colors.teal : Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.teal, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
