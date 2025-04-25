import 'package:flutter/material.dart';

class IndicatorSection extends StatelessWidget {
  final TextEditingController makeController;
  final TextEditingController modelController;
  final TextEditingController serialController;
  final String prefixValue;
  final Function(String?) onPrefixChanged;
  final TextEditingController approvalCodeController;
  final String? Function(String?)? approvalCodeValidator;

  const IndicatorSection({
    super.key,
    required this.makeController,
    required this.modelController,
    required this.serialController,
    required this.prefixValue,
    required this.onPrefixChanged,
    required this.approvalCodeController,
    this.approvalCodeValidator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField('Indicator Make', makeController),
        const SizedBox(height: 10),
        _buildTextField('Indicator Model', modelController),
        const SizedBox(height: 10),
        _buildTextField('Indicator Serial', serialController),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                value: prefixValue,
                items: ['AM', 'SWA'].map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                onChanged: onPrefixChanged,
                decoration: InputDecoration(
                  labelText: 'Prefix',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.teal.shade50,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildTextField(
                'Approval Code',
                approvalCodeController,
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
    TextEditingController controller, {
    bool requiredField = true,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.teal.shade50,
      ),
      validator: validator ??
          (requiredField
              ? (value) => (value == null || value.isEmpty) ? 'Enter $label' : null
              : null),
    );
  }
}
