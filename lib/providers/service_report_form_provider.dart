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
  final Ref ref;
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
  String? notes;
  bool editMode = false;
  bool isCreatingNewScale = false;
  int? selectedServiceReportId;

  // Legal for Trade Fields
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
    if (scale != null) configuration = scale.configuration;
    notifyListeners();
  }

  void setIsCreatingNewScale(bool value) {
    isCreatingNewScale = value;
    if (!value) selectedScale = null;
    notifyListeners();
  }

  void setReportType(String value) {
    reportType = value;
    notifyListeners();
  }

  void setNotes(String? value) {
    notes = value;
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

  String? validateApprovalNumber(String? value) {
    if (value == null || !RegExp(r'^\d{4}\$').hasMatch(value)) {
      return 'Approval number must be 4 digits';
    }
    return null;
  }

  Future<int?> createNewScale({
    required int customerId,
    required bool configuration,
    required String scaleType,
    String? subtype,
    String? customTypeDescription,
    required String indicatorMake,
    required String indicatorModel,
    required String indicatorSerial,
    required String approvalPrefix,
    required String approvalNumber,
    required String baseMake,
    required String baseModel,
    required String baseSerial,
    required String baseApprovalPrefix,
    required String baseApprovalNumber,
    required double capacity,
    required String capacityUnit,
    required double division,
    required int numberOfLoadCells,
    required int numberOfSections,
    required String loadCellModel,
    required double loadCellCapacity,
    required String loadCellCapacityUnit,
    required String? notes,
  }) async {
    final newScale = ScalesCompanion(
      customerId: Value(customerId),
      configuration: Value(configuration),
      scaleType: Value(selectedScaleType),
      scaleSubtype: Value(selectedSubtype ?? 'Other'),
      customTypeDescription: Value(customTypeDescription),
      indicatorMake: Value(indicatorMake),
      indicatorModel: Value(indicatorModel),
      indicatorSerial: Value(indicatorSerial),
      approvalPrefix: Value(approvalPrefix),
      approvalNumber: Value(approvalNumber),
      baseMake: Value(baseMake),
      baseModel: Value(baseModel),
      baseSerial: Value(baseSerial),
      baseApprovalPrefix: Value(baseApprovalPrefix),
      baseApprovalNumber: Value(baseApprovalNumber),
      capacity: Value(capacity),
      capacityUnit: Value(capacityUnit),
      division: Value(division),
      numberOfLoadCells: Value(numberOfLoadCells),
      numberOfSections: Value(numberOfSections),
      loadCellModel: Value(loadCellModel),
      loadCellCapacity: Value(loadCellCapacity),
      loadCellCapacityUnit: Value(loadCellCapacityUnit),
      notes: Value(notes ?? ''),
      legalForTrade: Value(isLegalForTrade),
      inspectionExpiry: Value(inspectionExpiry),
      sealStatus: Value(sealStatus),
      inspectionResult: Value(inspectionResult),
    );

    final scaleDao = ref.read(scaleDaoProvider);
    final newId = await scaleDao.insertScale(newScale);
    final insertedScale = await scaleDao.getScaleById(newId);

    selectedScale = insertedScale;
    isCreatingNewScale = false;
    notifyListeners();
    return newId;
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
      final wo = selectedWorkOrder!;
      final cap = double.tryParse(capacityController.text);
      final div = double.tryParse(divisionController.text);
      final lcCount = int.tryParse(loadCellsController.text);
      final sections = int.tryParse(sectionsController.text);
      final lcCap = double.tryParse(loadCellCapacityController.text);

      if (cap == null || div == null || lcCount == null || sections == null || lcCap == null) {
        debugPrint('❌ Invalid scale input values');
        return false;
      }

      if (validateApprovalNumber(indicatorApprovalCodeController.text) != null ||
          validateApprovalNumber(baseApprovalCodeController.text) != null) {
        debugPrint('❌ Invalid approval number format');
        return false;
      }

      await createNewScale(
        customerId: wo.customerId,
        configuration: configuration,
        scaleType: selectedScaleType,
        subtype: selectedSubtype,
        customTypeDescription: customTypeDescription,
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
        capacity: cap,
        capacityUnit: capacityUnit,
        division: div,
        numberOfLoadCells: lcCount,
        numberOfSections: sections,
        loadCellModel: loadCellModelController.text,
        loadCellCapacity: lcCap,
        loadCellCapacityUnit: loadCellCapacityUnit,
        notes: scaleNotesController.text,
      );

      if (selectedScale == null) {
        debugPrint('❌ Failed to create scale');
        return false;
      }
    }

    if (selectedScale == null) {
      debugPrint('❌ selectedScale is null');
      return false;
    }

    final dao = ref.read(serviceReportDaoProvider);
    selectedServiceReportId = await dao.insertReport(ServiceReportsCompanion(
      workOrderId: Value(selectedWorkOrder!.id),
      scaleId: Value(selectedScale!.id),
      reportType: Value(reportType),
      notes: Value(notes ?? ''),
    ));

    debugPrint('✅ Service Report saved with ID: $selectedServiceReportId');

    notifyListeners();
    return true;
  }

  void clear() {
    selectedWorkOrder = null;
    selectedScale = null;
    reportType = 'Standard';
    notes = null;
    editMode = false;
    isCreatingNewScale = false;
    selectedServiceReportId = null;
    scaleNotesController.clear();
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
