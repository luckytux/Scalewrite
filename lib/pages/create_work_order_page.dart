// File: lib/pages/create_work_order_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import 'package:scalewrite_v2/providers/customer_list_provider.dart';
import 'package:scalewrite_v2/providers/work_order_form_provider.dart';
import 'package:scalewrite_v2/widgets/work_order/customer_dropdown_section.dart';
import 'package:scalewrite_v2/widgets/work_order/site_address_section.dart';
import 'package:scalewrite_v2/widgets/work_order/billing_address_section.dart';
import 'package:scalewrite_v2/widgets/work_order/contact_list_section.dart';
import 'package:scalewrite_v2/widgets/work_order/work_order_action_buttons.dart';
import 'package:scalewrite_v2/widgets/common/rounded_text_field.dart';

class CreateWorkOrderPage extends ConsumerStatefulWidget {
  final WorkOrder? existingWorkOrder;

  const CreateWorkOrderPage({super.key, this.existingWorkOrder});

  @override
  ConsumerState<CreateWorkOrderPage> createState() => _CreateWorkOrderPageState();
}

class _CreateWorkOrderPageState extends ConsumerState<CreateWorkOrderPage> {
  @override
  void initState() {
    super.initState();
    // Reset controller to clear old state if creating a new WO
    final controller = ref.read(workOrderFormProvider);
    if (widget.existingWorkOrder == null) {
      controller.resetForm();
    } else {
      controller.loadExistingWorkOrder(widget.existingWorkOrder!);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                if (controller.workOrderNumber != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      'Work Order #: ${controller.workOrderNumber!}',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                CustomerDropdownSection(customers: customers),
                const SizedBox(height: 16),
                RoundedTextField(
                  controller: controller.businessNameController,
                  label: 'Business Name (Required)',
                  readOnly: controller.selectedCustomerId != null && !controller.customerFieldsEnabled,
                  validator: (val) {
                    if (val == null || val.trim().isEmpty) {
                      return 'Business Name is required';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                SwitchListTile(
                  title: const Text('Edit Customer Fields'),
                  value: controller.customerFieldsEnabled,
                  onChanged: controller.selectedCustomerId != null
                      ? (val) => controller.enableCustomerEditing(val)
                      : null,
                ),
                SiteAddressSection(enabled: controller.selectedCustomerId == null || controller.customerFieldsEnabled),
                const SizedBox(height: 24),
                SwitchListTile(
                  title: const Text('Use Separate Billing Address'),
                  value: controller.showBilling,
                  onChanged: controller.selectedCustomerId == null || controller.customerFieldsEnabled
                      ? (val) => controller.toggleBillingVisibility(val)
                      : null,
                ),
                BillingAddressSection(enabled: controller.selectedCustomerId == null || controller.customerFieldsEnabled),
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
