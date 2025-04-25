// File: lib/controllers/work_order_form_state.dart

import 'package:drift/drift.dart';
import '../data/tables/work_orders.dart';

class WorkOrderFormState {
  final WorkOrdersCompanion formData;
  final bool sameBilling;
  final bool editCustomerFields;

  WorkOrderFormState({
    this.formData = const WorkOrdersCompanion(),
    this.sameBilling = true,
    this.editCustomerFields = false,
  });

  WorkOrderFormState copyWith({
    WorkOrdersCompanion? formData,
    bool? sameBilling,
    bool? editCustomerFields,
  }) {
    return WorkOrderFormState(
      formData: formData ?? this.formData,
      sameBilling: sameBilling ?? this.sameBilling,
      editCustomerFields: editCustomerFields ?? this.editCustomerFields,
    );
  }
}
