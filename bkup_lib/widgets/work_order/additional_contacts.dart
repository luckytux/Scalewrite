// File: lib/widgets/work_order/additional_contacts.dart
import 'package:flutter/material.dart';

class AdditionalContacts extends StatelessWidget {
  final List<Map<String, dynamic>> contacts;
  final VoidCallback onAdd;
  final void Function(int) onRemove;
  final bool editable;

  const AdditionalContacts({
    super.key,
    required this.contacts,
    required this.onAdd,
    required this.onRemove,
    this.editable = true,
  });

  Widget _buildContactFields(int index) {
    final contact = contacts[index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Additional Contact ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: contact['name'],
                enabled: editable,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) => value == null || value.isEmpty ? 'Required' : null,
              ),
            ),
            const SizedBox(width: 10),
            if (editable)
              IconButton(
                icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                onPressed: () => onRemove(index),
              ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: contact['phone'],
                enabled: editable,
                decoration: const InputDecoration(labelText: 'Phone (999999999)'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  final phonePattern = RegExp(r'^\d{9}\$');
                  if (!phonePattern.hasMatch(value)) return 'Must be 9 digits';
                  return null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: contact['email'],
                enabled: editable,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) return null;
                  final emailPattern = RegExp(r'^.+@.+\..+\$');
                  if (!emailPattern.hasMatch(value)) return 'Invalid email';
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: contact['notes'],
          enabled: editable,
          decoration: const InputDecoration(labelText: 'Notes'),
          maxLines: 2,
        ),
        const Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Additional Contacts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            if (editable)
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add_circle_outline, color: Colors.green),
              ),
          ],
        ),
        for (int i = 0; i < contacts.length; i++)
          if (contacts[i]['deactivated'] != true) _buildContactFields(i),
      ],
    );
  }
}
