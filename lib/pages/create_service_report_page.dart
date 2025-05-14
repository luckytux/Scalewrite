// File: lib/pages/create_service_report_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/service_report_form_provider.dart';
import '../providers/drift_providers.dart';
import '../widgets/service_report/work_order_dropdown.dart';
import '../widgets/service_report/scale_dropdown.dart';
import '../widgets/service_report/configuration_toggle.dart';
import '../widgets/service_report/indicator_section.dart';
import '../widgets/service_report/base_section.dart';
import '../widgets/service_report/load_cell_section.dart';
import '../widgets/service_report/scale_capacity_section.dart';
import '../widgets/service_report/scale_type_selector.dart';
import '../widgets/service_report/legal_status_section.dart';
import 'create_weight_test_page.dart';

class CreateServiceReportPage extends ConsumerStatefulWidget {
  final int? customerId;
  final int? workOrderId;

  const CreateServiceReportPage({super.key, this.customerId, this.workOrderId});

  @override
  ConsumerState<CreateServiceReportPage> createState() => _CreateServiceReportPageState();
}

class _CreateServiceReportPageState extends ConsumerState<CreateServiceReportPage> {
  bool initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!initialized && widget.workOrderId != null) {
      final formController = ref.read(serviceReportFormProvider);
      final workOrderDao = ref.read(workOrderDaoProvider);
      workOrderDao.getWorkOrderById(widget.workOrderId!).then((wo) {
        if (wo != null) {
          formController.setWorkOrder(wo);
        }
      });
      initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(serviceReportFormProvider);
    final formKey = controller.formKey;
    final editable = controller.editMode || controller.isCreatingNewScale;

    return Scaffold(
      appBar: AppBar(title: const Text('Create Service Report')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              WorkOrderDropdown(
                selected: controller.selectedWorkOrder,
                onSelected: controller.setWorkOrder,
              ),
              const SizedBox(height: 16),
              if (controller.selectedWorkOrder != null)
                ScaleDropdown(
                  customerId: controller.selectedWorkOrder!.customerId,
                  selectedScaleId: controller.selectedScale?.id,
                  onChanged: controller.setScale,
                ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Edit Mode',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: editable,
                    onChanged: (val) => controller.toggleEditMode(val),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              TextFormField(
                controller: controller.scaleNotesController,
                maxLines: 2,
                readOnly: !editable,
                decoration: InputDecoration(
                  labelText: 'Scale Description / Location (Optional)',
                  border: const OutlineInputBorder(),
                  filled: true,
                  fillColor: editable ? Colors.teal.shade50 : Colors.grey.shade200,
                ),
              ),
              const SizedBox(height: 12),
              ScaleTypeSelector(
                selectedType: controller.selectedScaleType,
                selectedSubtype: controller.selectedSubtype,
                enabled: editable,
                onTypeChanged: (val) {
                  if (val != null) controller.setScaleType(val);
                },
                onSubtypeChanged: controller.setSubtype,
              ),
              ConfigurationToggle(
                configuration: controller.configuration,
                enabled: editable,
                onChanged: (val) {
                  if (editable && val != null) {
                    controller.setConfiguration(val);
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: IndicatorSection(
                      makeController: controller.indicatorMakeController,
                      modelController: controller.indicatorModelController,
                      serialController: controller.indicatorSerialController,
                      prefixValue: controller.indicatorPrefix,
                      onPrefixChanged: (val) => controller.indicatorPrefix = val ?? 'AM',
                      approvalCodeController: controller.indicatorApprovalCodeController,
                      editable: controller.editable,
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (controller.configuration)
                    Expanded(
                      flex: 1,
                      child: BaseSection(
                        makeController: controller.baseMakeController,
                        modelController: controller.baseModelController,
                        serialController: controller.baseSerialController,
                        prefixValue: controller.basePrefix,
                        onPrefixChanged: (val) => controller.basePrefix = val ?? 'AM',
                        approvalCodeController: controller.baseApprovalCodeController,
                        editable: controller.editable,
                      ),
                    )
                  else
                    const Spacer(flex: 1),
                ],
              ),
              const SizedBox(height: 20),
              ScaleCapacitySection(
                capacityController: controller.capacityController,
                capacityUnit: controller.capacityUnit,
                onCapacityUnitChanged: (val) {
                  if (val != null) controller.setCapacityUnit(val);
                },
                divisionController: controller.divisionController,
                divisionUnit: 'kg',
                onDivisionUnitChanged: (_) {},
                loadCellsController: controller.loadCellsController,
                sectionsController: controller.sectionsController,
                editable: controller.editable,
              ),
              const SizedBox(height: 20),
              LoadCellSection(
                capacityController: controller.loadCellCapacityController,
                capacityUnit: controller.loadCellCapacityUnit,
                onCapacityUnitChanged: (val) {
                  if (val != null) controller.setLoadCellCapacityUnit(val);
                },
                modelController: controller.loadCellModelController,
                editable: controller.editable,
              ),
              const SizedBox(height: 20),
              const LegalStatusSection(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      final saved = await controller.save();
                      if (context.mounted && saved) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Service Report saved')),
                        );
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save and Exit'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      final saved = await controller.save();
                      if (!context.mounted || !saved) return;
                      if (controller.selectedServiceReportId != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CreateWeightTestPage(
                              serviceReportId: controller.selectedServiceReportId!,
                            ),
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Add Forms'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
