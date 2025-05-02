// File: lib/pages/customer_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/customer_form_provider.dart';
import '../widgets/common/rounded_text_field.dart';

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
              RoundedTextField(
                controller: controller.businessName,
                label: 'Business Name',
                validator: (val) =>
                    val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              const Text('Billing Address', style: TextStyle(fontWeight: FontWeight.bold)),
              RoundedTextField(
                controller: controller.billingAddress,
                label: 'Billing Address',
              ),
              RoundedTextField(
                controller: controller.billingCity,
                label: 'City',
              ),
              RoundedTextField(
                controller: controller.billingProvince,
                label: 'Province',
              ),
              RoundedTextField(
                controller: controller.billingPostalCode,
                label: 'Postal Code',
                validator: (val) {
                  final cleaned = val?.replaceAll(' ', '');
                  final regex = RegExp(r'^[A-Za-z]\d[A-Za-z]\d[A-Za-z]\d$');
                  return cleaned == null || !regex.hasMatch(cleaned)
                      ? 'Format: A1A 1A1'
                      : null;
                },
              ),
              const SizedBox(height: 16),
              const Text('Site Address', style: TextStyle(fontWeight: FontWeight.bold)),
              RoundedTextField(
                controller: controller.siteAddress,
                label: 'Site Address',
              ),
              RoundedTextField(
                controller: controller.siteCity,
                label: 'City',
              ),
              RoundedTextField(
                controller: controller.siteProvince,
                label: 'Province',
              ),
              RoundedTextField(
                controller: controller.sitePostalCode,
                label: 'Postal Code',
                validator: (val) {
                  final cleaned = val?.replaceAll(' ', '');
                  final regex = RegExp(r'^[A-Za-z]\d[A-Za-z]\d[A-Za-z]\d$');
                  return cleaned == null || !regex.hasMatch(cleaned)
                      ? 'Format: A1A 1A1'
                      : null;
                },
              ),
              RoundedTextField(
                controller: controller.gpsLocation,
                label: 'GPS Location',
              ),
              RoundedTextField(
                controller: controller.notes,
                label: 'Customer Notes',
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
