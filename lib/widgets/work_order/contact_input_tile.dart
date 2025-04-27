// File: lib/widgets/contact_input_tile.dart
import 'package:flutter/material.dart';
import 'package:scalewrite_v2/data/database.dart';
import '../common/rounded_text_field.dart';
import 'package:drift/drift.dart' as drift;

class ContactInputTile extends StatefulWidget {
  final Contact contact;
  final bool isMain;
  final VoidCallback? onMakeMain; // <- made nullable
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
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _emailController;
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.contact.name);
    _phoneController = TextEditingController(text: widget.contact.phone ?? '');
    _emailController = TextEditingController(text: widget.contact.email ?? '');
    _notesController = TextEditingController(text: widget.contact.notes ?? '');
  }

  void _handleUpdate() {
    final updated = widget.contact.copyWith(
      name: _nameController.text,
      phone: drift.Value(_phoneController.text),
      email: drift.Value(_emailController.text),
      notes: drift.Value(_notesController.text),
    );
    widget.onUpdate(updated);
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
              onEditingComplete: _handleUpdate,
            ),
            Row(
              children: [
                Expanded(
                  child: RoundedTextField(
                    controller: _phoneController,
                    label: 'Phone',
                    keyboardType: TextInputType.phone,
                    readOnly: widget.readOnly,
                    onEditingComplete: _handleUpdate,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: RoundedTextField(
                    controller: _emailController,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    readOnly: widget.readOnly,
                    onEditingComplete: _handleUpdate,
                  ),
                ),
              ],
            ),
            RoundedTextField(
              controller: _notesController,
              label: 'Notes',
              maxLines: 2,
              readOnly: widget.readOnly,
              onEditingComplete: _handleUpdate,
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
