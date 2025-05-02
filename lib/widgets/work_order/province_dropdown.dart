// File: lib/widgets/common/province_dropdown.dart

import 'package:flutter/material.dart';

class ProvinceDropdown extends StatelessWidget {
  final TextEditingController controller;
  final List<String> provinces;
  final bool enabled;

  const ProvinceDropdown({
    super.key,
    required this.controller,
    this.provinces = const [
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
    ],
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: controller.text.isEmpty ? null : controller.text,
      onChanged: enabled ? (value) => controller.text = value ?? '' : null,
      items: provinces.map((prov) {
        return DropdownMenuItem(
          value: prov,
          child: Text(prov, overflow: TextOverflow.ellipsis),
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
