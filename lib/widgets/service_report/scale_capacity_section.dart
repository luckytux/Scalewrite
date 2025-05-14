// File: lib/widgets/service_report/scale_capacity_section.dart
import 'package:flutter/material.dart';

class ScaleCapacitySection extends StatelessWidget {
  final TextEditingController capacityController;
  final String capacityUnit;
  final Function(String?) onCapacityUnitChanged;

  final TextEditingController divisionController;
  final String divisionUnit;
  final Function(String?) onDivisionUnitChanged;

  final TextEditingController loadCellsController;
  final TextEditingController sectionsController;

  final String? Function(String?)? divisionValidator;
  final String? Function(String?, String, int, int)? integerValidator;

  final bool editable;

  const ScaleCapacitySection({
    super.key,
    required this.capacityController,
    required this.capacityUnit,
    required this.onCapacityUnitChanged,
    required this.divisionController,
    required this.divisionUnit,
    required this.onDivisionUnitChanged,
    required this.loadCellsController,
    required this.sectionsController,
    this.divisionValidator,
    this.integerValidator,
    this.editable = true,
  });

  @override
  Widget build(BuildContext context) {
    final fillColor = editable ? Colors.teal.shade50 : Colors.grey.shade200;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExpanded(_buildTextField('Capacity', capacityController, TextInputType.number, fillColor)),
        _buildExpanded(_buildDropdown('Capacity Unit', capacityUnit, ['kg', 'lb', 't'], onCapacityUnitChanged, fillColor)),
        _buildExpanded(_buildTextField('Division', divisionController, TextInputType.number, fillColor, validator: divisionValidator)),
        _buildExpanded(_buildDropdown('Division Unit', divisionUnit, ['kg', 'g', 'mg', 't', 'lb', 'lb-oz'], onDivisionUnitChanged, fillColor)),
        _buildExpanded(_buildTextField(
          '# of Load Cells',
          loadCellsController,
          TextInputType.number,
          fillColor,
          validator: (value) => integerValidator?.call(value, '# of Load Cells', 1, 20),
        )),
        _buildExpanded(_buildTextField(
          'Sections',
          sectionsController,
          TextInputType.number,
          fillColor,
          validator: (value) => integerValidator?.call(value, 'Sections', 1, 10),
        )),
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

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    TextInputType inputType,
    Color fillColor, {
    String? Function(String?)? validator,
  }) {
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
      validator: validator,
    );
  }

  Widget _buildDropdown(
    String label,
    String selected,
    List<String> items,
    Function(String?) onChanged,
    Color fillColor,
  ) {
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
