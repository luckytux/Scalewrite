// File: lib/widgets/contact_card.dart

import 'package:flutter/material.dart';
import '../../data/database.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final bool isMain;
  final VoidCallback? onSetMain;
  final VoidCallback? onEdit;
  final VoidCallback? onDeactivate;

  const ContactCard({
    super.key,
    required this.contact,
    this.isMain = false,
    this.onSetMain,
    this.onEdit,
    this.onDeactivate,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(
          isMain ? Icons.star : Icons.person,
          color: isMain ? Colors.amber : Colors.grey,
        ),
        title: Text(contact.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (contact.phone != null) Text('Phone: ${contact.phone}'),
            if (contact.email != null) Text('Email: ${contact.email}'),
            if (contact.notes != null) Text('Notes: ${contact.notes}'),
          ],
        ),
        isThreeLine: true,
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            switch (value) {
              case 'main':
                if (onSetMain != null) onSetMain!();
                break;
              case 'edit':
                if (onEdit != null) onEdit!();
                break;
              case 'deactivate':
                if (onDeactivate != null) onDeactivate!();
                break;
            }
          },
          itemBuilder: (context) => [
            if (!isMain)
              const PopupMenuItem(
                value: 'main',
                child: Text('Set as Main Contact'),
              ),
            const PopupMenuItem(
              value: 'edit',
              child: Text('Edit'),
            ),
            const PopupMenuItem(
              value: 'deactivate',
              child: Text('Deactivate'),
            ),
          ],
        ),
      ),
    );
  }
}
