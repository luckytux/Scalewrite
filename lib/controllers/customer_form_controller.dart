// File: lib/controllers/customer_form_controller.dart
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../data/database.dart';
import '../data/tables/customers.dart'; // <--- Ensure this is here!
import '../data/daos/customer_dao.dart';


class CustomerFormController extends ChangeNotifier {
  final CustomerDao dao;
  final formKey = GlobalKey<FormState>();

  final businessName = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final province = TextEditingController();
  final postalCode = TextEditingController();
  final gpsLocation = TextEditingController();
  final notes = TextEditingController(); // ✅ added

  CustomerFormController(this.dao);

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) return false;

    final entry = CustomersCompanion(
      businessName: drift.Value(businessName.text),
      address: drift.Value(address.text),
      city: drift.Value(city.text),
      province: drift.Value(province.text),
      postalCode: drift.Value(postalCode.text),
      gpsLocation: drift.Value(gpsLocation.text),
      notes: drift.Value(notes.text), // ✅ added
    );

    await dao.insertCustomer(entry);
    return true;
  }

  @override
  void dispose() {
    businessName.dispose();
    address.dispose();
    city.dispose();
    province.dispose();
    postalCode.dispose();
    gpsLocation.dispose();
    notes.dispose(); 
    super.dispose();
  }
}
