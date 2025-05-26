// File: lib/pages/admin/view_unsynced_work_orders_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/models/work_order_with_customer.dart';
import 'package:scalewrite_v2/pages/create_work_order_page.dart';
import 'package:scalewrite_v2/providers/drift_providers.dart';

class ViewUnsyncedWorkOrdersPage extends ConsumerWidget {
  const ViewUnsyncedWorkOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final future = ref.read(workOrderWithCustomerDaoProvider).getUnsyncedWorkOrders();

    return Scaffold(
      appBar: AppBar(title: const Text('Unsynced Work Orders')),
      body: FutureBuilder<List<WorkOrderWithCustomer>>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading work orders: ${snapshot.error}'));
          }

          final workOrders = snapshot.data ?? [];

          if (workOrders.isEmpty) {
            return const Center(child: Text('No unsynced work orders found.'));
          }

          return ListView.separated(
            itemCount: workOrders.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final wo = workOrders[index];
              return ListTile(
                title: Text('${wo.workOrder.workOrderNumber} - ${wo.customer.businessName}'),
                subtitle: Text(
                  '${wo.workOrder.siteCity}, ${wo.workOrder.siteProvince} • Last Modified: ${_formatDate(wo.workOrder.lastModified)}',
                ),
                trailing: const Icon(Icons.edit),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreateWorkOrderPage(existingWorkOrder: wo.workOrder),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
