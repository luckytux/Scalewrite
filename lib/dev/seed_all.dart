// File: lib/dev/seed_all.dart

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/drift_providers.dart';
import '../data/database.dart';
import 'seed_users.dart';
import 'seed_inventory.dart';
import 'seed_test_data.dart';

Future<void> seedAll(AppDatabase db) async {
  await seedUsers(db);
  await seedInventory(db);
  await seedTestData(db);
  print('✅ Done seeding everything.');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  final db = container.read(databaseProvider);

  await seedAll(db);
  await db.close();

  print('👋 Manual seeding completed.');
}
