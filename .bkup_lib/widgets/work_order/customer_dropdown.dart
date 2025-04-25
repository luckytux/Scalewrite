// File: lib/widgets/work_order/customer_dropdown.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/tables/customers.dart';
import '../../providers/customer_provider.dart';

class CustomerDropdown extends ConsumerWidget {
  final Customer? selected;
  final void Function(Customer?) onChanged;

  const CustomerDropdown({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customers = ref.watch(customerListProvider);

    return customers.when(
      data: (list) => DropdownButtonFormField<Customer>(
        value: selected,
        decoration: const InputDecoration(labelText: 'Select Customer'),
        items: list.map((c) {
          return DropdownMenuItem(
            value: c,
            child: Text('${c.name} (${c.city})'),
          );
        }).toList(),
        onChanged: onChanged,
      ),
      loading: () => const CircularProgressIndicator(),
      error: (err, _) => Text('Error loading: $err'),
    );
  }
}
