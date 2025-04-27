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

  // Customer related
  int? selectedCustomerId;
  String? workOrderNumber;
  bool customerFieldsEnabled = false;
  bool showBilling = false;

  // Site address fields
  final siteAddress = TextEditingController();
  final siteCity = TextEditingController();
  final siteProvince = TextEditingController();
  final sitePostal = TextEditingController();
  final gpsLocation = TextEditingController();

  // Billing address fields
  final billingAddress = TextEditingController();
  final billingCity = TextEditingController();
  final billingProvince = TextEditingController();
  final billingPostal = TextEditingController();

  // Notes
  final customerNotes = TextEditingController();

  // Contacts
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

  // Province list
  List<String> get provinces => [
    'Alberta',
    'British Columbia',
    'Saskatchewan',
    'Manitoba',
    'Ontario',
    'Quebec',
    'New Brunswick',
    'Nova Scotia',
    'Prince Edward Island',
    'Newfoundland and Labrador',
    'Yukon',
    'Northwest Territories',
    'Nunavut',
  ];

  // UI Controls
  void enableCustomerEditing() {
    customerFieldsEnabled = !customerFieldsEnabled;
    notifyListeners();
  }

  void toggleBillingVisibility(bool value) {
    showBilling = value;
    notifyListeners();
  }

  // 🔵 Selecting Customer: populate fields safely
  void selectCustomer(int? customerId, List<Customer> customers) {
    selectedCustomerId = customerId;

    if (customerId != null) {
      final customer = customers.firstWhere((c) => c.id == customerId);

      siteAddress.text = customer.siteAddress ?? '';
      siteCity.text = customer.siteCity ?? '';
      siteProvince.text = customer.siteProvince ?? '';
      sitePostal.text = customer.sitePostalCode ?? '';
      gpsLocation.text = customer.gpsLocation ?? '';

      billingAddress.text = customer.billingAddress ?? '';
      billingCity.text = customer.billingCity ?? '';
      billingProvince.text = customer.billingProvince ?? '';
      billingPostal.text = customer.billingPostalCode ?? '';

      customerNotes.text = customer.notes ?? '';

      generateWorkOrderNumber();
    }

    notifyListeners();
  }

  void generateWorkOrderNumber() {
    final now = DateTime.now();
    final uid = now.millisecondsSinceEpoch.toString().substring(7); // simple UID
    workOrderNumber = 'WO-$uid-${now.year}${now.month.toString().padLeft(2, '0')}${now.day.toString().padLeft(2, '0')}-${now.hour.toString().padLeft(2, '0')}${now.minute.toString().padLeft(2, '0')}';
  }

  // Contact Functions
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

  void updateContact(Contact updated) {
    final index = _contacts.indexWhere((c) => c.id == updated.id);
    if (index != -1) {
      _contacts[index] = updated;
    }
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

    _contacts.sort((a, b) {
      if (a.isMain) return -1;
      if (b.isMain) return 1;
      return 0;
    });

    notifyListeners();
  }

  void removeContact(Contact contact) {
    final wasMain = contact.isMain;
    _contacts.removeWhere((c) => c.id == contact.id);

    if (wasMain && _contacts.isNotEmpty) {
      final first = _contacts.first;
      _contacts[0] = first.copyWith(isMain: true, auditFlag: true);
    }

    notifyListeners();
  }

  // Save Work Order
  Future<bool> save() async {
    if (!formKey.currentState!.validate() || selectedCustomerId == null) {
      return false;
    }

    final dao = ref.read(workOrderDaoProvider);

    final entry = WorkOrdersCompanion(
      customerId: drift.Value(selectedCustomerId!),
      siteAddress: drift.Value(siteAddress.text),
      siteCity: drift.Value(siteCity.text),
      siteProvince: drift.Value(siteProvince.text),
      sitePostalCode: drift.Value(cleanPostalCode(sitePostal.text)),
      gpsLocation: drift.Value(gpsLocation.text),
      billingAddress: drift.Value(showBilling ? billingAddress.text : siteAddress.text),
      billingCity: drift.Value(showBilling ? billingCity.text : siteCity.text),
      billingProvince: drift.Value(showBilling ? billingProvince.text : siteProvince.text),
      billingPostalCode: drift.Value(showBilling ? cleanPostalCode(billingPostal.text) : cleanPostalCode(sitePostal.text)),
      customerNotes: drift.Value(customerNotes.text),
      workOrderNumber: drift.Value(workOrderNumber ?? ''),
    );

    await dao.insertWorkOrder(entry);
    return true;
  }

  // Helpers
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
    siteAddress.dispose();
    siteCity.dispose();
    siteProvince.dispose();
    sitePostal.dispose();
    gpsLocation.dispose();
    billingAddress.dispose();
    billingCity.dispose();
    billingProvince.dispose();
    billingPostal.dispose();
    customerNotes.dispose();
    super.dispose();
  }
}
