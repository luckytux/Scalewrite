// File: lib/providers/work_order_form_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/database.dart';
import '../controllers/work_order_form_controller.dart';
import 'drift_providers.dart';

final workOrderFormProvider = ChangeNotifierProvider<WorkOrderFormController>((ref) {
  final workOrderDao = ref.read(workOrderDaoProvider);
  final customerDao = ref.read(customerDaoProvider);
  final contactDao = ref.read(contactDaoProvider); // <-- Added this line
  return WorkOrderFormController(workOrderDao, customerDao, contactDao); // <-- Updated constructor
});
