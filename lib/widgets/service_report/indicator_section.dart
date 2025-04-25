// File: lib/widgets/service_report/indicator_section.dart

import 'package:flutter/material.dart';

class IndicatorSection extends StatelessWidget {
  final TextEditingController makeController;
  final TextEditingController modelController;
  final TextEditingController serialController;
  final String prefixValue;
  final Function(String?) onPrefixChanged;
  final TextEditingController approvalCodeController;
  final String? Function(String?)? approvalCodeValidator;
  final bool editable;

  const IndicatorSection({
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
    final fillColor = editable ? Colors.teal.shade50 : Colors.red.shade50;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Indicator Make', makeController, fillColor),
        const SizedBox(height: 10),
        _buildTextField('Indicator Model', modelController, fillColor),
        const SizedBox(height: 10),
        _buildTextField('Indicator Serial', serialController, fillColor),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: prefixValue,
                items: ['AM', 'SWA'].map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                onChanged: editable ? onPrefixChanged : null,
                decoration: InputDecoration(
                  labelText: 'Prefix',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: fillColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildTextField(
                'Approval Code',
                approvalCodeController,
                fillColor,
                validator: approvalCodeValidator,
                requiredField: false,
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
      readOnly: !editable,
    );
  }
} 
