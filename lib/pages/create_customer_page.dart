// File: lib/pages/create_customer_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite/providers/work_order_form_provider.dart';
import 'package:scalewrite/widgets/work_order/site_address_section.dart';
import 'package:scalewrite/widgets/work_order/billing_address_section.dart';
import 'package:scalewrite/widgets/work_order/contact_list_section.dart';
import 'package:scalewrite/widgets/common/rounded_text_field.dart';

class CreateCustomerPage extends ConsumerStatefulWidget {
  const CreateCustomerPage({super.key});

  @override
  ConsumerState<CreateCustomerPage> createState() => _CreateCustomerPageState();
}

class _CreateCustomerPageState extends ConsumerState<CreateCustomerPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final controller = ref.read(workOrderFormProvider);
      controller.resetForm();
      controller.addNewContact();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(workOrderFormProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Customer')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              RoundedTextField(
                controller: controller.businessNameController,
                label: 'Business Name (Required)',
                readOnly: false,
                validator: (val) {
                  if (val == null || val.trim().isEmpty) {
                    return 'Business Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              SiteAddressSection(enabled: true),
              const SizedBox(height: 24),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Use Separate Billing Address'),
                value: controller.showBilling,
                onChanged: (val) => controller.toggleBillingVisibility(val),
              ),
              BillingAddressSection(enabled: true),
              const SizedBox(height: 24),
              const ContactListSection(),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () async {
                  final success = await controller.save();
                  if (context.mounted && success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Customer Saved')),
                    );
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.save),
                label: const Text('Save Customer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
