// File: lib/pages/create_work_order_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/providers/customer_list_provider.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/widgets/work_order/customer_dropdown_section.dart';
import 'package:scalewrite_v2/widgets/work_order/site_address_section.dart';
import 'package:scalewrite_v2/widgets/work_order/billing_address_section.dart';
import 'package:scalewrite_v2/widgets/work_order/contact_list_section.dart';
import 'package:scalewrite_v2/widgets/work_order/work_order_action_buttons.dart';

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
        data: (customers) => Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                CustomerDropdownSection(customers: customers),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Edit Customer Fields'),
                  value: controller.customerFieldsEnabled,
                  onChanged: (_) => controller.enableCustomerEditing(),
                ),
                const SiteAddressSection(),
                const SizedBox(height: 24),
                SwitchListTile(
                  title: const Text('Use Separate Billing Address'),
                  value: controller.showBilling,
                  onChanged: controller.customerFieldsEnabled ? controller.toggleBillingVisibility : null,
                ),
                const BillingAddressSection(),
                const SizedBox(height: 24),
                const ContactListSection(),
                const SizedBox(height: 24),
                const WorkOrderActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
