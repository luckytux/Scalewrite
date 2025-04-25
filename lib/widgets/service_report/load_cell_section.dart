// File: lib/widgets/service_report/load_cell_section.dart
import 'package:flutter/material.dart';

class LoadCellSection extends StatelessWidget {
  final TextEditingController capacityController;
  final String capacityUnit;
  final Function(String?) onCapacityUnitChanged;
  final TextEditingController modelController;
  final bool editable;

  const LoadCellSection({
    super.key,
    required this.capacityController,
    required this.capacityUnit,
    required this.onCapacityUnitChanged,
    required this.modelController,
    this.editable = true,
  });

  @override
  Widget build(BuildContext context) {
    final fillColor = editable ? Colors.teal.shade50 : Colors.red.shade50;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExpanded(_buildTextField('LC Capacity', capacityController, TextInputType.number, fillColor)),
        _buildExpanded(_buildDropdown('LC Unit', capacityUnit, ['kg', 'lb'], onCapacityUnitChanged, fillColor)),
        _buildExpanded(_buildTextField('Load Cell Model', modelController, TextInputType.text, fillColor)),
      ],
    );
  }

  Widget _buildExpanded(Widget child) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: child,
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, TextInputType inputType, Color fillColor) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      readOnly: !editable,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: fillColor,
      ),
    );
  }

  Widget _buildDropdown(String label, String selected, List<String> items, Function(String?) onChanged, Color fillColor) {
    return DropdownButtonFormField<String>(
      value: selected,
      items: items.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
      onChanged: editable ? onChanged : null,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: fillColor,
      ),
    );
  }
} 