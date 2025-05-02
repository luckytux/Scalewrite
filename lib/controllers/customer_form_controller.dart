// File: lib/controllers/customer_form_controller.dart
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../data/database.dart';
import '../data/daos/customer_dao.dart';

class CustomerFormController extends ChangeNotifier {
  final CustomerDao dao;
  final formKey = GlobalKey<FormState>();

  final businessName = TextEditingController();

  // Billing address fields
  final billingAddress = TextEditingController();
  final billingCity = TextEditingController();
  final billingProvince = TextEditingController();
  final billingPostalCode = TextEditingController();

  // Site address fields
  final siteAddress = TextEditingController();
  final siteCity = TextEditingController();
  final siteProvince = TextEditingController();
  final sitePostalCode = TextEditingController();

  final gpsLocation = TextEditingController();
  final notes = TextEditingController();

  CustomerFormController(this.dao);

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) return false;

    final entry = CustomersCompanion(
      businessName: drift.Value(businessName.text),
      billingAddress: drift.Value(billingAddress.text),
      billingCity: drift.Value(billingCity.text),
      billingProvince: drift.Value(billingProvince.text),
      billingPostalCode: drift.Value(cleanPostalCode(billingPostalCode.text)),
      siteAddress: drift.Value(siteAddress.text),
      siteCity: drift.Value(siteCity.text),
      siteProvince: drift.Value(siteProvince.text),
      sitePostalCode: drift.Value(cleanPostalCode(sitePostalCode.text)),
      gpsLocation: drift.Value(gpsLocation.text),
      notes: drift.Value(notes.text),
      deactivate: const drift.Value(false),
      auditFlag: const drift.Value(true),
      synced: const drift.Value(false),
    );

    await dao.insertCustomer(entry);
    return true;
  }

  String cleanPostalCode(String input) {
    return input.replaceAll(RegExp(r'\s+'), '').toUpperCase();
  }

  @override
  void dispose() {
    businessName.dispose();

    billingAddress.dispose();
    billingCity.dispose();
    billingProvince.dispose();
    billingPostalCode.dispose();

    siteAddress.dispose();
    siteCity.dispose();
    siteProvince.dispose();
    sitePostalCode.dispose();

    gpsLocation.dispose();
    notes.dispose();
    super.dispose();
  }
}
