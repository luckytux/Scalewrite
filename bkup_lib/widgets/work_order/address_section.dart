// File: lib/widgets/work_order/address_section.dart
import 'package:flutter/material.dart';

class AddressSection extends StatelessWidget {
  final TextEditingController company;
  final TextEditingController invoiceAddress;
  final TextEditingController city;
  final TextEditingController province;
  final TextEditingController postal;
  final bool enabled;

  const AddressSection({
    super.key,
    required this.company,
    required this.invoiceAddress,
    required this.city,
    required this.province,
    required this.postal,
    this.enabled = true,
  });

  static const List<String> provinces = [
    'Alberta',
    'British Columbia',
    'Saskatchewan',
    'Manitoba',
    'New Brunswick',
    'Newfoundland and Labrador',
    'Nova Scotia',
    'Ontario',
    'Prince Edward Island',
    'Quebec',
    'Northwest Territories',
    'Nunavut',
    'Yukon',
  ];

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    String? Function(String?)? validator,
    void Function()? onBlur,
  }) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus && onBlur != null) onBlur();
      },
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.teal.shade50,
        ),
      ),
    );
  }

  Widget _buildHalfRow(List<Widget> children) {
    return Row(
      children: children
          .map((child) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: child,
                ),
              ))
          .toList(),
    );
  }

  void _formatPostalCode(TextEditingController controller) {
    final text = controller.text.replaceAll(' ', '').toUpperCase();
    if (text.length == 6) {
      controller.text = '${text.substring(0, 3)} ${text.substring(3)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextField(
          'Company Name',
          company,
          validator: (value) =>
              value == null || value.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 10),
        _buildHalfRow([
          _buildTextField(
            'Address',
            invoiceAddress,
            validator: (value) =>
                value == null || value.isEmpty ? 'Required' : null,
          ),
          _buildTextField(
            'City',
            city,
            validator: (value) =>
                value == null || value.isEmpty ? 'Required' : null,
          ),
        ]),
        _buildHalfRow([
          DropdownButtonFormField<String>(
            value: provinces.contains(province.text) ? province.text : null,
            items: provinces
                .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                .toList(),
            onChanged: enabled ? (value) => province.text = value ?? '' : null,
            decoration: InputDecoration(
              labelText: 'Province',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.teal.shade50,
            ),
            validator: (value) =>
                value == null || value.isEmpty ? 'Required' : null,
          ),
          _buildTextField(
            'Postal Code',
            postal,
            validator: (value) {
              final pattern = RegExp(r'^[A-Za-z]\d[A-Za-z] ?\d[A-Za-z]\d$');
              if (value == null || value.isEmpty) return 'Required';
              if (!pattern.hasMatch(value.toUpperCase())) {
                return 'Format: A1A 1A1';
              }
              return null;
            },
            onBlur: () => _formatPostalCode(postal),
          ),
        ]),
      ],
    );
  }
}
