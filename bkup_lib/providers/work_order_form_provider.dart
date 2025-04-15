// File: lib/providers/work_order_form_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/daos/work_order_dao.dart';
import '../../data/tables/work_orders.dart';
import '../../providers/drift_providers.dart';

final workOrderFormProvider = ChangeNotifierProvider((ref) {
  final dao = ref.read(workOrderDaoProvider);
  return WorkOrderFormController(dao);
});

class WorkOrderFormController extends ChangeNotifier {
  final WorkOrderDao workOrderDao;

  WorkOrderFormController(this.workOrderDao);

  final formKey = GlobalKey<FormState>();

  int? selectedCustomerId;

  final company = TextEditingController();
  final invoiceAddress = TextEditingController();
  final invoiceCity = TextEditingController();
  final invoiceProvince = TextEditingController();
  final invoicePostal = TextEditingController();

  final billingAddress = TextEditingController();
  final billingCity = TextEditingController();
  final billingProvince = TextEditingController();
  final billingPostal = TextEditingController();

  final descriptionController = TextEditingController();

  bool sameBilling = true;
  bool editCustomerFields = false;

  void toggleBillingSame() {
    sameBilling = !sameBilling;
    notifyListeners();
  }

  void toggleEditCustomerFields() {
    editCustomerFields = !editCustomerFields;
    notifyListeners();
  }

  void setCustomer({
    required int customerId,
    required String name,
    required String address,
    required String city,
    required String province,
    required String postal,
  }) {
    selectedCustomerId = customerId;

    company.text = name;
    invoiceAddress.text = address;
    invoiceCity.text = city;
    invoiceProvince.text = province;
    invoicePostal.text = postal;

    notifyListeners();
  }

  String generateWorkOrderNumber() {
    final now = DateTime.now();
    final date = "${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}";
    final time = "${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}";
    return 'WO-101-$date-$time';
  }

  Future<int?> saveWorkOrder() async {
    if (formKey.currentState?.validate() != true || selectedCustomerId == null) {
      return null;
    }

    final workOrder = WorkOrdersCompanion.insert(
      customerId: selectedCustomerId!,
      workOrderNumber: generateWorkOrderNumber(),
      createdAt: DateTime.now(),
      description: Value(descriptionController.text),
      billingAddress: Value(billingAddress.text),
      billingCity: Value(billingCity.text),
      billingProvince: Value(billingProvince.text),
      billingPostal: Value(billingPostal.text),
      gpsLocation: const Value.absent(),
      customerNotes: const Value.absent(),
    );

    final id = await workOrderDao.insertWorkOrder(workOrder);
    return id;
  }
}
