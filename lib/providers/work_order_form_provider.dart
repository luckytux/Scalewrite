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

  /// When true, the Billing section is shown and its fields are saved
  /// independently of the Site address. When false, Site values are used.
  bool showBilling = false;

  // --- Site ---
  final businessNameController = TextEditingController();
  final siteAddressController = TextEditingController();
  final siteCityController = TextEditingController();
  final siteProvinceController = TextEditingController();
  final sitePostalController = TextEditingController();
  final gpsLocationController = TextEditingController();

  // --- Billing (optional) ---
  final billingAddressController = TextEditingController();
  final billingCityController = TextEditingController();
  final billingProvinceController = TextEditingController();
  final billingPostalController = TextEditingController();

  // Notes
  final customerNotesController = TextEditingController();

  // Contacts for this Work Order's customer
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

  // -------------------- Lifecycle / Reset --------------------

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

  // -------------------- Province list --------------------

  List<String> get provinces => const [
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

  // -------------------- Work Order Number --------------------

  Future<void> generateWorkOrderNumberForCurrentUser() async {
    final user = ref.read(auth.authControllerProvider);
    final uid = user?.uidNumber ?? 999;
    workOrderNumber = generateWorkOrderNumber(uid);
  }

  /// Short format: <UID>-<YY><DDD>-<HHMM>
  String generateWorkOrderNumber(int uid) {
    final now = DateTime.now();
    final yy = now.year % 100;
    final doy = _dayOfYear(now);
    final hhmm = '${_twoDigits(now.hour)}${_twoDigits(now.minute)}';
    return '$uid-${_twoDigits(yy)}${_threeDigits(doy)}-$hhmm';
  }

  int _dayOfYear(DateTime d) {
    final jan1 = DateTime(d.year, 1, 1);
    return d.difference(jan1).inDays + 1;
  }

  String _threeDigits(int n) => n.toString().padLeft(3, '0');
  String _twoDigits(int n) => n.toString().padLeft(2, '0');

  // -------------------- UI Toggles --------------------

  void enableCustomerEditing(bool value) {
    customerFieldsEnabled = value;
    notifyListeners();
  }

  /// Show/Hide the Billing section. When enabling, if billing fields are
  /// empty we prefill them from the Site address to speed up entry.
  void toggleBillingVisibility(bool value) {
    showBilling = value;
    if (value) {
      // Prefill billing from site if billing is empty
      if (billingAddressController.text.trim().isEmpty &&
          billingCityController.text.trim().isEmpty &&
          billingProvinceController.text.trim().isEmpty &&
          billingPostalController.text.trim().isEmpty) {
        copySiteToBilling();
      }
    }
    notifyListeners();
  }

  /// Explicit helpers for UI buttons (optional)
  void copySiteToBilling() {
    billingAddressController.text = siteAddressController.text;
    billingCityController.text = siteCityController.text;
    billingProvinceController.text =
        siteProvinceController.text.isNotEmpty ? siteProvinceController.text : 'Alberta';
    billingPostalController.text = sitePostalController.text;
    notifyListeners();
  }

  void copyBillingToSite() {
    siteAddressController.text = billingAddressController.text;
    siteCityController.text = billingCityController.text;
    siteProvinceController.text =
        billingProvinceController.text.isNotEmpty ? billingProvinceController.text : 'Alberta';
    sitePostalController.text = billingPostalController.text;
    notifyListeners();
  }

  // -------------------- Contacts --------------------

  /// Add a new (unsaved) contact row to the form.
  void addNewContact() {
    final now = DateTime.now();
    _contacts.add(Contact(
      id: DateTime.now().millisecondsSinceEpoch, // temp id for UI
      customerId: selectedCustomerId ?? 0,
      name: '',
      phone: null,
      email: null,
      notes: null,
      isMain: _contacts.isEmpty,
      deactivate: false,
      auditFlag: true,
      synced: false,
      createdAt: now,
      updatedAt: now,
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

  // -------------------- Customer selection --------------------

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

      // Site
      siteAddressController.text = customer.siteAddress ?? '';
      siteCityController.text = customer.siteCity ?? '';
      siteProvinceController.text =
          (customer.siteProvince?.isNotEmpty ?? false)
              ? customer.siteProvince!
              : 'Alberta';
      sitePostalController.text = customer.sitePostalCode ?? '';
      gpsLocationController.text = customer.gpsLocation ?? '';

      // Billing – if customer has a billing address, use it; otherwise default to site
      final hasBilling = (customer.billingAddress?.trim().isNotEmpty ?? false);
      if (hasBilling) {
        billingAddressController.text = customer.billingAddress ?? '';
        billingCityController.text = customer.billingCity ?? '';
        billingProvinceController.text =
            (customer.billingProvince?.isNotEmpty ?? false)
                ? customer.billingProvince!
                : 'Alberta';
        billingPostalController.text = customer.billingPostalCode ?? '';
        showBilling = true;
      } else {
        billingAddressController.clear();
        billingCityController.clear();
        billingProvinceController.text = 'Alberta';
        billingPostalController.clear();
        showBilling = false;
      }

      customerFieldsEnabled = false;

      // Load only active contacts; DAO sorts with main first
      final contactDao = ref.read(providers.contactDaoProvider);
      final customerContacts =
          await contactDao.getContactsForCustomer(customerId, onlyActive: true);
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

  // -------------------- Load existing WO --------------------

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
      await selectCustomer(customer.id, [customer]);
    } else {
      businessNameController.text = '[Missing Customer]';
    }

    notifyListeners();
  }

  // -------------------- Persist --------------------

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    // Require at least one valid contact: name + (phone or email)
    final hasValidContact = _contacts.any((c) {
      final hasName = c.name.trim().isNotEmpty;
      final hasPhoneOrEmail =
          (c.phone?.trim().isNotEmpty ?? false) ||
          (c.email?.trim().isNotEmpty ?? false);
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

    // If we don't have a customer yet, create one now from the form
    if (customerId == null) {
      final customerEntry = CustomersCompanion(
        businessName: drift.Value(businessNameController.text),
        siteAddress: drift.Value(siteAddressController.text),
        siteCity: drift.Value(siteCityController.text),
        siteProvince: drift.Value(siteProvinceController.text),
        sitePostalCode: drift.Value(cleanPostalCode(sitePostalController.text)),
        billingAddress: drift.Value(showBilling
            ? billingAddressController.text
            : siteAddressController.text),
        billingCity: drift.Value(showBilling
            ? billingCityController.text
            : siteCityController.text),
        billingProvince: drift.Value(showBilling
            ? billingProvinceController.text
            : siteProvinceController.text),
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

    // Upsert Work Order (DAO will stamp lastModified)
    final workOrderEntry = WorkOrdersCompanion(
      customerId: drift.Value(customerId),
      workOrderNumber: drift.Value(workOrderNumber ?? ''),
      siteAddress: drift.Value(siteAddressController.text),
      siteCity: drift.Value(siteCityController.text),
      siteProvince: drift.Value(siteProvinceController.text),
      sitePostalCode: drift.Value(cleanPostalCode(sitePostalController.text)),
      gpsLocation: drift.Value(gpsLocationController.text),

      // Billing saved only if showBilling=true, otherwise mirror site values
      billingAddress: drift.Value(showBilling
          ? billingAddressController.text
          : siteAddressController.text),
      billingCity: drift.Value(showBilling
          ? billingCityController.text
          : siteCityController.text),
      billingProvince: drift.Value(showBilling
          ? billingProvinceController.text
          : siteProvinceController.text),
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

    // Upsert contacts (no bulk duplication)
    final existing = await contactDao.getAllForCustomer(customerId);
    final existingIds = existing.map((c) => c.id).toSet();
    final keptIds = <int>[];

    for (final c in _contacts) {
      final cleanName = c.name.trim();
      if (cleanName.isEmpty) {
        contactValidationError = true;
        notifyListeners();
        return false;
      }

      final entry = ContactsCompanion(
        customerId: drift.Value(customerId),
        name: drift.Value(cleanName),
        phone: drift.Value(_nullIfBlank(c.phone)),
        email: drift.Value(_nullIfBlank(c.email)),
        notes: drift.Value(_nullIfBlank(c.notes)),
        isMain: drift.Value(c.isMain),
        deactivate: const drift.Value(false),
        auditFlag: const drift.Value(true),
        synced: const drift.Value(false),
      );

      if (existingIds.contains(c.id)) {
        await contactDao.updateContactById(c.id, entry);
        keptIds.add(c.id);
      } else {
        final newId = await contactDao.insertContact(entry);
        keptIds.add(newId);
      }
    }

    // Deactivate any contacts removed from the form
    await contactDao.deactivateContactsExcept(customerId, keptIds);

    contactValidationError = false;
    return true;
  }

  // -------------------- Utils --------------------

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
