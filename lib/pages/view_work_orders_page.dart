// File: lib/pages/view_work_orders_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/drift_providers.dart';
import '../data/database.dart';
import 'create_work_order_page.dart';

class ViewWorkOrdersPage extends ConsumerWidget {
  const ViewWorkOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dao = ref.read(workOrderDaoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Work Orders')),
      body: FutureBuilder<List<WorkOrder>>(
        future: dao.getAllWorkOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error loading Work Orders: ${snapshot.error}'));
          }
          final workOrders = snapshot.data ?? [];
          if (workOrders.isEmpty) {
            return const Center(child: Text('No Work Orders Found'));
          }
          return ListView.separated(
            itemCount: workOrders.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final wo = workOrders[index];
              return ListTile(
                title: Text(
                  wo.workOrderNumber,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Customer ID: ${wo.customerId}'),
                    Text('${wo.siteCity}, ${wo.siteProvince}'),
                    Text('Last Modified: ${_formatDate(wo.lastModified)}'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreateWorkOrderPage(existingWorkOrder: wo),
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
