// File: lib/widgets/work_order/work_order_dropdown.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/tables/work_orders.dart';
import '../../providers/work_order_provider.dart';

class WorkOrderDropdown extends ConsumerWidget {
  final WorkOrder? selected;
  final void Function(WorkOrder?) onChanged;

  const WorkOrderDropdown({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workOrders = ref.watch(workOrderListProvider);

    return workOrders.when(
      data: (orders) => DropdownButtonFormField<WorkOrder>(
        value: selected,
        decoration: const InputDecoration(labelText: 'Select Work Order'),
        items: orders.map((wo) {
          return DropdownMenuItem(
            value: wo,
            child: Text(wo.workOrderNumber),
          );
        }).toList(),
        onChanged: onChanged,
      ),
      loading: () => const CircularProgressIndicator(),
      error: (err, _) => Text('Error loading: $err'),
    );
  }
}
