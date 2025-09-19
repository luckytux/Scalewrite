// File: lib/widgets/service_report/scale_type_selector.dart
import 'package:flutter/material.dart';
import '../common/arrow_dropdown_button.dart';

class ScaleTypeSelector extends StatelessWidget {
  final String? selectedType;
  final String? selectedSubtype;
  final bool enabled;
  final ValueChanged<String?> onTypeChanged;
  final ValueChanged<String?> onSubtypeChanged;

  /// Base order for focus traversal. (Type = orderBase, Subtype = orderBase + 1)
  final int orderBase;

  const ScaleTypeSelector({
    super.key,
    required this.selectedType,
    required this.selectedSubtype,
    required this.enabled,
    required this.onTypeChanged,
    required this.onSubtypeChanged,
    this.orderBase = 0,
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
    // Ensure we don't pass an invalid selection
    final validType =
        scaleTypes.contains(selectedType) ? selectedType : null;
    final validSubtype =
        subtypes.contains(selectedSubtype) ? selectedSubtype : null;

    final typeItems = scaleTypes
        .map<DropdownMenuItem<String>>(
          (t) => DropdownMenuItem<String>(value: t, child: Text(t)),
        )
        .toList();

    final subtypeItems = subtypes
        .map<DropdownMenuItem<String>>(
          (s) => DropdownMenuItem<String>(value: s, child: Text(s)),
        )
        .toList();

    final fillColor = enabled ? Colors.teal.shade50 : Colors.grey.shade200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Scale Type & Subtype',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // Type
            Expanded(
              child: FocusTraversalOrder(
                order: NumericFocusOrder(orderBase + 0),
                child: ArrowDropdownButton<String>(
                  items: typeItems,
                  selected: validType,
                  onChanged: enabled ? onTypeChanged : null,
                  enabled: enabled,
                  decoration: InputDecoration(
                    labelText: 'Type',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: fillColor,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    constraints: const BoxConstraints(minHeight: 56),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Subtype
            Expanded(
              child: FocusTraversalOrder(
                order: NumericFocusOrder(orderBase + 1),
                child: ArrowDropdownButton<String>(
                  items: subtypeItems,
                  selected: validSubtype,
                  onChanged: enabled ? onSubtypeChanged : null,
                  enabled: enabled,
                  decoration: InputDecoration(
                    labelText: 'Subtype',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: fillColor,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 16,
                    ),
                    constraints: const BoxConstraints(minHeight: 56),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
