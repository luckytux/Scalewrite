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

  WorkOrder? selectedWorkOrder;
  Scale? selectedScale;
  String reportType = 'Standard';
  String? notes;
  bool editMode = false;

  bool isCreatingNewScale = false;

  ServiceReportFormController(this.ref);

  void setWorkOrder(WorkOrder? wo) {
    selectedWorkOrder = wo;
    selectedScale = null;
    notifyListeners();
  }

  void setScale(Scale? scale) {
    selectedScale = scale;
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

  Future<int?> createNewScale({
    required int customerId,
    required bool configuration,
    required String scaleType,
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
  }) async {
    final newScale = ScalesCompanion(
      customerId: Value(customerId),
      configuration: Value(configuration),
      scaleType: Value(scaleType),
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
    if (!formKey.currentState!.validate() || selectedWorkOrder == null || selectedScale == null) {
      return false;
    }

    final dao = ref.read(serviceReportDaoProvider);
    await dao.insertReport(ServiceReportsCompanion(
      workOrderId: Value(selectedWorkOrder!.id),
      scaleId: Value(selectedScale!.id),
      reportType: Value(reportType),
      notes: Value(notes ?? ''),
    ));

    return true;
  }
}
