// File: lib/pages/create_work_order_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import 'package:scalewrite/providers/customer_list_provider.dart';
import 'package:scalewrite/providers/work_order_form_provider.dart';
import 'package:scalewrite/widgets/work_order/customer_dropdown_section.dart';
import 'package:scalewrite/widgets/work_order/site_address_section.dart';
import 'package:scalewrite/widgets/work_order/billing_address_section.dart';
import 'package:scalewrite/widgets/work_order/contact_list_section.dart';
import 'package:scalewrite/widgets/work_order/work_order_action_buttons.dart';

class CreateWorkOrderPage extends ConsumerStatefulWidget {
  final WorkOrder? existingWorkOrder;

  const CreateWorkOrderPage({super.key, this.existingWorkOrder});

  @override
  ConsumerState<CreateWorkOrderPage> createState() =>
      _CreateWorkOrderPageState();
}

class _CreateWorkOrderPageState extends ConsumerState<CreateWorkOrderPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final controller = ref.read(workOrderFormProvider);
      debugPrint('🔄 Resetting form in CreateWorkOrderPage...');
      controller.resetForm(); // always clear first
      if (widget.existingWorkOrder != null) {
        final wo = widget.existingWorkOrder!;
        debugPrint('📋 Loading existing Work Order ID: ${wo.id}');
        debugPrint('📋 Full Work Order Object: $wo');
        debugPrint('📋 → ID: ${wo.id}');
        debugPrint('📋 → Customer ID: ${wo.customerId}');
        debugPrint('📋 → Number: ${wo.workOrderNumber}');
        debugPrint('📋 → Site Address: ${wo.siteAddress}');
        debugPrint('📋 → Site City: ${wo.siteCity}');
        debugPrint('📋 → Site Province: ${wo.siteProvince}');
        debugPrint('📋 → Site Postal: ${wo.sitePostalCode}');
        debugPrint('📋 → GPS: ${wo.gpsLocation}');
        debugPrint('📋 → Billing Address: ${wo.billingAddress}');
        debugPrint('📋 → Billing City: ${wo.billingCity}');
        debugPrint('📋 → Billing Province: ${wo.billingProvince}');
        debugPrint('📋 → Billing Postal: ${wo.billingPostalCode}');
        debugPrint('📋 → Notes: ${wo.customerNotes}');
        controller.loadExistingWorkOrder(wo);
        debugPrint('📋 Controller fields after load:');
        debugPrint('📋 businessName: ${controller.businessNameController.text}');
        debugPrint('📋 siteAddress: ${controller.siteAddressController.text}');
        debugPrint('📋 siteCity: ${controller.siteCityController.text}');
        debugPrint('📋 siteProvince: ${controller.siteProvinceController.text}');
        debugPrint('📋 sitePostal: ${controller.sitePostalController.text}');
        debugPrint('📋 gpsLocation: ${controller.gpsLocationController.text}');
        debugPrint('📋 billingAddress: ${controller.billingAddressController.text}');
        debugPrint('📋 billingCity: ${controller.billingCityController.text}');
        debugPrint('📋 billingProvince: ${controller.billingProvinceController.text}');
        debugPrint('📋 billingPostal: ${controller.billingPostalController.text}');
        debugPrint('📋 customerNotes: ${controller.customerNotesController.text}');
      }
    });
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
        data: (customers) {
          if (controller.selectedCustomerId != null &&
              !customers.any((c) => c.id == controller.selectedCustomerId)) {
            controller.selectedCustomerId = null;
          }

          return Padding(
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
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),

                  CustomerDropdownSection(customers: customers),
                  const SizedBox(height: 16),

                  if (controller.selectedCustomerId != null)
                    Container(
                      color: Colors.grey.shade200,
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: const Text(
                        'This work order is linked to an existing customer.\nTo make changes, enable "Edit Customer Fields".',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),

                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Edit Customer Fields'),
                    value: controller.customerFieldsEnabled,
                    onChanged: controller.selectedCustomerId != null
                        ? (val) => controller.enableCustomerEditing(val)
                        : null,
                  ),

                  SiteAddressSection(
                    enabled: controller.selectedCustomerId == null ||
                        controller.customerFieldsEnabled,
                  ),
                  const SizedBox(height: 24),

                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Use Separate Billing Address'),
                    value: controller.showBilling,
                    onChanged: controller.selectedCustomerId == null ||
                            controller.customerFieldsEnabled
                        ? (val) =>
                            controller.toggleBillingVisibility(val)
                        : null,
                  ),

                  BillingAddressSection(
                    enabled: controller.selectedCustomerId == null ||
                        controller.customerFieldsEnabled,
                  ),
                  const SizedBox(height: 24),

                  const ContactListSection(),
                  const SizedBox(height: 24),

                  const WorkOrderActionButtons(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
