// File: lib/providers/service_report_form_provider.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:drift/drift.dart';
import '../data/database.dart';
import '../providers/drift_providers.dart';

final serviceReportFormProvider =
    ChangeNotifierProvider<ServiceReportFormController>((ref) {
  return ServiceReportFormController(ref);
});

class ServiceReportFormController extends ChangeNotifier {
  final TextEditingController reportNotesController = TextEditingController();
  final Ref ref;
  AppDatabase get db => ref.read(databaseProvider);

  final formKey = GlobalKey<FormState>();
  final scaleNotesController = TextEditingController();

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
  String loadCellCapacityUnit = 'lb';

  final capacityController = TextEditingController();
  String capacityUnit = 'kg';
  final divisionController = TextEditingController();
  final loadCellsController = TextEditingController();
  final sectionsController = TextEditingController();

  String selectedScaleType = 'Other';
  String? selectedSubtype;
  String? customTypeDescription;

  bool configuration = true;
  void setConfiguration(bool value) {
    configuration = value;
    notifyListeners();
  }

  WorkOrder? selectedWorkOrder;
  Scale? selectedScale;
  String reportType = 'Standard';
  bool editMode = false;
  bool isCreatingNewScale = false;
  int? selectedServiceReportId;

  bool isLegalForTrade = false;
  DateTime? inspectionExpiry;
  String? sealStatus;
  String? inspectionResult;
  final inspectionExpiryController = TextEditingController();

