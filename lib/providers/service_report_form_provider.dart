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

  void setWorkOrder(WorkOrder? wo) {
    selectedWorkOrder = wo;
    selectedScale = null;
    notifyListeners();
  }

  void setScale(Scale? scale) {
    selectedScale = scale;
    isCreatingNewScale = scale == null;

    if (scale != null) {
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
    }

    notifyListeners();
  }

  void setReportType(String? value) {
    reportType = value ?? 'Standard';
    notifyListeners();
  }

  void setIsCreatingNewScale(bool value) {
    isCreatingNewScale = value;
    if (!value) selectedScale = null;
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

    if (selectedScale == null && isCreatingNewScale) {
      debugPrint('ℹ️ TODO: handle new scale creation');
      return false;
    }

    if (selectedScale == null) {
      debugPrint('❌ selectedScale is null');
      return false;
    }

    final dao = db.serviceReportDao;
    selectedServiceReportId = await dao.insertReport(ServiceReportsCompanion(
      workOrderId: Value(selectedWorkOrder!.id),
      scaleId: Value(selectedScale!.id),
      reportType: Value(reportType),
      notes: Value(reportNotesController.text),
    ));

    debugPrint('✅ Service Report saved with ID: $selectedServiceReportId');

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
    scaleNotesController.clear();
    reportNotesController.clear();
    isLegalForTrade = false;
    inspectionExpiry = null;
    sealStatus = null;
    inspectionResult = null;
    inspectionExpiryController.clear();
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
    selectedScaleType = 'Other';
    selectedSubtype = null;
    customTypeDescription = null;
    configuration = true;
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
