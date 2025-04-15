// File: lib/controllers/work_order_form_controller.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../data/database.dart';
import '../data/tables/work_orders.dart';
import '../providers/drift_providers.dart';
import '../utils/id_generator.dart';

final workOrderFormProvider = ChangeNotifierProvider((ref) {
  final db = ref.read(databaseProvider);
  final dao = db.workOrderDao;
  return WorkOrderFormController(dao);
});

class WorkOrderFormController extends ChangeNotifier {
  final WorkOrderDao dao;

  WorkOrderFormController(this.dao);

  final formKey = GlobalKey<FormState>();

  final businessName = TextEditingController();
  final billingAddress = TextEditingController();
  final city = TextEditingController();
  final province = TextEditingController();
  final postal = TextEditingController();
  final gpsLocation = TextEditingController();
  final customerNotes = TextEditingController();

  Future<void> save() async {
    if (!formKey.currentState!.validate()) return;

    final workOrder = WorkOrdersCompanion(
      workOrderNumber: drift.Value(IdGenerator.generateWorkOrderNumber()),
      businessName: drift.Value(businessName.text),
      billingAddress: drift.Value(billingAddress.text),
      city: drift.Value(city.text),
      province: drift.Value(province.text),
      postal: drift.Value(postal.text),
      gpsLocation: drift.Value(gpsLocation.text),
      customerNotes: drift.Value(customerNotes.text),
    );

    await dao.insertWorkOrder(workOrder);
  }

  void disposeFields() {
    businessName.dispose();
    billingAddress.dispose();
    city.dispose();
    province.dispose();
    postal.dispose();
    gpsLocation.dispose();
    customerNotes.dispose();
  }

  @override
  void dispose() {
    disposeFields();
    super.dispose();
  }
}

