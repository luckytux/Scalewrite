// File: lib/providers/work_order_form_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../data/database.dart';
import '../providers/drift_providers.dart';

final workOrderFormProvider = ChangeNotifierProvider<WorkOrderFormController>((ref) {
  return WorkOrderFormController(ref);
});

class WorkOrderFormController extends ChangeNotifier {
  final Ref ref;
  final formKey = GlobalKey<FormState>();

  int? selectedCustomerId;
  int? editingWorkOrderId;
  String? workOrderNumber;
  bool customerFieldsEnabled = false;
  bool showBilling = false;

  final businessNameController = TextEditingController();
  final siteAddressController = TextEditingController();
  final siteCityController = TextEditingController();
  final siteProvinceController = TextEditingController();
  final sitePostalController = TextEditingController();
  final gpsLocationController = TextEditingController();

  final billingAddressController = TextEditingController();
  final billingCityController = TextEditingController();
  final billingProvinceController = TextEditingController();
  final billingPostalController = TextEditingController();

  final customerNotesController = TextEditingController();

  List<Contact> _contacts = [];
  List<Contact> get contacts => List.unmodifiable(_contacts);

  Contact? get mainContact {
    try {
      return _contacts.firstWhere((c) => c.isMain);
    } catch (_) {
      return _contacts.isNotEmpty ? _contacts.first : null;
    }
  }

  WorkOrderFormController(this.ref);

  void resetForm() {
    selectedCustomerId = null;
    editingWorkOrderId = null;
    workOrderNumber = generateWorkOrderNumber(101); // Temporary UID
    customerFieldsEnabled = true;
    showBilling = false;

    businessNameController.clear();
    siteAddressController.clear();
    siteCityController.clear();
    siteProvinceController.text = 'Alberta';
    sitePostalController.clear();
    gpsLocationController.clear();

    billingAddressController.clear();
    billingCityController.clear();
    billingProvinceController.text = 'Alberta';
    billingPostalController.clear();

    customerNotesController.clear();
    _contacts.clear();
    notifyListeners();
  }

  List<String> get provinces => [
    'Alberta', 'British Columbia', 'Saskatchewan', 'Manitoba', 'Ontario',
    'Quebec', 'New Brunswick', 'Nova Scotia', 'Prince Edward Island',
    'Newfoundland and Labrador', 'Yukon', 'Northwest Territories', 'Nunavut',
  ];

  String generateWorkOrderNumber(int uid) {
    final now = DateTime.now();
    final date = '${now.year}${_twoDigits(now.month)}${_twoDigits(now.day)}';
    final time = '${_twoDigits(now.hour)}${_twoDigits(now.minute)}';
    return '$uid-$date-$time';
  }

  void loadExistingWorkOrder(WorkOrder wo) {
    editingWorkOrderId = wo.id;
    selectedCustomerId = wo.customerId;
    workOrderNumber = wo.workOrderNumber;

    siteAddressController.text = wo.siteAddress;
    siteCityController.text = wo.siteCity;
    siteProvinceController.text = wo.siteProvince;
    sitePostalController.text = wo.sitePostalCode;
    gpsLocationController.text = wo.gpsLocation;

    billingAddressController.text = wo.billingAddress ?? '';
    billingCityController.text = wo.billingCity ?? '';
    billingProvinceController.text = wo.billingProvince ?? '';
    billingPostalController.text = wo.billingPostalCode ?? '';

    showBilling = wo.billingAddress != null;
    notifyListeners();
  }

  Future<void> selectCustomer(int? customerId, List<Customer> customers) async {
  selectedCustomerId = customerId;

  if (customerId == null) {
    _clearFields();
    customerFieldsEnabled = true; // Allow editing for new customers
  } else {
    final customer = customers.firstWhere((c) => c.id == customerId);

    businessNameController.text = customer.businessName;
    siteAddressController.text = customer.siteAddress ?? '';
    siteCityController.text = customer.siteCity ?? '';
    siteProvinceController.text = (customer.siteProvince?.isNotEmpty ?? false) ? customer.siteProvince! : 'Alberta';
    sitePostalController.text = customer.sitePostalCode ?? '';
    gpsLocationController.text = customer.gpsLocation ?? '';

    billingAddressController.text = customer.billingAddress ?? '';
    billingCityController.text = customer.billingCity ?? '';
    billingProvinceController.text = (customer.billingProvince?.isNotEmpty ?? false) ? customer.billingProvince! : 'Alberta';
    billingPostalController.text = customer.billingPostalCode ?? '';

    customerFieldsEnabled = false; // Lock fields by default for existing customers

    final contactDao = ref.read(contactDaoProvider);
    final customerContacts = await contactDao.getContactsForCustomer(customerId);
    _contacts = customerContacts;
  }

  notifyListeners();
}


