// File: lib/providers/customer_form_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/customer_form_controller.dart';
import 'drift_providers.dart';

final customerFormProvider = ChangeNotifierProvider<CustomerFormController>((ref) {
  final dao = ref.read(customerDaoProvider);
  return CustomerFormController(dao);
});
