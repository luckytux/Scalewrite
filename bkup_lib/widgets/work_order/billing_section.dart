// File: lib/widgets/work_order/billing_section.dart
import 'package:flutter/material.dart';

class BillingSection extends StatelessWidget {
  final bool sameBilling;
  final void Function(bool?) onToggle;
  final TextEditingController billingAddress;
  final TextEditingController billingCity;
  final TextEditingController billingProvince;
  final TextEditingController billingPostal;
  final bool enabled;

  const BillingSection({
    super.key,
    required this.sameBilling,
    required this.onToggle,
    required this.billingAddress,
    required this.billingCity,
    required this.billingProvince,
    required this.billingPostal,
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
    bool enabled = true,
  }) {
    return Focus(
      onFocusChange: (hasFocus) {
        if (!hasFocus && onBlur != null) onBlur();
      },
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: enabled ? Colors.teal.shade50 : Colors.grey.shade200,
        ),
        validator: validator,
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
        Row(
          children: [
            const Text('Billing address same as above?'),
            Radio<bool>(
              value: true,
              groupValue: sameBilling,
              onChanged: enabled ? onToggle : null,
            ),
            const Text('Yes'),
            Radio<bool>(
              value: false,
              groupValue: sameBilling,
              onChanged: enabled ? onToggle : null,
            ),
            const Text('No'),
          ],
        ),
        if (!sameBilling) ...[
          _buildHalfRow([
            _buildTextField(
              'Billing Address',
              billingAddress,
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              enabled: enabled,
            ),
            _buildTextField(
              'City',
              billingCity,
              validator: (v) => v == null || v.isEmpty ? 'Required' : null,
              enabled: enabled,
            ),
          ]),
          _buildHalfRow([
            DropdownButtonFormField<String>(
              value: provinces.contains(billingProvince.text) ? billingProvince.text : null,
              items: provinces.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
              onChanged: enabled
                  ? (value) => billingProvince.text = value ?? ''
                  : null,
              decoration: InputDecoration(
                labelText: 'Province',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: enabled ? Colors.teal.shade50 : Colors.grey.shade200,
              ),
              validator: (value) => value == null || value.isEmpty ? 'Required' : null,
            ),
            _buildTextField(
              'Postal Code',
              billingPostal,
              validator: (value) {
                final pattern = RegExp(r'^[A-Za-z]\d[A-Za-z] ?\d[A-Za-z]\d$');
                if (value == null || value.isEmpty) return 'Required';
                if (!pattern.hasMatch(value.toUpperCase())) return 'Format: A1A 1A1';
                return null;
              },
              onBlur: () => _formatPostalCode(billingPostal),
              enabled: enabled,
            ),
          ]),
        ],
      ],
    );
  }
}
