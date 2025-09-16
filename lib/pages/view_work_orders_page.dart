// File: lib/pages/view_work_orders_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/work_order_with_customer.dart';
import '../models/service_report_with_scale.dart';
import '../providers/drift_providers.dart';
import 'create_work_order_page.dart';
import 'create_service_report_page.dart' as sr;
import 'create_weight_test_page.dart';
import 'work_order_billing_page.dart';

class ViewWorkOrdersPage extends ConsumerWidget {
  const ViewWorkOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Work Orders')),
      body: FutureBuilder<List<WorkOrderWithCustomer>>(
        future: ref.read(workOrderWithCustomerDaoProvider).getWorkOrdersWithCustomerName(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Text('Error loading Work Orders: ${snapshot.error}'),
            );
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
              return ExpansionTile(
                title: GestureDetector(
                  onTap: () {
                    debugPrint('📦 Tapped Work Order ID: ${wo.workOrder.id}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CreateWorkOrderPage(existingWorkOrder: wo.workOrder),
                      ),
                    );
                  },
                  child: Text(
                    '${wo.workOrder.workOrderNumber} - ${wo.customer.businessName} - ${wo.workOrder.siteCity}, ${wo.workOrder.siteProvince}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle: Text('Last Modified: ${_formatDate(wo.workOrder.lastModified)}'),
                children: [
                  // 💳 Billing entry
                  ListTile(
                    leading: const Icon(Icons.receipt_long),
                    title: const Text('Billing'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => WorkOrderBillingPage(
                            workOrderId: wo.workOrder.id,
                          ),
                        ),
                      );
                    },
                  ),

                  // Service Reports section
                  FutureBuilder<List<ServiceReportWithScale>>(
                    future: ref.read(serviceReportDaoProvider).getReportsWithScaleByWorkOrder(wo.workOrder.id),
                    builder: (context, reportSnapshot) {
                      if (reportSnapshot.connectionState == ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (reportSnapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Error loading reports: ${reportSnapshot.error}'),
                        );
                      }

                      final reports = reportSnapshot.data ?? [];

                      if (reports.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('No Service Reports added'),
                        );
                      }

                      return Column(
                        children: reports.map((report) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                dense: true,
                                title: Text(
                                  'SR#${report.report.id} — ${report.scale.indicatorModel} — ${report.scale.indicatorSerial}',
                                ),
                                subtitle: Text('${report.scale.baseModel ?? ''} — ${report.scale.baseSerial ?? ''}'),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => sr.CreateServiceReportPage(
                                        serviceReportId: report.report.id, // open existing report
                                      ),
                                    ),
                                  );
                                },
                              ),
                              FutureBuilder(
                                future: ref.read(weightTestDaoProvider).getByServiceReportId(report.report.id),
                                builder: (context, weightTestSnapshot) {
                                  if (weightTestSnapshot.connectionState == ConnectionState.waiting) {
                                    return const Padding(
                                      padding: EdgeInsets.only(left: 32.0, bottom: 12.0),
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  final test = weightTestSnapshot.data;

                                  return Padding(
                                    padding: const EdgeInsets.only(left: 32.0, bottom: 12.0),
                                    child: test == null
                                        ? TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => CreateWeightTestPage(
                                                    serviceReportId: report.report.id,
                                                    division: report.scale.division,
                                                    numberOfSections: report.scale.numberOfSections,
                                                    existingWeightTest: null,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: const Text('• Add Weight Test'),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) => CreateWeightTestPage(
                                                    serviceReportId: report.report.id,
                                                    division: report.scale.division,
                                                    numberOfSections: report.scale.numberOfSections,
                                                    existingWeightTest: test,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              '• Weight Test (Max Error: ${test.eccentricityError ?? 'N/A'})',
                                              style: const TextStyle(color: Colors.blue),
                                            ),
                                          ),
                                  );
                                },
                              ),
                            ],
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
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
