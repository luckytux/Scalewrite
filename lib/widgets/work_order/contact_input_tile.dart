// File: lib/widgets/contact_input_tile.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scalewrite_v2/data/database.dart';
import '../common/rounded_text_field.dart';
import 'package:drift/drift.dart' as drift;

class ContactInputTile extends StatefulWidget {
  final Contact contact;
  final bool isMain;
  final VoidCallback? onMakeMain;
  final VoidCallback onRemove;
  final void Function(Contact updated) onUpdate;
  final bool readOnly;

  const ContactInputTile({
    super.key,
    required this.contact,
    required this.isMain,
    required this.onMakeMain,
    required this.onRemove,
    required this.onUpdate,
    this.readOnly = false,
  });

  @override
  State<ContactInputTile> createState() => _ContactInputTileState();
}

class _ContactInputTileState extends State<ContactInputTile> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _nameController = TextEditingController(text: widget.contact.name);
    _phoneController = TextEditingController(text: _formatPhone(widget.contact.phone ?? ''));
    _emailController = TextEditingController(text: widget.contact.email ?? '');
    _notesController = TextEditingController(text: widget.contact.notes ?? '');
  }

  // ⭐ If this tile gets reused for a different contact (because of reordering),
  //    refresh the controllers so fields stay in sync with the new contact.
  @override
  void didUpdateWidget(covariant ContactInputTile oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.contact.id != widget.contact.id) {
      _nameController.dispose();
      _phoneController.dispose();
      _emailController.dispose();
      _notesController.dispose();
      _initControllers();
      setState(() {}); // ensure rebuild with new controller texts
    }
  }

  void _handleUpdate() {
    final cleanedPhone = _phoneController.text.replaceAll(RegExp(r'\D'), '');

    final updated = widget.contact.copyWith(
      name: _nameController.text,
      phone: drift.Value(cleanedPhone),
      email: drift.Value(_emailController.text),
      notes: drift.Value(_notesController.text),
    );
    widget.onUpdate(updated);
  }

  String _formatPhone(String digits) {
    digits = digits.replaceAll(RegExp(r'\D'), '');
    if (digits.length != 10) return digits;

    return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoundedTextField(
              controller: _nameController,
              label: 'Name',
              readOnly: widget.readOnly,
              onChanged: (_) => _handleUpdate(),
            ),
            Row(
              children: [
                Expanded(
                  child: RoundedTextField(
                    controller: _phoneController,
                    label: 'Phone',
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      _PhoneNumberFormatter(),
                    ],
                    readOnly: widget.readOnly,
                    onChanged: (_) => _handleUpdate(),
                    validator: (value) {
                      final digits = value?.replaceAll(RegExp(r'\D'), '') ?? '';
                      if (digits.isEmpty) return null; // optional field
                      if (digits.length != 10) return 'Enter a 10-digit phone number';
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: RoundedTextField(
                    controller: _emailController,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    readOnly: widget.readOnly,
                    onChanged: (_) => _handleUpdate(),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) return null;
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                      if (!emailRegex.hasMatch(value.trim())) {
                        return 'Enter a valid email address';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            RoundedTextField(
              controller: _notesController,
              label: 'Notes',
              maxLines: 2,
              readOnly: widget.readOnly,
              onChanged: (_) => _handleUpdate(),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!widget.isMain && !widget.readOnly && widget.onMakeMain != null)
                  TextButton.icon(
                    icon: const Icon(Icons.star_border),
                    label: const Text('Make Main'),
                    onPressed: widget.onMakeMain,
                  )
                else if (widget.isMain)
                  const Chip(
                    label: Text('Main Contact'),
                    backgroundColor: Colors.teal,
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                if (!widget.readOnly)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    tooltip: 'Remove Contact',
                    onPressed: widget.onRemove,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length && i < 10; i++) {
      if (i == 0) buffer.write('(');
      if (i == 3) buffer.write(') ');
      if (i == 6) buffer.write('-');
      buffer.write(digits[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
