// File: lib/pages/work_order_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/work_order_provider.dart';
import 'package:scalewrite_v2/models/work_order.dart';

class WorkOrderListPage extends ConsumerWidget {
  const WorkOrderListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workOrders = ref.watch(workOrdersProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Work Orders')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: workOrders.when(
          data: (list) => list.isEmpty
              ? const Center(child: Text('No work orders found.'))
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final wo = list[index];
                    return ListTile(
                      title: Text(wo.workOrderNumber),
                      subtitle: Text(wo.description),
                      trailing: Text(
                        '${wo.createdAt.toLocal()}'.split(' ')[0],
                        style: const TextStyle(fontSize: 12),
                      ),
                    );
                  },
                ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }
}
