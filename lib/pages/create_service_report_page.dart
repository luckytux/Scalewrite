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

import '../widgets/forms/add_forms_popup.dart';
import '../data/static/ipo_checklists.dart';
import '../pages/checklists/ipo_checklist_page.dart';
import '../pages/create_weight_test_page.dart';

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
        final workOrderDao = ref.read(workOrderDaoProvider);
        workOrderDao.getWorkOrderById(widget.workOrderId!).then((wo) {
          if (wo != null) controller.setWorkOrder(wo);
        });
      }
      initialized = true;
    }
  }

  // -------- Helpers to push the Weight Test page with correct inputs --------

  double _readDivision(ServiceReportFormController c) {
    final text = c.divisionController.text.trim();
    final fromField = double.tryParse(text);
    if (fromField != null) return fromField;
    return c.selectedScale?.division ?? 10;
  }

  int _readSections(ServiceReportFormController c) {
    final text = c.sectionsController.text.trim();
    final fromField = int.tryParse(text);
    if (fromField != null) return fromField;
    return c.selectedScale?.numberOfSections ?? 4;
  }

  /// Scale capacity (Drift `RealColumn` on `scales`), same unit as division.
  /// Prefer the form value if user typed it, else use the selected scale's value.
  double? _readCapacity(ServiceReportFormController c) {
    final capText = c.capacityController.text.trim();
    final fromField = double.tryParse(capText);
    if (fromField != null) return fromField;
    return c.selectedScale?.capacity; // already a double from the model
  }

  void _pushWeightTest(BuildContext context, ServiceReportFormController c) {
    final srId = c.selectedServiceReportId!;
    final division = _readDivision(c);
    final sections = _readSections(c);
    final capacity = _readCapacity(c);

    debugPrint('📋 Add Forms → Weight Test');
    debugPrint('   • SR ID       = $srId');
    debugPrint('   • Division    = $division');
    debugPrint('   • Sections    = $sections');
    debugPrint('   • Capacity    = $capacity');

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CreateWeightTestPage(
          serviceReportId: srId,
          division: division,
          numberOfSections: sections,
          maxCapacity: capacity, // ✅ used to compute n = capacity / e for critical points
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------

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
                  if (editable && val != null) controller.setConfiguration(val);
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
                      if (!context.mounted || !saved) return;

                      showDialog(
                        context: context,
                        builder: (_) => AddFormsPopup(
                          onFormSelected: (formType, {String? ipoType}) {
                            Navigator.of(context).pop();

                            if (formType == 'Weight Test' &&
                                controller.selectedServiceReportId != null) {
                              _pushWeightTest(context, controller);
                            } else if (ipoType != null &&
                                controller.selectedServiceReportId != null) {
                              final ipo = ipoChecklists[ipoType]!;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => IPOChecklistPage(
                                    ipoType: ipoType,
                                    serviceReportId:
                                        controller.selectedServiceReportId!,
                                    ipoTitle: '$ipoType — ${ipo.title}',
                                    sections: ipo.sections,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      );
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
                          onFormSelected: (formType, {String? ipoType}) {
                            Navigator.of(context).pop();

                            if (formType == 'Weight Test' &&
                                controller.selectedServiceReportId != null) {
                              _pushWeightTest(context, controller);
                            } else if (ipoType != null &&
                                controller.selectedServiceReportId != null) {
                              final ipo = ipoChecklists[ipoType]!;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => IPOChecklistPage(
                                    ipoType: ipoType,
                                    serviceReportId:
                                        controller.selectedServiceReportId!,
                                    ipoTitle: '$ipoType — ${ipo.title}',
                                    sections: ipo.sections,
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
