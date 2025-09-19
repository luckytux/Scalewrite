import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../common/arrow_dropdown_button.dart';

class BaseSection extends StatelessWidget {
  final TextEditingController makeController;
  final TextEditingController modelController;
  final TextEditingController serialController;
  final String prefixValue;
  final Function(String?) onPrefixChanged;
  final TextEditingController approvalCodeController;
  final String? Function(String?)? approvalCodeValidator;
  final bool editable;
  final int orderBase;

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
    this.orderBase = 100,
  });

  static const _fieldHeight = 56.0;

  @override
  Widget build(BuildContext context) {
    final fillColor = editable ? Colors.teal.shade50 : Colors.grey.shade200;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FocusTraversalOrder(
          order: NumericFocusOrder(orderBase + 0),
          child: _buildTextField('Base Make', makeController, fillColor),
        ),
        const SizedBox(height: 10),
        FocusTraversalOrder(
          order: NumericFocusOrder(orderBase + 1),
          child: _buildTextField('Base Model', modelController, fillColor),
        ),
        const SizedBox(height: 10),
        FocusTraversalOrder(
          order: NumericFocusOrder(orderBase + 2),
          child: _buildTextField('Base Serial Number', serialController, fillColor),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: FocusTraversalOrder(
                order: NumericFocusOrder(orderBase + 3),
                child: SizedBox(
                  height: _fieldHeight,
                  child: ArrowDropdownButton<String>(
                    selected: prefixValue,
                    onChanged: editable ? onPrefixChanged : null,
                    enabled: editable,
                    items: const ['AM', 'SWA']
                        .map<DropdownMenuItem<String>>(
                          (p) => DropdownMenuItem<String>(
                            value: p,
                            child: Text(p),
                          ),
                        )
                        .toList(),
                    decoration: InputDecoration(
                      labelText: 'Base Approval Prefix (AM/SWA)',
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
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: FocusTraversalOrder(
                order: NumericFocusOrder(orderBase + 4),
                child: _buildTextField(
                  'Base Approval Number',
                  approvalCodeController,
                  fillColor,
                  requiredField: false,
                  validator: approvalCodeValidator ??
                      (value) {
                        if (!editable) return null;
                        if (value == null || value.isEmpty) return null;
                        if (!RegExp(r'^\d{4}$').hasMatch(value)) {
                          return 'Must be 4 digits';
                        }
                        return null;
                      },
                ),
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
    final isApproval = label.contains('Approval');
    return TextFormField(
      controller: controller,
      readOnly: !editable,
      textInputAction: TextInputAction.next,
      keyboardType: isApproval ? TextInputType.number : TextInputType.text,
      inputFormatters: isApproval
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
            ]
          : null,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: fillColor,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        constraints: const BoxConstraints(minHeight: 56), // ← key line
      ),
      validator: validator ??
          (requiredField
              ? (value) => (value == null || value.isEmpty) ? 'Enter $label' : null
              : null),
    );
  }
}
