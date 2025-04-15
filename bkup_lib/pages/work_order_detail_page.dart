// File: lib/pages/work_order_detail_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/tables/work_orders.dart';
import '../../data/tables/service_reports.dart';
import '../../providers/drift_providers.dart';
import 'create_service_report_page.dart';
import 'view_weight_test_page.dart';

class WorkOrderDetailPage extends ConsumerWidget {
  final WorkOrder workOrder;

  const WorkOrderDetailPage({super.key, required this.workOrder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsStream = ref.watch(serviceReportDaoProvider)
        .watchReportsForWorkOrder(workOrder.id);

    return Scaffold(
      appBar: AppBar(title: Text('Work Order ${workOrder.workOrderNumber}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: StreamBuilder<List<ServiceReport>>(
          stream: reportsStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();
            final reports = snapshot.data!;
            if (reports.isEmpty) {
              return const Center(child: Text('No service reports found.'));
            }
            return ListView.builder(
              itemCount: reports.length,
              itemBuilder: (context, index) {
                final report = reports[index];
                return ListTile(
                  title: Text('Service Report #${report.id}'),
                  subtitle: Text('Scale: ${report.scaleId ?? "Not Set"}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.article),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewWeightTestPage(serviceReportId: report.id),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CreateServiceReportPage(workOrder: workOrder),
          ),
        ),
      ),
    );
  }
}
