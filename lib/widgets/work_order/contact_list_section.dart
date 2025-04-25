// File: lib/widgets/work_order/contact_list_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/widgets/contact_input_tile.dart';

class ContactListSection extends ConsumerWidget {
  const ContactListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Contacts', style: TextStyle(fontSize: 18)),
        for (final contact in controller.contacts)
          ContactInputTile(
            contact: contact,
            isMain: contact.isMain,
            readOnly: !controller.customerFieldsEnabled,
            onMakeMain: () => controller.makeMainContact(contact),
            onRemove: () => controller.removeContact(contact),
            onUpdate: (updated) => controller.updateContact(updated),
          ),
        TextButton.icon(
          onPressed: controller.customerFieldsEnabled ? controller.addNewContact : null,
          icon: const Icon(Icons.add),
          label: const Text('Add Contact'),
        ),
      ],
    );
  }
}
