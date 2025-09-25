// File: lib/widgets/service_report/work_order_dropdown.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite/data/database.dart';
import 'package:scalewrite/providers/drift_providers.dart';

class WorkOrderDropdown extends ConsumerWidget {
  final WorkOrder? selected;
  final Function(WorkOrder?) onSelected;

  const WorkOrderDropdown({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dao = ref.watch(workOrderDaoProvider);

    return FutureBuilder<List<(WorkOrder, Customer)>>(
      future: dao.getAllWorkOrdersWithCustomers(),
      builder: (context, snapshot) {
        final items = snapshot.data ?? [];

        return DropdownButtonFormField<WorkOrder>(
          value: selected,
          decoration: const InputDecoration(labelText: 'Work Order'),
          items: items.map((pair) {
            final wo = pair.$1;
            final customer = pair.$2;
            return DropdownMenuItem(
              value: wo,
              child: Text('${wo.workOrderNumber} – ${customer.businessName}'),
            );
          }).toList(),
          onChanged: onSelected,
          validator: (val) => val == null ? 'Required' : null,
        );
      },
    );
  }
}
