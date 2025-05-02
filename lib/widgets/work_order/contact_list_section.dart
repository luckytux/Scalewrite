// File: lib/widgets/work_order/contact_list_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/widgets/work_order/contact_input_tile.dart';

class ContactListSection extends ConsumerWidget {
  const ContactListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider); // <<< FIXED: watch, not read.notifier

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contacts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),
        ...controller.contacts.map((contact) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: ContactInputTile(
                contact: contact,
                isMain: contact.isMain,
                readOnly: !controller.customerFieldsEnabled,
                onMakeMain: () => controller.makeMainContact(contact),
                onRemove: () => controller.removeContact(contact),
                onUpdate: (updated) => controller.updateContact(updated),
              ),
            )),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(
            onPressed: controller.customerFieldsEnabled ? controller.addNewContact : null,
            icon: const Icon(Icons.add),
            label: const Text('Add Contact'),
            style: TextButton.styleFrom(
              foregroundColor: controller.customerFieldsEnabled ? Colors.teal : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
