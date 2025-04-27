// File: lib/pages/create_service_report_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import '../providers/service_report_form_provider.dart';
import '../providers/drift_providers.dart';
import '../widgets/service_report/work_order_dropdown.dart';
import '../widgets/service_report/scale_dropdown.dart';
import '../widgets/service_report/configuration_toggle.dart';
import '../widgets/service_report/indicator_section.dart';
import '../widgets/service_report/base_section.dart';
import '../widgets/service_report/load_cell_section.dart';
import '../widgets/service_report/scale_capacity_section.dart';
import 'create_weight_test_page.dart';

class CreateServiceReportPage extends ConsumerStatefulWidget {
  final int? customerId;
  final int? workOrderId;

  const CreateServiceReportPage({super.key, this.customerId, this.workOrderId});

  @override
  ConsumerState<CreateServiceReportPage> createState() => _CreateServiceReportPageState();
}

class _CreateServiceReportPageState extends ConsumerState<CreateServiceReportPage> {
  late final ServiceReportFormController controller;
  late final GlobalKey<FormState> _formKey;
  
  final indicatorMakeController = TextEditingController();
  final indicatorModelController = TextEditingController();
  final indicatorSerialController = TextEditingController();
  final indicatorApprovalCodeController = TextEditingController();
  String indicatorPrefix = 'AM';

  final baseMakeController = TextEditingController();
  final baseModelController = TextEditingController();
  final baseSerialController = TextEditingController();
  final baseApprovalCodeController = TextEditingController();
  String basePrefix = 'AM';

  final loadCellModelController = TextEditingController();
  final loadCellCapacityController = TextEditingController();
  String loadCellCapacityUnit = 'kg';

  final capacityController = TextEditingController();
  String capacityUnit = 'kg';
  final divisionController = TextEditingController();
  String divisionUnit = 'kg';
  final loadCellsController = TextEditingController();
  final sectionsController = TextEditingController();

  bool configuration = false;
  int? selectedWorkOrderId;
  int? customerId;

