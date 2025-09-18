// File: lib/providers/work_order_form_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;

import '../data/database.dart';
import '../providers/drift_providers.dart' as providers;
import '../providers/auth_provider.dart' as auth;

final workOrderFormProvider =
    ChangeNotifierProvider<WorkOrderFormController>((ref) {
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

  bool contactValidationError = false;

  bool get contactsReadOnly =>
      selectedCustomerId != null && !customerFieldsEnabled;
  bool get isEditingExisting => editingWorkOrderId != null;

  Contact? get mainContact {
    try {
      return _contacts.firstWhere((c) => c.isMain);
    } catch (_) {
      return _contacts.isNotEmpty ? _contacts.first : null;
    }
  }

  WorkOrderFormController(this.ref);

  Future<void> resetForm() async {
    selectedCustomerId = null;
    editingWorkOrderId = null;
    await generateWorkOrderNumberForCurrentUser();
    customerFieldsEnabled = true;
    showBilling = false;
    contactValidationError = false;

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

  Future<void> generateWorkOrderNumberForCurrentUser() async {
    final user = ref.read(auth.authControllerProvider);
    final uid = user?.uidNumber ?? 999;
    workOrderNumber = generateWorkOrderNumber(uid);
  }

  /// New, shorter format: <UID>-<YY><DDD>-<HHMM>
  String generateWorkOrderNumber(int uid) {
    final now = DateTime.now();

    final yy   = now.year % 100; // 0..99
    final doy  = _dayOfYear(now); // 1..366
    final hhmm = '${_twoDigits(now.hour)}${_twoDigits(now.minute)}';

    return '$uid-${_twoDigits(yy)}${_threeDigits(doy)}-$hhmm';
  }

  int _dayOfYear(DateTime d) {
    final jan1 = DateTime(d.year, 1, 1);
    return d.difference(jan1).inDays + 1;
  }

  String _threeDigits(int n) => n.toString().padLeft(3, '0');

  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  void enableCustomerEditing(bool value) {
    customerFieldsEnabled = value;
    notifyListeners();
  }

  void toggleBillingVisibility(bool value) {
    showBilling = value;
    notifyListeners();
  }

  /// Start with a blank name (must be filled before save).
  /// Optional fields use `null`, matching table nullability.
  void addNewContact() {
    final now = DateTime.now();
    _contacts.add(Contact(
      id: DateTime.now().millisecondsSinceEpoch,
      customerId: selectedCustomerId ?? 0,
      name: '', // must be filled out before save
      phone: null,
      email: null,
      notes: null,
      isMain: _contacts.isEmpty,
      deactivate: false,
      auditFlag: true,
      synced: false,
      createdAt: now,
      updatedAt: now, // ✅ keep in sync on create
    ));
    contactValidationError = false;
    notifyListeners();
  }

  void makeMainContact(Contact contact) {
    _contacts = _contacts.map((c) {
      return c.id == contact.id
          ? c.copyWith(isMain: true, auditFlag: true)
          : (c.isMain ? c.copyWith(isMain: false, auditFlag: true) : c);
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

  void setIsCreatingNewCustomer(String name) {
    selectedCustomerId = null;
    customerFieldsEnabled = true;
    businessNameController.text = name;
    _contacts.clear();
    addNewContact();
    notifyListeners();
  }

  Future<void> selectCustomer(int? customerId, List<Customer> customers) async {
    selectedCustomerId = customerId;

    if (customerId == null) {
      _clearFields();
      customerFieldsEnabled = true;
    } else {
      final customer = customers.firstWhere((c) => c.id == customerId);

      businessNameController.text = customer.businessName;
      siteAddressController.text = customer.siteAddress ?? '';
      siteCityController.text = customer.siteCity ?? '';
      siteProvinceController.text =
          (customer.siteProvince?.isNotEmpty ?? false)
              ? customer.siteProvince!
              : 'Alberta';
      sitePostalController.text = customer.sitePostalCode ?? '';
      gpsLocationController.text = customer.gpsLocation ?? '';

      billingAddressController.text = customer.billingAddress ?? '';
      billingCityController.text = customer.billingCity ?? '';
      billingProvinceController.text =
          (customer.billingProvince?.isNotEmpty ?? false)
              ? customer.billingProvince!
              : 'Alberta';
      billingPostalController.text = customer.billingPostalCode ?? '';

      customerFieldsEnabled = false;

      final contactDao = ref.read(providers.contactDaoProvider);
      final customerContacts =
          await contactDao.getContactsForCustomer(customerId);
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

  Future<void> loadExistingWorkOrder(WorkOrder wo) async {
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

    customerNotesController.text = wo.customerNotes ?? '';
    showBilling = wo.billingAddress != null;

    final customerDao = ref.read(providers.customerDaoProvider);
    final customer = await customerDao.getCustomerById(wo.customerId);

    if (customer != null) {
      // Ensure customer-derived fields and contacts get populated
      await selectCustomer(customer.id, [customer]);
    } else {
      businessNameController.text = '[Missing Customer]';
    }

    notifyListeners();
  }

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    // Contact validation: name required AND at least one contact method.
    final hasValidContact = _contacts.any((c) {
      final hasName = c.name.trim().isNotEmpty;
      final hasPhoneOrEmail =
          (c.phone?.trim().isNotEmpty ?? false) || (c.email?.trim().isNotEmpty ?? false);
      return hasName && hasPhoneOrEmail;
    });

    if (!hasValidContact) {
      contactValidationError = true;
      notifyListeners();
      return false;
    }

    final db = ref.read(providers.databaseProvider);
    final contactDao = ref.read(providers.contactDaoProvider);

    int? customerId = selectedCustomerId;

    // Create customer if needed
    if (customerId == null) {
      final customerEntry = CustomersCompanion(
        businessName: drift.Value(businessNameController.text),
        siteAddress: drift.Value(siteAddressController.text),
        siteCity: drift.Value(siteCityController.text),
        siteProvince: drift.Value(siteProvinceController.text),
        sitePostalCode: drift.Value(cleanPostalCode(sitePostalController.text)),
        billingAddress: drift.Value(
            showBilling ? billingAddressController.text : siteAddressController.text),
        billingCity: drift.Value(
            showBilling ? billingCityController.text : siteCityController.text),
        billingProvince: drift.Value(
            showBilling ? billingProvinceController.text : siteProvinceController.text),
        billingPostalCode: drift.Value(showBilling
            ? cleanPostalCode(billingPostalController.text)
            : cleanPostalCode(sitePostalController.text)),
        gpsLocation: drift.Value(gpsLocationController.text),
        notes: drift.Value(customerNotesController.text),
        deactivate: const drift.Value(false),
        auditFlag: const drift.Value(true),
        synced: const drift.Value(false),
      );

      customerId = await db.customerDao.insertCustomer(customerEntry);
      selectedCustomerId = customerId;
    }

    // Upsert work order
    final workOrderEntry = WorkOrdersCompanion(
      customerId: drift.Value(customerId),
      workOrderNumber: drift.Value(workOrderNumber ?? ''),
      siteAddress: drift.Value(siteAddressController.text),
      siteCity: drift.Value(siteCityController.text),
      siteProvince: drift.Value(siteProvinceController.text),
      sitePostalCode: drift.Value(cleanPostalCode(sitePostalController.text)),
      gpsLocation: drift.Value(gpsLocationController.text),
      billingAddress: drift.Value(
          showBilling ? billingAddressController.text : siteAddressController.text),
      billingCity: drift.Value(
          showBilling ? billingCityController.text : siteCityController.text),
      billingProvince: drift.Value(
          showBilling ? billingProvinceController.text : siteProvinceController.text),
      billingPostalCode: drift.Value(showBilling
          ? cleanPostalCode(billingPostalController.text)
          : cleanPostalCode(sitePostalController.text)),
      customerNotes: drift.Value(customerNotesController.text),
    );

    if (editingWorkOrderId != null) {
      await db.workOrderDao.updateWorkOrder(editingWorkOrderId!, workOrderEntry);
    } else {
      editingWorkOrderId = await db.workOrderDao.insertWorkOrder(workOrderEntry);
    }

    // Replace contacts set: deactivate old, then insert current list
    await contactDao.deactivateContactsForCustomer(customerId);

    for (final c in _contacts) {
      final cleanName = c.name.trim();
      if (cleanName.isEmpty) {
        // Shouldn’t happen due to earlier validation, but double-guard.
        contactValidationError = true;
        notifyListeners();
        return false;
      }

      final contactEntry = ContactsCompanion(
        customerId: drift.Value(customerId),
        name: drift.Value(cleanName),                // non-nullable
        phone: drift.Value(_nullIfBlank(c.phone)),   // nullable column
        email: drift.Value(_nullIfBlank(c.email)),   // nullable column
        notes: drift.Value(_nullIfBlank(c.notes)),   // nullable column
        isMain: drift.Value(c.isMain),
        deactivate: drift.Value(c.deactivate),
        auditFlag: const drift.Value(true),
        synced: const drift.Value(false),
      );

      await contactDao.insertContact(contactEntry);
    }

    contactValidationError = false;
    return true;
  }

  String? _nullIfBlank(String? s) {
    final t = s?.trim();
    return (t == null || t.isEmpty) ? null : t;
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
