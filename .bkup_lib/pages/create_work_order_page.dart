// File: lib/pages/create_work_order_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/work_order_form_controller.dart';

class CreateWorkOrderPage extends ConsumerWidget {
  const CreateWorkOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(workOrderFormProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Work Order')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: controller.businessName,
                decoration: const InputDecoration(labelText: 'Business Name'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              TextFormField(
                controller: controller.billingAddress,
                decoration: const InputDecoration(labelText: 'Billing Address'),
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
                controller: controller.postal,
                decoration: const InputDecoration(labelText: 'Postal Code'),
              ),
              TextFormField(
                controller: controller.gpsLocation,
                decoration: const InputDecoration(labelText: 'GPS Location'),
              ),
              TextFormField(
                controller: controller.customerNotes,
                decoration: const InputDecoration(labelText: 'Customer Notes'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await controller.save();
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Work Order saved')),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save Work Order'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
