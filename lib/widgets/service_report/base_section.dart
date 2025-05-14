// File: lib/widgets/service_report/base_section.dart
import 'package:flutter/material.dart';

class BaseSection extends StatelessWidget {
  final TextEditingController makeController;
  final TextEditingController modelController;
  final TextEditingController serialController;
  final String prefixValue;
  final Function(String?) onPrefixChanged;
  final TextEditingController approvalCodeController;
  final String? Function(String?)? approvalCodeValidator;
  final bool editable;

  const BaseSection({
    super.key,
    required this.makeController,
    required this.modelController,
    required this.serialController,
    required this.prefixValue,
    required this.onPrefixChanged,
    required this.approvalCodeController,
    this.approvalCodeValidator,
    this.editable = true,
  });

  @override
  Widget build(BuildContext context) {
    final fillColor = editable ? Colors.teal.shade50 : Colors.grey.shade200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Base Make', makeController, fillColor),
        const SizedBox(height: 10),
        _buildTextField('Base Model', modelController, fillColor),
        const SizedBox(height: 10),
        _buildTextField('Base Serial Number', serialController, fillColor),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: prefixValue,
                items: ['AM', 'SWA']
                    .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                    .toList(),
                onChanged: editable ? onPrefixChanged : null,
                decoration: InputDecoration(
                  labelText: 'Base Approval Prefix (AM/SWA)',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: fillColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildTextField(
                'Base Approval Number',
                approvalCodeController,
                fillColor,
                requiredField: false,
                validator: approvalCodeValidator ?? (value) {
                  debugPrint('🔍 Validating Base Approval Number: "$value"');
                  if (!editable) return null;
                  if (value == null || value.isEmpty) return null;
                  if (!RegExp(r'^\d{4}$').hasMatch(value)) return 'Must be 4 digits';
                  return null;
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller,
    Color fillColor, {
    bool requiredField = true,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      readOnly: !editable,
      keyboardType: label.contains('Approval') ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: fillColor,
      ),
      validator: validator ??
          (requiredField
              ? (value) => (value == null || value.isEmpty) ? 'Enter $label' : null
              : null),
    );
  }
}
