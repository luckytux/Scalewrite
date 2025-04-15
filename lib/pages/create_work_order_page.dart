// File: lib/pages/create_work_order_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/data/database.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/widgets/rounded_text_field.dart';
import 'package:scalewrite_v2/providers/customer_list_provider.dart';

class CreateWorkOrderPage extends ConsumerWidget {
  const CreateWorkOrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(workOrderFormProvider);
    final customersAsync = ref.watch(customerListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Work Order')),
      body: customersAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error loading customers: $e')),
        data: (customers) {
          final dropdownItems = customers.map((c) {
            return DropdownMenuItem<int>(
              value: c.id,
              child: Text(c.businessName),
            );
          }).toList();

          dropdownItems.insert(
            0,
            const DropdownMenuItem<int>(
              value: null,
              child: Text('Create New Customer'),
            ),
          );

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  DropdownButtonFormField<int>(
                    decoration: const InputDecoration(labelText: 'Customer'),
                    value: controller.selectedCustomerId,
                    items: dropdownItems,
                    onChanged: (value) {
                      controller.selectCustomer(value);
                    },
                    validator: (val) =>
                        val == null ? 'Please select a customer' : null,
                  ),

                  const SizedBox(height: 16),

                  if (controller.workOrderNumber != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade50,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.teal),
                      ),
                      child: Text(
                        'WO #: ${controller.workOrderNumber}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),

                  RoundedTextField(
                    controller: controller.siteAddress,
                    label: 'Site Address',
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: RoundedTextField(
                          controller: controller.siteCity,
                          label: 'City',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RoundedTextField(
                          controller: controller.siteProvince,
                          label: 'Province',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RoundedTextField(
                          controller: controller.sitePostalCode,
                          label: 'Postal Code',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),
                  SwitchListTile(
                    title: const Text('Add Billing Address'),
                    value: controller.showBillingFields,
                    onChanged: (_) => controller.toggleBillingFields(),
                  ),

                  if (controller.showBillingFields) ...[
                    RoundedTextField(
                      controller: controller.billingAddress,
                      label: 'Billing Address',
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RoundedTextField(
                            controller: controller.billingCity,
                            label: 'City',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: RoundedTextField(
                            controller: controller.billingProvince,
                            label: 'Province',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: RoundedTextField(
                            controller: controller.billingPostalCode,
                            label: 'Postal Code',
                          ),
                        ),
                      ],
                    ),
                  ],

                  RoundedTextField(
                    controller: controller.gpsLocation,
                    label: 'GPS Location',
                  ),

                  RoundedTextField(
                    controller: controller.customerNotes,
                    label: 'Customer Notes',
                    maxLines: 3,
                  ),

                  const SizedBox(height: 24),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Text('Contacts', style: TextStyle(fontSize: 18)),

                  if (controller.mainContact != null)
                    ListTile(
                      title: Text(controller.mainContact!.name),
                      subtitle: Text(
                        '${controller.mainContact!.phone ?? ''} · ${controller.mainContact!.email ?? ''}',
                      ),
                      trailing: const Chip(label: Text('Main')),
                    ),

                  for (final contact in controller.activeContacts)
                    ListTile(
                      title: Text(contact.name),
                      subtitle: Text('${contact.phone ?? ''} · ${contact.email ?? ''}'),
                    ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton.icon(
                      onPressed: controller.addNewContact,
                      icon: const Icon(Icons.add),
                      label: const Text('Add New Contact'),
                    ),
                  ),

                  const SizedBox(height: 32),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final success = await controller.save();
                      if (context.mounted && success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Work Order Saved')),
                        );
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save Work Order'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