  void _clearFields() {
    businessNameController.clear();
    siteAddressController.clear();
    siteCityController.clear();
    siteProvinceController.text = 'Alberta';
    sitePostalController.clear();
    gpsLocationController.clear();
    billingAddressController.clear();
    billingCityController.clear();
    billingProvinceController.text = 'Alberta';
    billingPostalController.clear();
    _contacts.clear();
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  void enableCustomerEditing(bool value) {
    customerFieldsEnabled = value;
    notifyListeners();
  }

  void toggleBillingVisibility(bool value) {
    showBilling = value;
    notifyListeners();
  }

  void addNewContact() {
    _contacts.add(Contact(
      id: DateTime.now().millisecondsSinceEpoch,
      customerId: selectedCustomerId ?? 0,
      name: '',
      phone: '',
      email: '',
      notes: '',
      isMain: _contacts.isEmpty,
      deactivate: false,
      auditFlag: true,
      synced: false,
    ));
    notifyListeners();
  }

  void makeMainContact(Contact contact) {
    _contacts = _contacts.map((c) {
      if (c.id == contact.id) {
        return c.copyWith(isMain: true, auditFlag: true);
      } else if (c.isMain) {
        return c.copyWith(isMain: false, auditFlag: true);
      }
      return c;
    }).toList();
    notifyListeners();
  }

  void removeContact(Contact contact) {
    final wasMain = contact.isMain;
    _contacts.removeWhere((c) => c.id == contact.id);

    if (wasMain && _contacts.isNotEmpty) {
      _contacts[0] = _contacts[0].copyWith(isMain: true, auditFlag: true);
    }

    notifyListeners();
  }

  void updateContact(Contact updated) {
    final index = _contacts.indexWhere((c) => c.id == updated.id);
    if (index != -1) {
      _contacts[index] = updated;
      notifyListeners();
    }
  }

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    final db = ref.read(databaseProvider);

    int? customerId = selectedCustomerId;

    if (customerId == null) {
      if (businessNameController.text.trim().isEmpty ||
          siteAddressController.text.trim().isEmpty ||
          siteCityController.text.trim().isEmpty) {
        return false;
      }

      final customerEntry = CustomersCompanion(
        businessName: drift.Value(businessNameController.text),
        siteAddress: drift.Value(siteAddressController.text),
        siteCity: drift.Value(siteCityController.text),
        siteProvince: drift.Value(siteProvinceController.text),
        sitePostalCode: drift.Value(cleanPostalCode(sitePostalController.text)),
        billingAddress: drift.Value(showBilling ? billingAddressController.text : siteAddressController.text),
        billingCity: drift.Value(showBilling ? billingCityController.text : siteCityController.text),
        billingProvince: drift.Value(showBilling ? billingProvinceController.text : siteProvinceController.text),
        billingPostalCode: drift.Value(showBilling ? cleanPostalCode(billingPostalController.text) : cleanPostalCode(sitePostalController.text)),
        gpsLocation: drift.Value(gpsLocationController.text),
        notes: drift.Value(customerNotesController.text),
        deactivate: const drift.Value(false),
        auditFlag: const drift.Value(true),
        synced: const drift.Value(false),
      );

      customerId = await db.customerDao.insertCustomer(customerEntry);
      selectedCustomerId = customerId;
    }

    final workOrderEntry = WorkOrdersCompanion(
      customerId: drift.Value(customerId),
      workOrderNumber: drift.Value(workOrderNumber ?? ''),
      siteAddress: drift.Value(siteAddressController.text),
      siteCity: drift.Value(siteCityController.text),
      siteProvince: drift.Value(siteProvinceController.text),
      sitePostalCode: drift.Value(cleanPostalCode(sitePostalController.text)),
      gpsLocation: drift.Value(gpsLocationController.text),
      billingAddress: drift.Value(showBilling ? billingAddressController.text : siteAddressController.text),
      billingCity: drift.Value(showBilling ? billingCityController.text : siteCityController.text),
      billingProvince: drift.Value(showBilling ? billingProvinceController.text : siteProvinceController.text),
      billingPostalCode: drift.Value(showBilling ? cleanPostalCode(billingPostalController.text) : cleanPostalCode(sitePostalController.text)),
      customerNotes: drift.Value(customerNotesController.text),
    );

    if (editingWorkOrderId != null) {
      await db.workOrderDao.updateWorkOrder(editingWorkOrderId!, workOrderEntry);
    } else {
      await db.workOrderDao.insertWorkOrder(workOrderEntry);
    }

    return true;
  }

  String formatPostalCode(String input) {
    final cleaned = input.replaceAll(RegExp(r'\s+'), '').toUpperCase();
    if (cleaned.length == 6) {
      return '${cleaned.substring(0, 3)} ${cleaned.substring(3)}';
    }
    return input;
  }

  String cleanPostalCode(String input) {
    return input.replaceAll(RegExp(r'\s+'), '').toUpperCase();
  }

  @override
  void dispose() {
    businessNameController.dispose();
    siteAddressController.dispose();
    siteCityController.dispose();
    siteProvinceController.dispose();
    sitePostalController.dispose();
    gpsLocationController.dispose();
    billingAddressController.dispose();
    billingCityController.dispose();
    billingProvinceController.dispose();
    billingPostalController.dispose();
    customerNotesController.dispose();
    super.dispose();
  }
}
