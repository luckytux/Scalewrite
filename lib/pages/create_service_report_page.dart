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
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;

    final controller = ref.read(serviceReportFormProvider);

    // Defer provider mutations to after first build.
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      if (widget.serviceReportId != null) {
        await controller.loadServiceReport(widget.serviceReportId!);
      } else if (widget.workOrderId != null) {
        final workOrderDao = ref.read(workOrderDaoProvider);
        final wo = await workOrderDao.getWorkOrderById(widget.workOrderId!);
        if (!mounted) return;
        if (wo != null) controller.setWorkOrder(wo);
      } else {
        controller.startNewBlankReport(customerId: widget.customerId);
      }
    });
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

  double? _readCapacity(ServiceReportFormController c) {
    final capText = c.capacityController.text.trim();
    final fromField = double.tryParse(capText);
    if (fromField != null) return fromField;
    return c.selectedScale?.capacity;
  }

  void _pushWeightTest(BuildContext context, ServiceReportFormController c) {
    final srId = c.selectedServiceReportId!;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CreateWeightTestPage(
          serviceReportId: srId,
          division: _readDivision(c),
          numberOfSections: _readSections(c),
          maxCapacity: _readCapacity(c),
        ),
      ),
    );
  }

  // -------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(serviceReportFormProvider);
    final formKey = controller.formKey;

    // Edit forced ON for new-scale mode
    final editable = controller.isCreatingNewScale || controller.editMode;

    // Focus orders (gapped so we can insert easily later)
    const oWorkOrder   = 0.0;
    const oScale       = 5.0;
    const oEditToggle  = 10.0;
    const oScaleNotes  = 20.0;
    const oScaleType   = 30.0;  // type/subtype internal order handled by widget if provided
    const oConfig      = 40.0;

    const oIndicator   = 100.0; // indicator section (100..)
    const oBase        = 200.0; // base section (200..)

    const oCapacity    = 300.0; // capacity block (300..)
    const oLoadCell    = 350.0; // load cell block (350..)
    const oReportType  = 410.0;
    const oReportNotes = 410.0;
    const oLegal       = 500.0;
    const oButtons     = 600.0;

    return Scaffold(
      appBar: AppBar(title: const Text('Create Service Report')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                // Work order selector
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oWorkOrder),
                  child: WorkOrderDropdown(
                    selected: controller.selectedWorkOrder,
                    onSelected: controller.setWorkOrder,
                  ),
                ),
                const SizedBox(height: 16),

                // Scale dropdown (after work order)
                if (controller.selectedWorkOrder != null)
                  FocusTraversalOrder(
                    order: const NumericFocusOrder(oScale),
                    child: ScaleDropdown(
                      customerId: controller.selectedWorkOrder!.customerId,
                      selectedScaleId: controller.selectedScale?.id,
                      onChanged: controller.setScale,
                    ),
                  ),

                const SizedBox(height: 16),

                // Edit toggle row
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oEditToggle),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Edit Mode',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Tooltip(
                        message: controller.isCreatingNewScale
                            ? 'Edit is always ON when creating a new scale'
                            : 'Toggle edit mode',
                        child: Switch(
                          value: editable,
                          onChanged: controller.isCreatingNewScale
                              ? null
                              : (val) => controller.toggleEditMode(val),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Scale notes/description
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oScaleNotes),
                  child: TextFormField(
                    controller: controller.scaleNotesController,
                    maxLines: 2,
                    readOnly: !editable,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: 'Scale Description / Location (Optional)',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor:
                          editable ? Colors.teal.shade50 : Colors.grey.shade200,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Scale type/subtype
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oScaleType),
                  child: ScaleTypeSelector(
                    selectedType: controller.selectedScaleType,
                    selectedSubtype: controller.selectedSubtype,
                    enabled: editable,
                    onTypeChanged: (val) {
                      if (val != null) controller.setScaleType(val);
                    },
                    onSubtypeChanged: controller.setSubtype,
                    // if your ScaleTypeSelector supports internal ordering, pass orderBase here
                    orderBase: oScaleType.toInt(),
                  ),
                ),

                // Configuration toggle
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oConfig),
                  child: ConfigurationToggle(
                    configuration: controller.configuration,
                    enabled: editable,
                    onChanged: (val) {
                      if (editable && val != null) controller.setConfiguration(val);
                    },
                  ),
                ),

                const SizedBox(height: 20),

                // Indicator/Base sections side-by-side with explicit orders
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: FocusTraversalOrder(
                        order: const NumericFocusOrder(oIndicator),
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
                          orderBase: oIndicator.toInt(), // 100..104 inside
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (controller.configuration)
                      Expanded(
                        child: FocusTraversalOrder(
                          order: const NumericFocusOrder(oBase),
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
                            orderBase: oBase.toInt(), // 200..204 inside
                          ),
                        ),
                      )
                    else
                      const Spacer(),
                  ],
                ),

                const SizedBox(height: 20),

                // Capacity / sections
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oCapacity),
                  child: ScaleCapacitySection(
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
                    // if your ScaleCapacitySection supports internal ordering, you can add orderBase
                    // orderBase: oCapacity.toInt(),
                  ),
                ),

                const SizedBox(height: 20),

                // Load cell
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oLoadCell),
                  child: LoadCellSection(
                    capacityController: controller.loadCellCapacityController,
                    capacityUnit: controller.loadCellCapacityUnit,
                    onCapacityUnitChanged: (val) {
                      if (val != null) controller.setLoadCellCapacityUnit(val);
                    },
                    modelController: controller.loadCellModelController,
                    editable: controller.editable,
                    // orderBase: oLoadCell.toInt(),
                  ),
                ),

                const SizedBox(height: 20),

                // Report type
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oReportType),
                  child: ReportTypeSelector(
                    selected: controller.reportType,
                    onChanged: controller.editable
                        ? (val) => controller.setReportType(val ?? 'Standard')
                        : null,
                    readOnly: !editable,
                    // orderBase: oReportType.toInt(),
                  ),
                ),

                // Report notes
                ReportNotesSection(
                  controller: controller.reportNotesController,
                  readOnly: !editable,
                  focusOrder: oReportNotes, // <-- ensure it sits exactly after Report Type
                ),

                // Legal status
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oLegal),
                  child: const LegalStatusSection(),
                ),

                const SizedBox(height: 24),

                // Buttons
                FocusTraversalOrder(
                  order: const NumericFocusOrder(oButtons),
                  child: Row(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
