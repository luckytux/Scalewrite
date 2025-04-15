import 'package:flutter/material.dart';

class ScaleTypeSelector extends StatelessWidget {
  final String? selectedMainType;
  final String? selectedSubtype;
  final String? otherType;
  final ValueChanged<String?> onMainTypeChanged;
  final ValueChanged<String?> onSubtypeChanged;
  final ValueChanged<String?> onOtherTypeChanged;

  const ScaleTypeSelector({
    super.key,
    required this.selectedMainType,
    required this.selectedSubtype,
    required this.otherType,
    required this.onMainTypeChanged,
    required this.onSubtypeChanged,
    required this.onOtherTypeChanged,
  });

  static const List<String> mainTypes = [
    'Truck',
    'Floor',
    'Bench',
    'Bulk Weigher',
    'Multi-Animal',
    'Squeeze',
    'Rail',
    'Axle',
    'Other'
  ];

  static const List<String> subtypes = [
    'Electronic',
    'Mechanical',
    'Electro-mechanical'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          value: selectedMainType,
          items: mainTypes.map((type) => DropdownMenuItem(
            value: type,
            child: Text(type),
          )).toList(),
          onChanged: onMainTypeChanged,
          decoration: InputDecoration(
            labelText: 'Scale Type',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: Colors.teal.shade50,
          ),
          validator: (val) => val == null || val.isEmpty ? 'Select a scale type' : null,
        ),
        const SizedBox(height: 10),
        if (selectedMainType != null && selectedMainType != 'Other')
          DropdownButtonFormField<String>(
            value: selectedSubtype,
            items: subtypes.map((type) => DropdownMenuItem(
              value: type,
              child: Text(type),
            )).toList(),
            onChanged: onSubtypeChanged,
            decoration: InputDecoration(
              labelText: 'Subtype',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.teal.shade50,
            ),
            validator: (val) => val == null || val.isEmpty ? 'Select a subtype' : null,
          ),
        if (selectedMainType == 'Other')
          TextFormField(
            initialValue: otherType,
            onChanged: onOtherTypeChanged,
            decoration: InputDecoration(
              labelText: 'Custom Scale Type',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.teal.shade50,
            ),
            validator: (val) => val == null || val.isEmpty ? 'Enter custom type' : null,
          ),
      ],
    );
  }
}
