// File: lib/controllers/service_report_form_controller.dart

import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import '../data/database.dart';
import '../providers/drift_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServiceReportController extends ChangeNotifier {
  final Ref ref;

  ServiceReportController(this.ref);

  // Work order and scale selection
  int? selectedWorkOrderId;
  int? selectedScaleId;

  // Whether we're creating a new scale
  bool isCreatingNewScale = false;

  void setIsCreatingNewScale(bool value) {
    isCreatingNewScale = value;
    notifyListeners();
  }

  void setSelectedWorkOrder(int id) {
    selectedWorkOrderId = id;
    notifyListeners();
  }

  void setSelectedScale(int? id) {
    selectedScaleId = id;
    notifyListeners();
  }

  /// Call this when the "Save Service Report" button is pressed
  /// It will insert the scale first (if new), then proceed
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
      customerId: drift.Value(customerId),
      configuration: drift.Value(configuration),
      scaleType: drift.Value(scaleType),
      indicatorMake: drift.Value(indicatorMake),
      indicatorModel: drift.Value(indicatorModel),
      indicatorSerial: drift.Value(indicatorSerial),
      approvalPrefix: drift.Value(approvalPrefix),
      approvalNumber: drift.Value(approvalNumber),
      baseMake: drift.Value(baseMake),
      baseModel: drift.Value(baseModel),
      baseSerial: drift.Value(baseSerial),
      baseApprovalPrefix: drift.Value(baseApprovalPrefix),
      baseApprovalNumber: drift.Value(baseApprovalNumber),
      capacity: drift.Value(capacity),
      capacityUnit: drift.Value(capacityUnit),
      division: drift.Value(division),
      numberOfLoadCells: drift.Value(numberOfLoadCells),
      numberOfSections: drift.Value(numberOfSections),
      loadCellModel: drift.Value(loadCellModel),
      loadCellCapacity: drift.Value(loadCellCapacity),
      loadCellCapacityUnit: drift.Value(loadCellCapacityUnit),
    );

    final newScaleId = await ref.read(scaleDaoProvider).insertScale(newScale);
    selectedScaleId = newScaleId;
    isCreatingNewScale = false;
    notifyListeners();
    return newScaleId;
  }
}
