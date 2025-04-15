// File: lib/pages/customer_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/customer_form_controller.dart';
import '../providers/customer_form_provider.dart';

class CustomerPage extends ConsumerWidget {
  const CustomerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(customerFormProvider.notifier);
    final formKey = controller.formKey;

    return Scaffold(
      appBar: AppBar(title: const Text('Create Customer')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.businessName,
                decoration: const InputDecoration(labelText: 'Business Name'),
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: controller.address,
                decoration: const InputDecoration(labelText: 'Mailing Address'),
              ),
              TextFormField(
                controller: controller.city,
                decoration: const InputDecoration(labelText: 'City'),
              ),
              TextFormField(
                controller: controller.province,
                decoration: const InputDecoration(labelText: 'Province'),
              ),
              TextFormField(
                controller: controller.postalCode,
                decoration: const InputDecoration(labelText: 'Postal Code'),
              ),
              TextFormField(
                controller: controller.gpsLocation,
                decoration: const InputDecoration(labelText: 'GPS Location'),
              ),
              TextFormField(
                controller: controller.notes,
                decoration: const InputDecoration(labelText: 'Customer Notes'),
                maxLines: 3,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final saved = await controller.save();
                  if (context.mounted && saved) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Customer saved')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save Customer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
