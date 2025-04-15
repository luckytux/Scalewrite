// File: lib/widgets/contact_list_section.dart
import 'package:flutter/material.dart';
import 'package:scalewrite_v2/data/database.dart';

class ContactListSection extends StatelessWidget {
  final List<Contact> contacts;
  final VoidCallback onAddMainContact;
  final void Function(Contact contact) onRemove;

  const ContactListSection({
    super.key,
    required this.contacts,
    required this.onAddMainContact,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final mainContact = contacts.firstWhere(
      (c) => c.isMain,
      orElse: () => contacts.first,
    );

    final otherContacts = contacts.where((c) => !c.isMain).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Main Contact', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Card(
          elevation: 2,
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(mainContact.name),
            subtitle: Text('${mainContact.phone ?? ''} - ${mainContact.email ?? ''}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => onRemove(mainContact),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text('Additional Contacts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ...otherContacts.map(
          (contact) => Card(
            elevation: 1,
            child: ListTile(
              title: Text(contact.name),
              subtitle: Text('${contact.phone ?? ''} - ${contact.email ?? ''}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.star_border, color: Colors.teal),
                    tooltip: 'Make Main',
                    onPressed: onAddMainContact,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => onRemove(contact),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
