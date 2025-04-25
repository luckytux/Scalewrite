// File: lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/tables/work_orders.dart';
import 'create_work_order_page.dart';
import 'create_service_report_page.dart';
import '../providers/work_order_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workOrdersAsync = ref.watch(workOrderListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: workOrdersAsync.when(
        data: (workOrders) {
          return ListView.builder(
            itemCount: workOrders.length,
            itemBuilder: (context, index) {
              final wo = workOrders[index];
              return ListTile(
                title: Text(wo.workOrderNumber),
                subtitle: Text(wo.description ?? ''),
                trailing: IconButton(
                  icon: const Icon(Icons.note_add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreateServiceReportPage(workOrder: wo),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateWorkOrderPage()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
