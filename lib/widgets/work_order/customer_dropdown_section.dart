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

    return DropdownButtonFormField<int>(
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
      value: controller.selectedCustomerId,
      items: dropdownItems,
      onChanged: controller.editingWorkOrderId == null
          ? (value) => controller.selectCustomer(value, customers)
          : null,
      validator: (val) => val == null ? 'Please select or create a customer' : null,
    );
  }
}
