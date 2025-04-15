// File: lib/pages/create_service_report_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../data/database.dart';
import '../providers/drift_providers.dart';

class CreateServiceReportPage extends ConsumerStatefulWidget {
  final WorkOrdersData workOrder;

  const CreateServiceReportPage({super.key, required this.workOrder});

  @override
  ConsumerState<CreateServiceReportPage> createState() => _CreateServiceReportPageState();
}

class _CreateServiceReportPageState extends ConsumerState<CreateServiceReportPage> {
  final _formKey = GlobalKey<FormState>();

  ScalesData? selectedScale;
  final indicatorModel = TextEditingController();
  final indicatorSerial = TextEditingController();
  final approvalCode = TextEditingController();

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    if (selectedScale == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please select a scale')));
      return;
    }

    final companion = ServiceReportsCompanion(
      workOrderId: Value(widget.workOrder.id),
      scaleId: Value(selectedScale!.id),
      reportType: const Value("General"),
      indicatorModel: Value(indicatorModel.text),
      indicatorSerial: Value(indicatorSerial.text),
      approvalCode: Value(approvalCode.text),
    );

    final dao = ref.read(serviceReportDaoProvider);
    await dao.insertReport(companion);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Service Report Saved')));
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    indicatorModel.dispose();
    indicatorSerial.dispose();
    approvalCode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaleDao = ref.read(scaleDaoProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Service Report')),
      body: FutureBuilder<List<ScalesData>>(
        future: scaleDao.getScalesForCustomer(widget.workOrder.customerId),
        builder: (context, snapshot) {
          final scales = snapshot.data ?? [];

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  DropdownButtonFormField<ScalesData>(
                    value: selectedScale,
                    items: scales.map((scale) {
                      return DropdownMenuItem(
                        value: scale,
                        child: Text('${scale.scaleType} - ${scale.indicatorModel}'),
                      );
                    }).toList(),
                    decoration: const InputDecoration(labelText: 'Select Scale'),
                    onChanged: (scale) => setState(() => selectedScale = scale),
                    validator: (_) => selectedScale == null ? 'Required' : null,
                  ),
                  TextFormField(
                    controller: indicatorModel,
                    decoration: const InputDecoration(labelText: 'Indicator Model'),
                    validator: (val) => val == null || val.isEmpty ? 'Required' : null,
                  ),
                  TextFormField(
                    controller: indicatorSerial,
                    decoration: const InputDecoration(labelText: 'Indicator Serial'),
                  ),
                  TextFormField(
                    controller: approvalCode,
                    decoration: const InputDecoration(labelText: 'Approval Code'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _save,
                    child: const Text('Save Service Report'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
