// File: lib/widgets/work_order/contact_section.dart
import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController notes;
  final bool editable;

  const ContactSection({
    super.key,
    required this.name,
    required this.phone,
    required this.email,
    required this.notes,
    this.editable = true,
  });

  Widget _buildTextField(String label, TextEditingController controller,
      {String? Function(String?)? validator, void Function()? onBlur}) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus && onBlur != null) onBlur();
      },
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.teal.shade50,
        ),
        validator: validator,
        enabled: editable,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
          'Main Contact Name',
          name,
          validator: (value) =>
              value == null || value.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 10),
        _buildTextField(
          'Phone',
          phone,
          validator: (value) {
            if (value == null || value.isEmpty) return null;
            final pattern = RegExp(r'^\d{9}\$');
            return pattern.hasMatch(value) ? null : 'Enter 9-digit number';
          },
        ),
        const SizedBox(height: 10),
        _buildTextField(
          'Email',
          email,
          validator: (value) {
            if (value == null || value.isEmpty) return null;
            final pattern = RegExp(r'^.+@.+\..+\$');
            return pattern.hasMatch(value) ? null : 'Enter valid email';
          },
        ),
        const SizedBox(height: 10),
        _buildTextField('Notes', notes),
      ],
    );
  }
}
