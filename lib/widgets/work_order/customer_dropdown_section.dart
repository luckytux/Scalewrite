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

    final dropdownItems = customers.map((c) {
      return DropdownMenuItem<int>(
        value: c.id,
        child: Text(c.businessName),
      );
    }).toList();

    dropdownItems.insert(
      0,
      const DropdownMenuItem<int>(
        value: null,
        child: Text('Create New Customer'),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<int>(
          decoration: const InputDecoration(labelText: 'Customer'),
          value: controller.selectedCustomerId,
          items: dropdownItems,
          onChanged: (value) {
            controller.selectCustomer(value);
            if (value != null) {
              final selected = customers.firstWhere((c) => c.id == value);
              controller.populateCustomerFields(selected);
            }
          },
          validator: (val) => val == null ? 'Please select a customer' : null,
        ),
        if (controller.workOrderNumber != null)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Work Order #: ${controller.workOrderNumber!}'),
          ),
      ],
    );
  }
}
