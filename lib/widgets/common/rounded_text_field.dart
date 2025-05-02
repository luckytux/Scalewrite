// File: lib/widgets/common/rounded_text_field.dart
import 'package:flutter/material.dart';

class RoundedTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType? keyboardType;
  final int maxLines;
  final bool readOnly;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;
  final Widget? suffixIcon; // <-- ✅ NEW

  const RoundedTextField({
    super.key,
    required this.controller,
    required this.label,
    this.keyboardType,
    this.maxLines = 1,
    this.readOnly = false,
    this.validator,
    this.onEditingComplete,
    this.suffixIcon, // <-- ✅ NEW
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        labelText: label,
        suffixIcon: suffixIcon, // <-- ✅ NEW
        filled: true,
        fillColor: readOnly ? Colors.grey.shade200 : Colors.teal.shade50,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal.shade200),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
