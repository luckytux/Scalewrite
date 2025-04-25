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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildExpanded(_buildTextField('Capacity', capacityController, TextInputType.number)),
        _buildExpanded(_buildDropdown('Capacity Unit', capacityUnit, ['kg', 'lb', 't'], onCapacityUnitChanged)),
        _buildExpanded(_buildTextField('Division', divisionController, TextInputType.number, validator: divisionValidator)),
        _buildExpanded(_buildDropdown('Division Unit', divisionUnit, ['kg', 'g', 'mg', 't', 'lb', 'lb-oz'], onDivisionUnitChanged)),
        _buildExpanded(_buildTextField(
          '# of Load Cells',
          loadCellsController,
          TextInputType.number,
          validator: (value) => integerValidator?.call(value, '# of Load Cells', 1, 20),
        )),
        _buildExpanded(_buildTextField(
          'Sections',
          sectionsController,
          TextInputType.number,
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
    TextInputType inputType, {
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.teal.shade50,
      ),
      validator: validator,
    );
  }

  Widget _buildDropdown(
    String label,
    String selected,
    List<String> items,
    Function(String?) onChanged,
  ) {
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
