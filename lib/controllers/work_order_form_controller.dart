// File: lib/controllers/work_order_form_controller.dart

import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:intl/intl.dart';
import '../data/database.dart';
import '../data/daos/work_order_dao.dart';
import '../data/daos/customer_dao.dart';
import '../data/daos/contact_dao.dart';

class WorkOrderFormController extends ChangeNotifier {
  final WorkOrderDao dao;
  final ContactDao contactDao;
  final CustomerDao customerDao;
  final formKey = GlobalKey<FormState>();

  String? workOrderNumber;
  int? selectedCustomerId;

  final gpsLocation = TextEditingController();
  final customerNotes = TextEditingController();

  final siteAddress = TextEditingController();
  final siteCity = TextEditingController();
  final siteProvince = TextEditingController();
  final sitePostal = TextEditingController();

  final billingAddress = TextEditingController();
  final billingCity = TextEditingController();
  final billingProvince = TextEditingController();
  final billingPostal = TextEditingController();

  bool customerFieldsEnabled = false;
  bool showBilling = false;

  List<Contact> _contacts = [];
  List<Contact> get contacts => List.unmodifiable(_contacts);

  Contact? get mainContact {
    try {
      return _contacts.firstWhere((c) => c.isMain);
    } catch (_) {
      return _contacts.isNotEmpty ? _contacts.first : null;
    }
  }

  WorkOrderFormController(this.dao, this.customerDao, this.contactDao);

  void enableCustomerEditing() {
    customerFieldsEnabled = true;
    notifyListeners();
  }

  void toggleBillingVisibility(bool value) {
    showBilling = value;
    notifyListeners();
  }

  Future<void> selectCustomer(int? id) async {
    selectedCustomerId = id;
    workOrderNumber = _generateWorkOrderNumber();

    if (id != null) {
      final customer = await customerDao.getCustomerById(id);
      if (customer != null) {
        populateCustomerFields(customer);
      }
      _contacts = await contactDao.getContactsForCustomer(id);
    } else {
      _contacts = [];
    }

    notifyListeners();
  }

  void populateCustomerFields(Customer customer) {
    gpsLocation.text = customer.gpsLocation ?? '';
    customerNotes.text = customer.notes ?? '';

    siteAddress.text = customer.siteAddress ?? '';
    siteCity.text = customer.siteCity ?? '';
    siteProvince.text = customer.siteProvince ?? '';
    sitePostal.text = formatPostalCode(customer.sitePostalCode ?? '');

    billingAddress.text = customer.billingAddress ?? '';
    billingCity.text = customer.billingCity ?? '';
    billingProvince.text = customer.billingProvince ?? '';
    billingPostal.text = formatPostalCode(customer.billingPostalCode ?? '');

    customerFieldsEnabled = false;
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

  String _generateWorkOrderNumber() {
    final now = DateTime.now();
    const uid = '101'; // Replace with dynamic user ID logic if needed
    final formatter = DateFormat('yyyyMMdd-HHmm');
    return 'WO-$uid-${formatter.format(now)}';
  }

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) return false;

    if (selectedCustomerId != null) {
      final update = CustomersCompanion(
        id: drift.Value(selectedCustomerId!),
        gpsLocation: drift.Value(gpsLocation.text),
        notes: drift.Value(customerNotes.text),
        auditFlag: const drift.Value(true),
        siteAddress: drift.Value(siteAddress.text),
        siteCity: drift.Value(siteCity.text),
        siteProvince: drift.Value(siteProvince.text),
        sitePostalCode: drift.Value(cleanPostalCode(sitePostal.text)),
        billingAddress: showBilling ? drift.Value(billingAddress.text) : const drift.Value.absent(),
        billingCity: showBilling ? drift.Value(billingCity.text) : const drift.Value.absent(),
        billingProvince: showBilling ? drift.Value(billingProvince.text) : const drift.Value.absent(),
        billingPostalCode: showBilling ? drift.Value(cleanPostalCode(billingPostal.text)) : const drift.Value.absent(),
      );
      await customerDao.updateCustomer(update);

      for (final contact in _contacts) {
        final companion = ContactsCompanion(
          id: contact.id > 0 ? drift.Value(contact.id) : const drift.Value.absent(),
          customerId: drift.Value(contact.customerId),
          name: drift.Value(contact.name),
          phone: drift.Value(contact.phone),
          email: drift.Value(contact.email),
          notes: drift.Value(contact.notes),
          isMain: drift.Value(contact.isMain),
          deactivate: drift.Value(contact.deactivate),
          auditFlag: drift.Value(contact.auditFlag),
          synced: drift.Value(contact.synced),
        );

        await contactDao.insertOrUpdateContact(companion);
      }
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
    gpsLocation.dispose();
    customerNotes.dispose();
    siteAddress.dispose();
    siteCity.dispose();
    siteProvince.dispose();
    sitePostal.dispose();
    billingAddress.dispose();
    billingCity.dispose();
    billingProvince.dispose();
    billingPostal.dispose();
    super.dispose();
  }
}
