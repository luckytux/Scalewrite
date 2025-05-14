// File: lib/widgets/service_report/scale_type_selector.dart

import 'package:flutter/material.dart';

class ScaleTypeSelector extends StatelessWidget {
  final String? selectedType;
  final String? selectedSubtype;
  final bool enabled;
  final ValueChanged<String?> onTypeChanged;
  final ValueChanged<String?> onSubtypeChanged;

  const ScaleTypeSelector({
    super.key,
    required this.selectedType,
    required this.selectedSubtype,
    required this.enabled,
    required this.onTypeChanged,
    required this.onSubtypeChanged,
  });

  static const List<String> scaleTypes = [
    'Truck',
    'Floor',
    'Bench',
    'Bulk Weigher',
    'Multi-Animal',
    'Squeeze',
    'Rail',
    'Axle',
    'Hopper',
    'Crane',
    'Other',
  ];

  static const List<String> subtypes = [
    'Electronic',
    'Mechanical',
    'Electro-Mechanical',
  ];

  @override
  Widget build(BuildContext context) {
    final validSelectedType = scaleTypes.contains(selectedType) ? selectedType : null;
    final validSelectedSubtype = subtypes.contains(selectedSubtype) ? selectedSubtype : null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Scale Type & Subtype', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: validSelectedType,
                items: scaleTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: enabled ? onTypeChanged : null,
                decoration: InputDecoration(
                  labelText: 'Type',
                  filled: true,
                  fillColor: enabled ? Colors.teal.shade50 : Colors.grey.shade200,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonFormField<String>(
                value: validSelectedSubtype,
                items: subtypes.map((subtype) {
                  return DropdownMenuItem(
                    value: subtype,
                    child: Text(subtype),
                  );
                }).toList(),
                onChanged: enabled ? onSubtypeChanged : null,
                decoration: InputDecoration(
                  labelText: 'Subtype',
                  filled: true,
                  fillColor: enabled ? Colors.teal.shade50 : Colors.grey.shade200,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

}
