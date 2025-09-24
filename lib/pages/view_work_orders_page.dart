// File: lib/pages/view_work_orders_page.dart

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/database.dart'; // for Drift data classes like WeightTest, Scale
import '../models/work_order_with_customer.dart';
import '../models/service_report_with_scale.dart';
import '../providers/drift_providers.dart';
import 'create_work_order_page.dart';
import 'create_service_report_page.dart' as sr;
import 'create_weight_test_page.dart';
import 'work_order_billing_page.dart';

// IPO
import '../data/static/ipo_checklists.dart';
import 'checklists/ipo_checklist_page.dart';

// Critical points + class inference
import '../utils/critical_test_points.dart';
import '../utils/scale_classification.dart';

class ViewWorkOrdersPage extends ConsumerWidget {
  const ViewWorkOrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Work Orders')),
      body: FutureBuilder<List<WorkOrderWithCustomer>>(
        future: ref
            .read(workOrderWithCustomerDaoProvider)
            .getWorkOrdersWithCustomerName(),
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            CreateWorkOrderPage(existingWorkOrder: wo.workOrder),
                      ),
                    );
                  },
                  child: Text(
                    '${wo.workOrder.workOrderNumber} - '
                    '${wo.customer.businessName} - '
                    '${wo.workOrder.siteCity}, ${wo.workOrder.siteProvince}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                subtitle:
                    Text('Last Modified: ${_formatDate(wo.workOrder.lastModified)}'),
                children: [
                  // 💳 Billing
                  ListTile(
                    leading: const Icon(Icons.receipt_long),
                    title: const Text('Billing'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              WorkOrderBillingPage(workOrderId: wo.workOrder.id),
                        ),
                      );
                    },
                  ),

                  // 📄 Service Reports — STREAM so IPO & Weight Test rows update live
                  StreamBuilder<List<ServiceReportWithScale>>(
                    stream: ref
                        .read(serviceReportDaoProvider)
                        .watchReportsWithScaleByWorkOrder(wo.workOrder.id),
                    builder: (context, reportSnapshot) {
                      if (reportSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (reportSnapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Error loading reports: ${reportSnapshot.error}'),
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
                          // Safe read of IPO JSON (already mapped via JsonConverter)
                          final Map<String, dynamic>? ipoJson =
                              report.report.ipoStateJson;

                          // Expected IPO payload shape:
                          // {
                          //   'schemaVersion': 1,
                          //   'template': 'IPO-1',
                          //   'completed': true,
                          //   'exceptions': <List<String>>,
                          //   'ts': '...'
                          // }
                          final String? template =
                              ipoJson?['template'] as String?;
                          final List<String> exceptions =
                              (ipoJson?['exceptions'] as List?)
                                      ?.cast<String>() ??
                                  const <String>[];
                          final bool hasIPO = template != null;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                dense: true,
                                title: Text(
                                  'SR#${report.report.id} — '
                                  '${report.scale.indicatorModel} — '
                                  '${report.scale.indicatorSerial}',
                                ),
                                subtitle: Text(
                                  '${report.scale.baseModel ?? ''} — '
                                  '${report.scale.baseSerial ?? ''}',
                                ),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => sr.CreateServiceReportPage(
                                        serviceReportId: report.report.id,
                                      ),
                                    ),
                                  );
                                },
                              ),

                              // ⚖️ Weight Test — STREAM so it appears/updates immediately
                              StreamBuilder<WeightTest?>(
                                stream: ref
                                    .read(weightTestDaoProvider)
                                    .watchByServiceReportId(report.report.id),
                                builder: (context, wtSnapshot) {
                                  if (wtSnapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Padding(
                                      padding: EdgeInsets.only(
                                          left: 32.0, bottom: 12.0),
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  final test = wtSnapshot.data;

                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 32.0, bottom: 12.0),
                                    child: test == null
                                        ? TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      CreateWeightTestPage(
                                                    serviceReportId:
                                                        report.report.id,
                                                    division:
                                                        report.scale.division,
                                                    numberOfSections: report
                                                        .scale
                                                        .numberOfSections,
                                                    existingWeightTest: null,
                                                  ),
                                                ),
                                              );
                                            },
                                            child:
                                                const Text('• Add Weight Test'),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) =>
                                                      CreateWeightTestPage(
                                                    serviceReportId:
                                                        report.report.id,
                                                    division:
                                                        report.scale.division,
                                                    numberOfSections: report
                                                        .scale
                                                        .numberOfSections,
                                                    existingWeightTest: test,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Text(
                                              _weightTestSummary(test, report.scale),
                                              style: const TextStyle(
                                                  color: Colors.blue),
                                            ),
                                          ),
                                  );
                                },
                              ),

                              // ✅ IPO checklist row — driven by the same SR stream
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 32.0, bottom: 12.0),
                                child: hasIPO
                                    ? InkWell(
                                        onTap: () {
                                          final String tpl = template!; // safe because hasIPO == true
                                          final ipo = ipoChecklists[tpl];
                                          if (ipo == null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text('IPO template not found')),
                                            );
                                            return;
                                          }
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => IPOChecklistPage(
                                                ipoType: tpl, // non-nullable
                                                serviceReportId: report.report.id,
                                                ipoTitle: '$tpl — ${ipo.title}',
                                                sections: ipo.sections,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Text(
                                          exceptions.isEmpty
                                              ? '• IPO Checklist — $template (no exceptions)'
                                              : '• IPO Checklist — $template (${exceptions.length} exception${exceptions.length == 1 ? '' : 's'})',
                                          style: const TextStyle(
                                              color: Colors.blue),
                                        ),
                                      )
                                    : TextButton(
                                        onPressed: () {
                                          const defaultTemplate = 'IPO-1';
                                          final ipo =
                                              ipoChecklists[defaultTemplate];
                                          if (ipo == null) {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text(
                                                        'Default IPO template not found')));
                                            return;
                                          }
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) => IPOChecklistPage(
                                                ipoType: defaultTemplate,
                                                serviceReportId:
                                                    report.report.id,
                                                ipoTitle:
                                                    '$defaultTemplate — ${ipo.title}',
                                                sections: ipo.sections,
                                              ),
                                            ),
                                          );
                                        },
                                        child:
                                            const Text('• Add IPO Checklist'),
                                      ),
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
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-'
        '${date.day.toString().padLeft(2, '0')}';
  }
}

