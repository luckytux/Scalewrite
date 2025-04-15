// File: lib/pages/create_edit_scale_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../../data/tables/scales.dart';
import '../../providers/drift_providers.dart';

class CreateEditScalePage extends ConsumerStatefulWidget {
  final int customerId;
  final Scale? existingScale;

  const CreateEditScalePage({
    super.key,
    required this.customerId,
    this.existingScale,
  });

  @override
  ConsumerState<CreateEditScalePage> createState() => _CreateEditScalePageState();
}

class _CreateEditScalePageState extends ConsumerState<CreateEditScalePage> {
  final _formKey = GlobalKey<FormState>();

  final typeController = TextEditingController();
  final subtypeController = TextEditingController();
  final indicatorModel = TextEditingController();
  final indicatorSerial = TextEditingController();
  final approvalCode = TextEditingController();
  final capacityValue = TextEditingController();
  final capacityUnit = TextEditingController();
  final division = TextEditingController();

  @override
  void initState() {
    super.initState();
    final s = widget.existingScale;
    if (s != null) {
      typeController.text = s.scaleType;
      subtypeController.text = s.scaleSubtype;
      indicatorModel.text = s.indicatorModel;
      indicatorSerial.text = s.indicatorSerial;
      approvalCode.text = s.approvalCode;
      capacityValue.text = s.capacityValue.toString();
      capacityUnit.text = s.capacityUnit;
      division.text = s.division.toString();
    }
  }

  @override
  void dispose() {
    typeController.dispose();
    subtypeController.dispose();
    indicatorModel.dispose();
    indicatorSerial.dispose();
    approvalCode.dispose();
    capacityValue.dispose();
    capacityUnit.dispose();
    division.dispose();
    super.dispose();
  }

  Future<void> saveScale() async {
    if (!_formKey.currentState!.validate()) return;

    final scaleDao = ref.read(scaleDaoProvider);

    final companion = ScalesCompanion(
      id: widget.existingScale == null ? const Value.absent() : Value(widget.existingScale!.id),
      customerId: Value(widget.customerId),
      scaleType: Value(typeController.text),
      scaleSubtype: Value(subtypeController.text),
      indicatorModel: Value(indicatorModel.text),
      indicatorSerial: Value(indicatorSerial.text),
      approvalCode: Value(approvalCode.text),
      capacityValue: Value(double.tryParse(capacityValue.text) ?? 0),
      capacityUnit: Value(capacityUnit.text),
      division: Value(double.tryParse(division.text) ?? 0),
    );

    if (widget.existingScale == null) {
      await scaleDao.insertScale(companion);
    } else {
      await scaleDao.updateScale(companion);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Scale saved')),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.existingScale == null ? 'Create Scale' : 'Edit Scale'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: typeController, decoration: const InputDecoration(labelText: 'Scale Type')),
              TextFormField(controller: subtypeController, decoration: const InputDecoration(labelText: 'Subtype')),
              TextFormField(controller: indicatorModel, decoration: const InputDecoration(labelText: 'Indicator Model')),
              TextFormField(controller: indicatorSerial, decoration: const InputDecoration(labelText: 'Indicator Serial')),
              TextFormField(controller: approvalCode, decoration: const InputDecoration(labelText: 'Approval Code')),
              TextFormField(controller: capacityValue, decoration: const InputDecoration(labelText: 'Capacity Value')),
              TextFormField(controller: capacityUnit, decoration: const InputDecoration(labelText: 'Capacity Unit')),
              TextFormField(controller: division, decoration: const InputDecoration(labelText: 'Division')),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveScale,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
