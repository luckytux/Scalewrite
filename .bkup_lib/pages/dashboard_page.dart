// File: lib/pages/dashboard_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import '../providers/drift_providers.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerStream = ref.watch(customerDaoProvider).watchCustomers();
    final workOrderStream = ref.watch(workOrderDaoProvider).watchWorkOrders();
    final reportStream = ref.watch(serviceReportDaoProvider).watchAllReports();

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            const Text('Customers', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            StreamBuilder<List<CustomersData>>(
              stream: customerStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final customers = snapshot.data ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: customers.map((c) => Text('${c.name} (${c.city})')).toList(),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text('Work Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            StreamBuilder<List<WorkOrdersData>>(
              stream: workOrderStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final orders = snapshot.data ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: orders.map((wo) => Text('${wo.workOrderNumber}')).toList(),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text('Service Reports', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            StreamBuilder<List<ServiceReport>>(
              stream: reportStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                final reports = snapshot.data ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: reports.map((sr) => Text('Report ID ${sr.id} for WorkOrder ${sr.workOrderId}')).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