// ────────────────────────────────────────────────────────────────────────────
// Helpers for Weight Test summary with class inference + critical-point diffs
// ────────────────────────────────────────────────────────────────────────────

String _fmt(num v) => v.toStringAsFixed(3);

/// Packs parallel test/diff columns into a clean list of rows (skips nulls).
List<(double test, double diff)> _packRows({
  required List<double?> tests,
  required List<double?> diffs,
}) {
  final out = <(double,double)>[];
  final len = math.min(tests.length, diffs.length);
  for (var i = 0; i < len; i++) {
    final t = tests[i];
    final d = diffs[i];
    if (t != null && d != null) out.add((t, d));
  }
  return out;
}

/// Return rows whose test mass matches any required critical mass within ±e/2.
List<(double test, double diff)> _criticalAt({
  required List<(double test, double diff)> rows,
  required List<double> requiredMasses,
  required double division,
}) {
  if (rows.isEmpty || requiredMasses.isEmpty || division <= 0) return const [];
  final eps = division / 2.0;
  final out = <(double,double)>[];
  for (final r in rows) {
    final hit = requiredMasses.any((req) => (r.$1 - req).abs() <= eps);
    if (hit) out.add(r);
  }
  return out;
}

/// Max absolute diff from a set of rows.
double? _maxAbsDiff(List<(double test, double diff)> rows) {
  if (rows.isEmpty) return null;
  double m = 0;
  for (final r in rows) {
    final a = r.$2.abs();
    if (a > m) m = a;
  }
  return m;
}

/// Builds a compact summary for a weight test using math-based class inference.
String _weightTestSummary(WeightTest t, Scale scale) {
  final unit = (t.weightTestUnit?.trim().isNotEmpty ?? false)
      ? ' ${t.weightTestUnit!.trim()}'
      : '';

  final division  = scale.division;   // e
  final capacity  = scale.capacity;   // Max
  final n         = countsFromCapacity(capacity: capacity, division: division);
  final scaleClass = inferScaleClass(division: division, n: n);

  // Pack rows
  final found = _packRows(
    tests: [t.asFoundTest1, t.asFoundTest2, t.asFoundTest3, t.asFoundTest4, t.asFoundTest5, t.asFoundTest6],
    diffs: [t.asFoundDiff1, t.asFoundDiff2, t.asFoundDiff3, t.asFoundDiff4, t.asFoundDiff5, t.asFoundDiff6],
  );
  final left = _packRows(
    tests: [t.asLeftTest1, t.asLeftTest2, t.asLeftTest3, t.asLeftTest4, t.asLeftTest5, t.asLeftTest6],
    diffs: [t.asLeftDiff1, t.asLeftDiff2, t.asLeftDiff3, t.asLeftDiff4, t.asLeftDiff5, t.asLeftDiff6],
  );

  // Required critical masses (class + e + capacity)
  final requiredCrit = criticalMassesByClass(
    scaleClass,
    division,
    capacity: capacity,
  );

  final parts = <String>[];

  // Eccentricity quick read
  final eccAF = t.eccentricityError?.trim();
  final eccAL = t.asLeftEccentricityError?.trim();
  if ((eccAF?.isNotEmpty ?? false) || (eccAL?.isNotEmpty ?? false)) {
    if ((eccAF?.isNotEmpty ?? false) && (eccAL?.isNotEmpty ?? false)) {
      parts.add('ecc: AF=$eccAF, AL=$eccAL');
    } else if ((eccAF?.isNotEmpty ?? false)) {
      parts.add('ecc: AF=$eccAF');
    } else if ((eccAL?.isNotEmpty ?? false)) {
      parts.add('ecc: AL=$eccAL');
    }
  }

  // As-Found summary
  final maxAF  = _maxAbsDiff(found);
  final critAF = _criticalAt(rows: found, requiredMasses: requiredCrit, division: division);
  if (maxAF != null || critAF.isNotEmpty) {
    final segs = <String>[];
    if (maxAF != null) segs.add('maxΔ=${_fmt(maxAF)}');
    if (critAF.isNotEmpty) {
      segs.add('crit: ${critAF.map((e) => '@${_fmt(e.$1)}$unit Δ=${_fmt(e.$2)}').join(' | ')}');
    }
    parts.add('AF ${segs.join(' · ')}');
  }

  // As-Left summary
  final maxAL  = _maxAbsDiff(left);
  final critAL = _criticalAt(rows: left, requiredMasses: requiredCrit, division: division);
  if (maxAL != null || critAL.isNotEmpty) {
    final segs = <String>[];
    if (maxAL != null) segs.add('maxΔ=${_fmt(maxAL)}');
    if (critAL.isNotEmpty) {
      segs.add('crit: ${critAL.map((e) => '@${_fmt(e.$1)}$unit Δ=${_fmt(e.$2)}').join(' | ')}');
    }
    parts.add('AL ${segs.join(' · ')}');
  }

  if (parts.isEmpty) return '• Weight Test (saved)';
  return '• Weight Test — ${parts.join('  |  ')}';
}
