// File: lib/providers/auth_provider.dart

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/auth_controller.dart';
import '../data/database.dart';
import 'drift_providers.dart'; // ✅ Import the correct singleton!

final authControllerProvider =
    StateNotifierProvider<AuthController, AppUser?>((ref) {
  final userDao = ref.watch(databaseProvider).userDao;
  return AuthController(userDao);
});