  final InputDecoration readOnlyDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.grey.shade200,
    border: const OutlineInputBorder(),
  );

  ServiceReportFormController(this.ref);

  /// Wipes all scale-related inputs back to safe defaults.
  void _clearScaleFieldsToDefaults() {
    // Text fields
    scaleNotesController.clear();
    indicatorMakeController.clear();
    indicatorModelController.clear();
    indicatorSerialController.clear();
    indicatorApprovalCodeController.clear();

    baseMakeController.clear();
    baseModelController.clear();
    baseSerialController.clear();
    baseApprovalCodeController.clear();

    capacityController.clear();
    divisionController.clear();
    loadCellsController.clear();
    sectionsController.clear();
    loadCellModelController.clear();
    loadCellCapacityController.clear();

    // Toggles & dropdown defaults
    selectedScaleType = 'Other';
    selectedSubtype = null;
    customTypeDescription = null;
    configuration = true;

    // Units & prefixes defaults
    indicatorPrefix = 'AM';
    basePrefix = 'AM';
    capacityUnit = 'kg';
    loadCellCapacityUnit = 'lb';

    // Legal fields
    isLegalForTrade = false;
    sealStatus = null;
    inspectionResult = null;
    inspectionExpiry = null;
    inspectionExpiryController.clear();
  }

  /// Initialize a truly blank, editable service report (from Home).
  void startNewBlankReport({int? customerId}) {
    clear(); // clears global + scale fields
    isCreatingNewScale = true; // editable via new-scale
    editMode = false;
    notifyListeners();
  }

  /// Called when a Work Order is selected (e.g., arriving from View WO).
  void setWorkOrder(WorkOrder? wo) {
    selectedWorkOrder = wo;
    selectedScale = null;
    isCreatingNewScale = true; // unlocks the form
    editMode = false;
    _clearScaleFieldsToDefaults(); // ✅ ensure clean slate for "Create New"
    notifyListeners();
  }

  /// Choose an existing scale (null means "Create New Scale").
  void setScale(Scale? scale) {
    selectedScale = scale;
    isCreatingNewScale = (scale == null);

    if (scale == null) {
      // ✅ Switching back to "Create New" should clear everything
      _clearScaleFieldsToDefaults();
      notifyListeners();
      return;
    }

    // Populate from existing scale
    scaleNotesController.text = scale.notes ?? '';
    selectedScaleType = scale.scaleType;
    selectedSubtype = scale.scaleSubtype;
    configuration = scale.configuration;

    indicatorMakeController.text = scale.indicatorMake;
    indicatorModelController.text = scale.indicatorModel;
    indicatorSerialController.text = scale.indicatorSerial;
    indicatorPrefix = scale.approvalPrefix;
    indicatorApprovalCodeController.text = scale.approvalNumber;

    baseMakeController.text = scale.baseMake ?? '';
    baseModelController.text = scale.baseModel ?? '';
    baseSerialController.text = scale.baseSerial ?? '';
    basePrefix = scale.baseApprovalPrefix ?? 'AM';
    baseApprovalCodeController.text = scale.baseApprovalNumber ?? '';

    capacityController.text = scale.capacity.toString();
    capacityUnit = scale.capacityUnit;
    divisionController.text = scale.division.toString();
    loadCellsController.text = scale.numberOfLoadCells.toString();
    sectionsController.text = scale.numberOfSections.toString();
    loadCellModelController.text = scale.loadCellModel;
    loadCellCapacityController.text = scale.loadCellCapacity.toString();
    loadCellCapacityUnit = scale.loadCellCapacityUnit;

    isLegalForTrade = scale.legalForTrade;
    sealStatus = scale.sealStatus;
    inspectionResult = scale.inspectionResult;
    setInspectionExpiry(scale.inspectionExpiry);

    notifyListeners();
  }

  void setReportType(String? value) {
    reportType = value ?? 'Standard';
    notifyListeners();
  }

  /// Toggle explicit "Create New Scale" mode.
  void setIsCreatingNewScale(bool value) {
    isCreatingNewScale = value;
    if (value) {
      // Turning ON new-scale mode clears old selection & fields
      selectedScale = null;
      _clearScaleFieldsToDefaults();
    }
    notifyListeners();
  }

  void setScaleType(String value) {
    selectedScaleType = value;
    notifyListeners();
  }

  void setSubtype(String? value) {
    selectedSubtype = value;
    notifyListeners();
  }

  void setCustomTypeDescription(String? value) {
    customTypeDescription = value;
    notifyListeners();
  }

  void toggleEditMode(bool value) {
    editMode = value;
    notifyListeners();
  }

  void setLegalForTrade(bool value) {
    isLegalForTrade = value;
    notifyListeners();
  }

  void setInspectionExpiry(DateTime? date) {
    inspectionExpiry = date;
    inspectionExpiryController.text = date != null
        ? '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}'
        : '';
    notifyListeners();
  }

  void setSealStatus(String? value) {
    sealStatus = value;
    notifyListeners();
  }

  void setInspectionResult(String? value) {
    inspectionResult = value;
    notifyListeners();
  }

  void setLoadCellCapacityUnit(String value) {
    loadCellCapacityUnit = value;
    notifyListeners();
  }

  void setCapacityUnit(String value) {
    capacityUnit = value;
    notifyListeners();
  }

  String? validateApprovalNumber(String? value) {
    if (value == null || !RegExp(r'^\d{4}$').hasMatch(value)) {
      return 'Approval number must be 4 digits';
    }
    return null;
  }

  Future<void> loadServiceReport(int reportId) async {
    final result = await db.serviceReportDao.getById(reportId);
    if (result == null) return;

    final report = result.report;
    final scale = result.scale;
    final wo = await db.workOrderDao.getWorkOrderById(report.workOrderId);

    setWorkOrder(wo);
    setScale(scale);

    selectedServiceReportId = report.id;
    reportType = report.reportType;
    reportNotesController.text = report.notes ?? '';

    notifyListeners();
  }

  Future<bool> save() async {
    if (!formKey.currentState!.validate()) {
      debugPrint('❌ Form validation failed');
      return false;
    }

    if (selectedWorkOrder == null) {
      debugPrint('❌ selectedWorkOrder is null');
      return false;
    }

    // Create a scale first if we’re in new-scale mode.
    if (selectedScale == null && isCreatingNewScale) {
      final newScale = ScalesCompanion(
        customerId: Value(selectedWorkOrder!.customerId),
        notes: Value(scaleNotesController.text),
        scaleType: Value(selectedScaleType),
        scaleSubtype: Value(selectedSubtype ?? ''),
        configuration: Value(configuration),
        indicatorMake: Value(indicatorMakeController.text),
        indicatorModel: Value(indicatorModelController.text),
        indicatorSerial: Value(indicatorSerialController.text),
        approvalPrefix: Value(indicatorPrefix),
        approvalNumber: Value(indicatorApprovalCodeController.text),
        baseMake: Value(baseMakeController.text),
        baseModel: Value(baseModelController.text),
        baseSerial: Value(baseSerialController.text),
        baseApprovalPrefix: Value(basePrefix),
        baseApprovalNumber: Value(baseApprovalCodeController.text),
        capacity: Value(double.tryParse(capacityController.text) ?? 0),
        capacityUnit: Value(capacityUnit),
        division: Value(double.tryParse(divisionController.text) ?? 0),
        numberOfLoadCells: Value(int.tryParse(loadCellsController.text) ?? 0),
        numberOfSections: Value(int.tryParse(sectionsController.text) ?? 0),
        loadCellModel: Value(loadCellModelController.text),
        loadCellCapacity:
            Value(double.tryParse(loadCellCapacityController.text) ?? 0),
        loadCellCapacityUnit: Value(loadCellCapacityUnit),
        legalForTrade: Value(isLegalForTrade),
        sealStatus: Value(sealStatus),
        inspectionResult: Value(inspectionResult),
        inspectionExpiry: Value(inspectionExpiry),
      );

      final scaleId = await db.scaleDao.insertScale(newScale);
      selectedScale = await db.scaleDao.getScaleById(scaleId);
    }

    if (selectedScale == null) {
      debugPrint('❌ selectedScale is null');
      return false;
    }

    final companion = ServiceReportsCompanion(
      workOrderId: Value(selectedWorkOrder!.id),
      scaleId: Value(selectedScale!.id),
      reportType: Value(reportType),
      notes: Value(reportNotesController.text),
    );

    if (selectedServiceReportId != null) {
      final updated = await db.update(db.serviceReports).replace(
        companion.copyWith(id: Value(selectedServiceReportId!)),
      );
      debugPrint(updated
          ? '✅ Service Report updated: ID $selectedServiceReportId'
          : '❌ Failed to update Service Report');
    } else {
      selectedServiceReportId =
          await db.serviceReportDao.insertReport(companion);
      debugPrint('✅ Service Report inserted: ID $selectedServiceReportId');
    }

    notifyListeners();
    return true;
  }

  void clear() {
    selectedWorkOrder = null;
    selectedScale = null;
    reportType = 'Standard';
    editMode = false;
    isCreatingNewScale = false;
    selectedServiceReportId = null;

    // Report notes
    reportNotesController.clear();

    // Scale-specific
    _clearScaleFieldsToDefaults();

    notifyListeners();
  }

  @override
  void dispose() {
    reportNotesController.dispose();
    scaleNotesController.dispose();
    inspectionExpiryController.dispose();
    indicatorMakeController.dispose();
    indicatorModelController.dispose();
    indicatorSerialController.dispose();
    indicatorApprovalCodeController.dispose();
    baseMakeController.dispose();
    baseModelController.dispose();
    baseSerialController.dispose();
    baseApprovalCodeController.dispose();
    capacityController.dispose();
    divisionController.dispose();
    loadCellsController.dispose();
    sectionsController.dispose();
    loadCellModelController.dispose();
    loadCellCapacityController.dispose();
    super.dispose();
  }

  bool get editable => editMode || isCreatingNewScale;
}
