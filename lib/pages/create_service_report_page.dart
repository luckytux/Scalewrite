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
import '../widgets/service_report/report_notes_section.dart';
import '../widgets/service_report/report_type_selector.dart';
import '../widgets/forms/add_forms_popup.dart'; // Add Forms dialog
import '../data/static/ipo_checklists.dart'; // ipoChecklists map
import '../pages/checklists/ipo_checklist_page.dart'; // IPOChecklistPage
import '../pages/create_weight_test_page.dart'; // Weight test page
import '../models/ipo_checklist.dart'; // IPOSection model

class CreateServiceReportPage extends ConsumerStatefulWidget {
  final int? customerId;
  final int? workOrderId;
  final int? serviceReportId;

  const CreateServiceReportPage({
    super.key,
    this.customerId,
    this.workOrderId,
    this.serviceReportId,
  });

  @override
  ConsumerState<CreateServiceReportPage> createState() =>
      _CreateServiceReportPageState();
}

class _CreateServiceReportPageState
    extends ConsumerState<CreateServiceReportPage> {
  bool initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = ref.read(serviceReportFormProvider);
    if (!initialized) {
      if (widget.serviceReportId != null) {
        controller.loadServiceReport(widget.serviceReportId!);
      } else if (widget.workOrderId != null) {
        ref.read(workOrderDaoProvider)
          .getWorkOrderById(widget.workOrderId!)
          .then((wo) {
            if (wo != null) controller.setWorkOrder(wo);
          });
      }
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
                children: [
                  const Text('Edit Mode',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const Spacer(),
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
                  fillColor:
                      editable ? Colors.teal.shade50 : Colors.grey.shade200,
                ),
              ),
              const SizedBox(height: 12),
              ScaleTypeSelector(
                selectedType: controller.selectedScaleType,
                selectedSubtype: controller.selectedSubtype,
                enabled: editable,
                onTypeChanged: (val) =>
                    val != null ? controller.setScaleType(val) : null,
                onSubtypeChanged: controller.setSubtype,
              ),
              const SizedBox(height: 12),
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
                    child: IndicatorSection(
                      makeController: controller.indicatorMakeController,
                      modelController: controller.indicatorModelController,
                      serialController: controller.indicatorSerialController,
                      prefixValue: controller.indicatorPrefix,
                      onPrefixChanged: (val) =>
                          controller.indicatorPrefix = val ?? 'AM',
                      approvalCodeController:
                          controller.indicatorApprovalCodeController,
                      editable: controller.editable,
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (controller.configuration)
                    Expanded(
                      child: BaseSection(
                        makeController: controller.baseMakeController,
                        modelController: controller.baseModelController,
                        serialController: controller.baseSerialController,
                        prefixValue: controller.basePrefix,
                        onPrefixChanged: (val) =>
                            controller.basePrefix = val ?? 'AM',
                        approvalCodeController:
                            controller.baseApprovalCodeController,
                        editable: controller.editable,
                      ),
                    )
                  else
                    const Spacer(),
                ],
              ),
              const SizedBox(height: 20),
              ScaleCapacitySection(
                capacityController: controller.capacityController,
                capacityUnit: controller.capacityUnit,
                onCapacityUnitChanged: (val) =>
                    val != null ? controller.setCapacityUnit(val) : null,
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
                onCapacityUnitChanged: (val) => val != null
                    ? controller.setLoadCellCapacityUnit(val)
                    : null,
                modelController: controller.loadCellModelController,
                editable: controller.editable,
              ),
              const SizedBox(height: 20),
              ReportTypeSelector(
                selected: controller.reportType,
                onChanged: controller.editable
                    ? (val) => controller.setReportType(val ?? 'Standard')
                    : null,
                readOnly: !editable,
              ),
              ReportNotesSection(
                controller: controller.reportNotesController,
                readOnly: !editable,
              ),
              const LegalStatusSection(),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.save),
                    label: const Text('Save and Exit'),
                    onPressed: () async {
                      final saved = await controller.save();
                      if (context.mounted && saved) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Service Report saved'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    },
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.add_circle_outline),
                    label: const Text('Add Forms'),
                    onPressed: () async {
                      final saved = await controller.save();
                      if (!context.mounted || !saved) return;

                      showDialog(
                        context: context,
                        builder: (_) => AddFormsPopup(
                          onFormSelected: (formType, {ipoType}) {
                            if (formType == 'Weight Test' &&
                                controller.selectedServiceReportId != null) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => CreateWeightTestPage(
                                    serviceReportId:
                                        controller.selectedServiceReportId!,
                                    division: double.tryParse(
                                            controller.divisionController.text) ??
                                        10,
                                  ),
                                ),
                              );
                            } else if (formType == 'Inspection Procedure' &&
                                ipoType != null) {
                              final ipo = ipoChecklists[ipoType]!;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => IPOChecklistPage(
                                    ipoTitle: '$ipoType – ${ipo.title}',
                                    sections: ipo.sections
                                        .map((sec) => IPOSection(
                                            title: sec, items: []))
                                        .toList(),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      );
                    },
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
