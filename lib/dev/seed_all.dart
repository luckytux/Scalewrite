// File: lib/dev/seed_all.dart
// File: lib/dev/seed_all.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/drift_providers.dart';
import 'seed_users.dart';
import 'seed_inventory.dart';
import 'seed_test_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final db = container.read(databaseProvider);

  await seedUsers(db);
  await seedInventory(db);
  await seedTestData(db);

  await db.close();
  print('👋 Done seeding everything.');
}