  @override
  void initState() {
    super.initState();
    controller = ref.read(serviceReportFormProvider.notifier);
    _formKey = controller.formKey;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.workOrderId != null) {
        selectedWorkOrderId = widget.workOrderId;
        _loadWorkOrder(widget.workOrderId!);
      } else {
        controller.setWorkOrder(null);
        controller.toggleEditMode(controller.isCreatingNewScale);
      }
    });
  }

  Future<void> _loadWorkOrder(int id) async {
    final db = ref.read(databaseProvider);
    final workOrder = await db.workOrderDao.getWorkOrderById(id);
    if (workOrder != null) {
      setState(() {
        customerId = workOrder.customerId;
        controller.setWorkOrder(workOrder);
      });
    }
  }

  void _handleWorkOrderSelected(WorkOrder? workOrder) {
    if (workOrder == null) return;
    setState(() {
      selectedWorkOrderId = workOrder.id;
      customerId = workOrder.customerId;
      controller.setWorkOrder(workOrder);
    });
  }

  void _handleScaleSelected(Scale? scale) {
    controller.setScale(scale);
    if (scale != null) {
      setState(() {
        configuration = scale.configuration;
        indicatorMakeController.text = scale.indicatorMake;
        indicatorModelController.text = scale.indicatorModel;
        indicatorSerialController.text = scale.indicatorSerial;
        indicatorApprovalCodeController.text = scale.approvalNumber;
        indicatorPrefix = scale.approvalPrefix;

        baseMakeController.text = scale.baseMake ?? '';
        baseModelController.text = scale.baseModel ?? '';
        baseSerialController.text = scale.baseSerial ?? '';
        baseApprovalCodeController.text = scale.baseApprovalNumber ?? '';
        basePrefix = scale.baseApprovalPrefix ?? 'AM';

        capacityController.text = scale.capacity.toString();
        capacityUnit = scale.capacityUnit;
        divisionController.text = scale.division.toString();
        loadCellsController.text = scale.numberOfLoadCells.toString();
        sectionsController.text = scale.numberOfSections.toString();

        loadCellModelController.text = scale.loadCellModel;
        loadCellCapacityController.text = scale.loadCellCapacity.toString();
        loadCellCapacityUnit = scale.loadCellCapacityUnit;
      });
    }
  }

  Future<void> _saveServiceReport() async {
    if (!_formKey.currentState!.validate()) return;
    if (customerId == null || selectedWorkOrderId == null) return;

    final isCreating = controller.isCreatingNewScale;

    if (isCreating) {
      final newScaleId = await controller.createNewScale(
        customerId: customerId!,
        configuration: configuration,
        scaleType: 'Bulk Weigher',
        indicatorMake: indicatorMakeController.text,
        indicatorModel: indicatorModelController.text,
        indicatorSerial: indicatorSerialController.text,
        approvalPrefix: indicatorPrefix,
        approvalNumber: indicatorApprovalCodeController.text,
        baseMake: baseMakeController.text,
        baseModel: baseModelController.text,
        baseSerial: baseSerialController.text,
        baseApprovalPrefix: basePrefix,
        baseApprovalNumber: baseApprovalCodeController.text,
        capacity: double.tryParse(capacityController.text) ?? 0,
        capacityUnit: capacityUnit,
        division: double.tryParse(divisionController.text) ?? 0,
        numberOfLoadCells: int.tryParse(loadCellsController.text) ?? 0,
        numberOfSections: int.tryParse(sectionsController.text) ?? 0,
        loadCellModel: loadCellModelController.text,
        loadCellCapacity: double.tryParse(loadCellCapacityController.text) ?? 0,
        loadCellCapacityUnit: loadCellCapacityUnit,
      );

      if (newScaleId == null) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to create scale.')),
        );
        return;
      }
    }

    final success = await controller.save();
    if (!mounted) return;

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Service Report saved.')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete all required fields.')),
      );
    }
  }

  Future<void> _showAddFormDialog() async {
    final success = await controller.save();
    if (!success || controller.selectedServiceReportId == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please complete and save the Service Report first.')),
        );
      }
      return;
    }

    if (!mounted) return;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Form'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.scale),
              title: const Text('Weight Test'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CreateWeightTestPage(serviceReportId: controller.selectedServiceReportId!),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.visibility),
              title: const Text('Visual Inspection (Coming Soon)'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: const Text('Mechanical Inspection (Coming Soon)'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  bool get fieldsEditable => controller.isCreatingNewScale || controller.editMode;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(serviceReportFormProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Create Service Report')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              WorkOrderDropdown(
                selected: state.selectedWorkOrder,
                onSelected: _handleWorkOrderSelected,
              ),
              const SizedBox(height: 16),
              if (customerId != null)
                ScaleDropdown(
                  customerId: customerId!,
                  selectedScaleId: state.selectedScale?.id,
                  onChanged: _handleScaleSelected,
                ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Switch(
                    value: controller.editMode,
                    onChanged: selectedWorkOrderId != null
                        ? (val) => setState(() => controller.toggleEditMode(val))
                        : null,
                  ),
                  const SizedBox(width: 8),
                  const Text('Edit Mode'),
                ],
              ),
              const SizedBox(height: 16),
              ConfigurationToggle(
                configuration: configuration,
                enabled: fieldsEditable,
                onChanged: (value) {
                  if (value != null) {
                    setState(() => configuration = value);
                  }
                },
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: fieldsEditable ? 1.0 : 0.5,
                    child: IgnorePointer(
                      ignoring: !fieldsEditable,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2 - 24,
                        child: IndicatorSection(
                          makeController: indicatorMakeController,
                          modelController: indicatorModelController,
                          serialController: indicatorSerialController,
                          prefixValue: indicatorPrefix,
                          onPrefixChanged: (v) => setState(() => indicatorPrefix = v ?? 'AM'),
                          approvalCodeController: indicatorApprovalCodeController,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  if (configuration)
                    Opacity(
                      opacity: fieldsEditable ? 1.0 : 0.5,
                      child: IgnorePointer(
                        ignoring: !fieldsEditable,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2 - 24,
                          child: BaseSection(
                            makeController: baseMakeController,
                            modelController: baseModelController,
                            serialController: baseSerialController,
                            prefixValue: basePrefix,
                            onPrefixChanged: (v) => setState(() => basePrefix = v ?? 'AM'),
                            approvalCodeController: baseApprovalCodeController,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Opacity(
                opacity: fieldsEditable ? 1.0 : 0.5,
                child: IgnorePointer(
                  ignoring: !fieldsEditable,
                  child: ScaleCapacitySection(
                    capacityController: capacityController,
                    capacityUnit: capacityUnit,
                    onCapacityUnitChanged: (v) => setState(() => capacityUnit = v ?? 'kg'),
                    divisionController: divisionController,
                    divisionUnit: divisionUnit,
                    onDivisionUnitChanged: (v) => setState(() => divisionUnit = v ?? 'kg'),
                    loadCellsController: loadCellsController,
                    sectionsController: sectionsController,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Opacity(
                opacity: fieldsEditable ? 1.0 : 0.5,
                child: IgnorePointer(
                  ignoring: !fieldsEditable,
                  child: LoadCellSection(
                    capacityController: loadCellCapacityController,
                    capacityUnit: loadCellCapacityUnit,
                    onCapacityUnitChanged: (v) => setState(() => loadCellCapacityUnit = v ?? 'kg'),
                    modelController: loadCellModelController,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _saveServiceReport,
                    icon: const Icon(Icons.save),
                    label: const Text('Save and Exit'),
                  ),
                  ElevatedButton.icon(
                    onPressed: _showAddFormDialog,
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
