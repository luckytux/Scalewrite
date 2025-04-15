// File: lib/controllers/work_order_form_controller.dart
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import '../data/database.dart';
import '../data/daos/work_order_dao.dart';
import '../data/daos/customer_dao.dart';

class WorkOrderFormController extends ChangeNotifier {
  final WorkOrderDao dao;
  final CustomerDao customerDao;
  final formKey = GlobalKey<FormState>();

  // Work Order info
  String? workOrderNumber;
  int? selectedCustomerId;

  // Text fields
  final siteAddress = TextEditingController();
  final siteCity = TextEditingController();
  final siteProvince = TextEditingController();
  final sitePostalCode = TextEditingController();
  final billingAddress = TextEditingController();
  final billingCity = TextEditingController();
  final billingProvince = TextEditingController();
  final billingPostalCode = TextEditingController();
  final gpsLocation = TextEditingController();
  final customerNotes = TextEditingController();

  // Contact handling
  List<Contact> _contacts = [];
  List<Contact> get activeContacts => _contacts.where((c) => !c.isMain).toList();

  Contact? get mainContact {
    try {
      return _contacts.firstWhere((c) => c.isMain);
    } catch (_) {
      return _contacts.isNotEmpty ? _contacts.first : null;
    }
  }

  // UI toggles
  bool showBillingFields = false;

  WorkOrderFormController(this.dao, this.customerDao);

  void toggleBillingFields([bool? value]) {
    showBillingFields = value ?? !showBillingFields;
    notifyListeners();
  }

  Future<void> selectCustomer(int? id) async {
    selectedCustomerId = id;
    workOrderNumber = _generateWorkOrderNumber();
    _contacts = id != null
        ? await customerDao.getContactsForCustomer(id)
        : [];
    notifyListeners();
  }

  void addNewContact() {
    _contacts.add(Contact(
      id: -1,
      customerId: selectedCustomerId ?? 0,
      name: '',
      phone: '',
      email: '',
      notes: '',
      isMain: false,
      deactivate: false,
      auditFlag: true,
      synced: false,
    ));
    notifyListeners();
  }

  void makeMainContact(Contact contact) {
    _contacts = _contacts.map((c) {
      if (c.id == contact.id) {
        return c.copyWith(isMain: true);
      } else if (c.isMain) {
        return c.copyWith(isMain: false);
      }
      return c;
    }).toList();
    notifyListeners();
  }

  void removeContact(Contact contact) {
    _contacts.removeWhere((c) => c.id == contact.id);
    notifyListeners();
  }

  String _generateWorkOrderNumber() {
    final now = DateTime.now();
    const uid = '101'; // Should be dynamically determined
    final formatter = DateFormat('yyyyMMdd-HHmm');
    return 'WO-$uid-${formatter.format(now)}';
  }

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) return false;

    final entry = WorkOrdersCompanion(
      customerId: drift.Value(selectedCustomerId ?? 0),
      workOrderNumber: drift.Value(workOrderNumber ?? _generateWorkOrderNumber()),
      siteAddress: drift.Value(siteAddress.text),
      siteCity: drift.Value(siteCity.text),
      siteProvince: drift.Value(siteProvince.text),
      sitePostalCode: drift.Value(sitePostalCode.text),
      billingAddress: showBillingFields ? drift.Value(billingAddress.text) : const drift.Value.absent(),
      billingCity: showBillingFields ? drift.Value(billingCity.text) : const drift.Value.absent(),
      billingProvince: showBillingFields ? drift.Value(billingProvince.text) : const drift.Value.absent(),
      billingPostalCode: showBillingFields ? drift.Value(billingPostalCode.text) : const drift.Value.absent(),
      gpsLocation: drift.Value(gpsLocation.text),
      customerNotes: drift.Value(customerNotes.text),
      auditFlag: const drift.Value(true),
    );

    await dao.insertWorkOrder(entry);
    return true;
  }

  @override
  void dispose() {
    siteAddress.dispose();
    siteCity.dispose();
    siteProvince.dispose();
    sitePostalCode.dispose();
    billingAddress.dispose();
    billingCity.dispose();
    billingProvince.dispose();
    billingPostalCode.dispose();
    gpsLocation.dispose();
    customerNotes.dispose();
    super.dispose();
  }
}
