// File: lib/widgets/work_order/contact_list_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite/providers/work_order_form_provider.dart';
import 'package:scalewrite/widgets/work_order/contact_input_tile.dart';

class ContactListSection extends ConsumerWidget {
  const ContactListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contacts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),

        // ⭐ Give each row a stable key so reordering (after "Make Main") doesn't scramble state.
        ...controller.contacts.map((contact) => Padding(
              key: ValueKey('contact-pad-${contact.id}'),
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ContactInputTile(
                key: ValueKey('contact-${contact.id}'), // <- important
                contact: contact,
                isMain: contact.isMain,
                readOnly: controller.contactsReadOnly,
                onMakeMain: controller.contactsReadOnly
                    ? null
                    : () => controller.makeMainContact(contact),
                onRemove: controller.contactsReadOnly
                    ? () {}
                    : () => controller.removeContact(contact),
                onUpdate: (updated) => controller.updateContact(updated),
              ),
            )),

        if (controller.contactValidationError)
          const Padding(
            padding: EdgeInsets.only(top: 4, left: 8),
            child: Text(
              'At least one contact must have a name and a phone number or email.',
              style: TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),

        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: controller.contactsReadOnly ? null : controller.addNewContact,
            icon: const Icon(Icons.add),
            label: const Text('Add Contact'),
            style: TextButton.styleFrom(
              foregroundColor: controller.contactsReadOnly ? Colors.grey : Colors.teal,
            ),
          ),
        ),
      ],
    );
  }
}
