// File: lib/pages/create_customer_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart' as drift;
import '../data/tables/customers.dart';
import '../data/tables/contacts.dart';
import '../providers/drift_providers.dart';

class CreateCustomerPage extends ConsumerStatefulWidget {
  const CreateCustomerPage({super.key});

  @override
  ConsumerState<CreateCustomerPage> createState() => _CreateCustomerPageState();
}

class _CreateCustomerPageState extends ConsumerState<CreateCustomerPage> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final postalController = TextEditingController();

  final contactName = TextEditingController();
  final contactPhone = TextEditingController();
  final contactEmail = TextEditingController();
  final contactNotes = TextEditingController();

  final List<Map<String, TextEditingController>> additionalContacts = [];

  void _addContact() {
    additionalContacts.add({
      'name': TextEditingController(),
      'phone': TextEditingController(),
      'email': TextEditingController(),
      'notes': TextEditingController(),
    });
    setState(() {});
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final customerDao = ref.read(customerDaoProvider);
    final contactDao = ref.read(contactDaoProvider);

    final customerId = await customerDao.insertCustomer(CustomersCompanion(
      name: drift.Value(nameController.text),
      address: drift.Value(addressController.text),
      city: drift.Value(cityController.text),
      province: drift.Value(provinceController.text),
      postal: drift.Value(postalController.text),
    ));

    // Save main contact
    await contactDao.insertContact(ContactsCompanion(
      customerId: drift.Value(customerId),
      name: drift.Value(contactName.text),
      phone: drift.Value(contactPhone.text),
      email: drift.Value(contactEmail.text),
      notes: drift.Value(contactNotes.text),
      isMain: const drift.Value(true),
    ));

    // Save additional contacts
    for (final c in additionalContacts) {
      if (c['name']!.text.trim().isEmpty) continue;

      await contactDao.insertContact(ContactsCompanion(
        customerId: drift.Value(customerId),
        name: drift.Value(c['name']!.text),
        phone: drift.Value(c['phone']!.text),
        email: drift.Value(c['email']!.text),
        notes: drift.Value(c['notes']!.text),
        isMain: const drift.Value(false),
      ));
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Customer Created')));
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    cityController.dispose();
    provinceController.dispose();
    postalController.dispose();
    contactName.dispose();
    contactPhone.dispose();
    contactEmail.dispose();
    contactNotes.dispose();
    for (final c in additionalContacts) {
      c.values.forEach((ctrl) => ctrl.dispose());
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Customer')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(controller: nameController, decoration: const InputDecoration(labelText: 'Business Name')),
              TextFormField(controller: addressController, decoration: const InputDecoration(labelText: 'Address')),
              TextFormField(controller: cityController, decoration: const InputDecoration(labelText: 'City')),
              TextFormField(controller: provinceController, decoration: const InputDecoration(labelText: 'Province')),
              TextFormField(controller: postalController, decoration: const InputDecoration(labelText: 'Postal Code')),

              const Divider(height: 32),
              const Text('Main Contact', style: TextStyle(fontWeight: FontWeight.bold)),
              TextFormField(controller: contactName, decoration: const InputDecoration(labelText: 'Name')),
              TextFormField(controller: contactPhone, decoration: const InputDecoration(labelText: 'Phone')),
              TextFormField(controller: contactEmail, decoration: const InputDecoration(labelText: 'Email')),
              TextFormField(controller: contactNotes, decoration: const InputDecoration(labelText: 'Notes')),

              const Divider(height: 32),
              const Text('Additional Contacts', style: TextStyle(fontWeight: FontWeight.bold)),
              ...additionalContacts.map((c) => Column(children: [
                TextFormField(controller: c['name'], decoration: const InputDecoration(labelText: 'Name')),
                TextFormField(controller: c['phone'], decoration: const InputDecoration(labelText: 'Phone')),
                TextFormField(controller: c['email'], decoration: const InputDecoration(labelText: 'Email')),
                TextFormField(controller: c['notes'], decoration: const InputDecoration(labelText: 'Notes')),
                const Divider(),
              ])),

              TextButton.icon(
                onPressed: _addContact,
                icon: const Icon(Icons.add),
                label: const Text('Add Contact'),
              ),

              const SizedBox(height: 24),
              ElevatedButton(onPressed: _save, child: const Text('Save Customer')),
            ],
          ),
        ),
      ),
    );
  }
}
