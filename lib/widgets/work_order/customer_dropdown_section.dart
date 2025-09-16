// File: lib/widgets/work_order/customer_dropdown_section.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/data/database.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';

class CustomerDropdownSection extends ConsumerWidget {
  final List<Customer> customers;

  const CustomerDropdownSection({super.key, required this.customers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);
    final readOnly = controller.editingWorkOrderId != null;

    // Compute the initial text for the field without dummy Customer objects.
    String initialText() {
      final id = controller.selectedCustomerId;
      if (id == null) return controller.businessNameController.text;
      for (final c in customers) {
        if (c.id == id) return c.businessName; // non-nullable
      }
      return controller.businessNameController.text; // fallback if not found
    }

    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue value) {
        final input = value.text.trim().toLowerCase();
        if (input.isEmpty) return const Iterable<String>.empty();

        final matches = customers
            .where((c) => c.businessName.toLowerCase().contains(input))
            .map((c) => c.businessName)
            .toList();

        if (!matches.any((m) => m.toLowerCase() == input)) {
          matches.add('+ Add "$input" as New Customer');
        }

        return matches;
      },
      initialValue: TextEditingValue(text: initialText()),
      onSelected: (String selection) {
        if (selection.startsWith('+ Add "')) {
          final match =
              RegExp(r'\+ Add "(.*)" as New Customer').firstMatch(selection);
          final newName = match?.group(1) ?? '';
          controller.setIsCreatingNewCustomer(newName);
        } else {
          final selectedCustomer = customers.firstWhere(
            (c) => c.businessName == selection,
            orElse: () => customers.first,
          );
          controller.selectCustomer(selectedCustomer.id, customers);
        }
      },
      fieldViewBuilder:
          (context, textController, focusNode, onFieldSubmitted) {
        return TextFormField(
          key: ValueKey(controller.selectedCustomerId),
          controller: textController,
          focusNode: focusNode,
          readOnly: readOnly,
          decoration: InputDecoration(
            labelText: 'Customer',
            filled: true,
            fillColor: Colors.teal.shade50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ),
          validator: (val) {
            if ((val?.trim().isEmpty ?? true) &&
                controller.selectedCustomerId == null) {
              return 'Please select or create a customer';
            }
            return null;
          },
          onChanged: (text) {
            // User is typing; treat as free-text customer until they pick one.
            controller.selectedCustomerId = null;
            controller.businessNameController.text = text;
          },
        );
      },
    );
  }
}
