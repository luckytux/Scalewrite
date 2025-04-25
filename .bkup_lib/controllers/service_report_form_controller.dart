// File: lib/controllers/service_report_form_controller.dart

import 'package:flutter/material.dart';
import 'package:scalewrite_v2/pages/create_work_order_page.dart';
import '../data/tables/scales.dart';
import '../data/tables/work_orders.dart';

class ServiceReportFormController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  CreateWorkOrderPage? selectedWorkOrder;
  Scale? selectedScale;

  String? selectedMainType;
  String? selectedSubtype;
  String? otherType;
  bool configuration = false; // Modular (true) or Complete (false)

  final indicatorMake = TextEditingController();
  final indicatorModel = TextEditingController();
  final indicatorSerial = TextEditingController();
  String approvalPrefix = 'AM';
  final approvalCode = TextEditingController();

  final baseMake = TextEditingController();
  final baseModel = TextEditingController();
  final baseSerial = TextEditingController();
  String baseApprovalPrefix = 'AM';
  final baseApprovalCode = TextEditingController();

  final capacityValue = TextEditingController();
  String capacityUnit = 'kg';
  final division = TextEditingController();
  String divisionUnit = 'kg';

  final numLoadCells = TextEditingController();
  final numSections = TextEditingController();
  final loadCellModel = TextEditingController();
  final loadCellCapacity = TextEditingController();
  String loadCellCapacityUnit = 'kg';

  void setWorkOrder(WorkOrder? wo) {
    selectedWorkOrder = wo;
    notifyListeners();
  }

  void setScale(Scale scale) {
    selectedScale = scale;
    populateFromScale(scale);
    notifyListeners();
  }

  void populateFromScale(Scale scale) {
    selectedMainType = scale.scaleType;
    selectedSubtype = scale.scaleSubtype;
    configuration = scale.configuration;
    indicatorMake.text = scale.indicatorMake;
    indicatorModel.text = scale.indicatorModel;
    indicatorSerial.text = scale.indicatorSerial;
    approvalPrefix = scale.approvalPrefix;
    approvalCode.text = scale.approvalCode;

    baseMake.text = scale.baseMake ?? '';
    baseModel.text = scale.baseModel ?? '';
    baseSerial.text = scale.baseSerial ?? '';
    baseApprovalPrefix = scale.baseApprovalPrefix ?? 'AM';
    baseApprovalCode.text = scale.baseApprovalCode ?? '';

    capacityValue.text = scale.capacityValue.toString();
    capacityUnit = scale.capacityUnit;
    division.text = scale.division.toString();
    divisionUnit = scale.divisionUnit;

    numLoadCells.text = scale.numberOfLoadCells.toString();
    numSections.text = scale.numberOfSections.toString();
    loadCellModel.text = scale.loadCellModel;
    loadCellCapacity.text = scale.loadCellCapacity.toString();
    loadCellCapacityUnit = scale.loadCellCapacityUnit;
  }

  void toggleConfiguration(bool? value) {
    configuration = value ?? false;
    notifyListeners();
  }

  void setMainType(String? value) {
    selectedMainType = value;
    notifyListeners();
  }

  void setSubtype(String? value) {
    selectedSubtype = value;
    notifyListeners();
  }

  void setOtherType(String? value) {
    otherType = value;
    notifyListeners();
  }

  void disposeControllers() {
    for (final c in [
      indicatorMake,
      indicatorModel,
      indicatorSerial,
      approvalCode,
      baseMake,
      baseModel,
      baseSerial,
      baseApprovalCode,
      capacityValue,
      division,
      numLoadCells,
      numSections,
      loadCellModel,
      loadCellCapacity,
    ]) {
      c.dispose();
    }
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
