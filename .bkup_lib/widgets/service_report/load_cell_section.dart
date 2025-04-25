import 'package:flutter/material.dart';

class LoadCellSection extends StatelessWidget {
  final TextEditingController capacityController;
  final String capacityUnit;
  final Function(String?) onCapacityUnitChanged;
  final TextEditingController modelController;

  const LoadCellSection({
    super.key,
    required this.capacityController,
    required this.capacityUnit,
    required this.onCapacityUnitChanged,
    required this.modelController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExpanded(_buildTextField('LC Capacity', capacityController, TextInputType.number, requiredField: false)),
        _buildExpanded(_buildDropdown('LC Unit', capacityUnit, ['kg', 'lb'], onCapacityUnitChanged)),
        _buildExpanded(_buildTextField('Load Cell Model', modelController, TextInputType.text, requiredField: false)),
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

  Widget _buildTextField(String label, TextEditingController controller, TextInputType inputType,
      {bool requiredField = true}) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.teal.shade50,
      ),
      validator: requiredField
          ? (value) => value == null || value.isEmpty ? 'Enter $label' : null
          : null,
    );
  }

  Widget _buildDropdown(String label, String selected, List<String> items, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: selected,
      items: items.map((val) => DropdownMenuItem(value: val, child: Text(val))).toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.teal.shade50,
      ),
    );
  }
}
