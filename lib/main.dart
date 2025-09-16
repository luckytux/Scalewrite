// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Pages
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/admin/admin_page.dart';
import 'pages/admin/manage_users_page.dart';
import 'pages/admin/view_unsynced_work_orders_page.dart';
import 'pages/admin/manage_inventory_page.dart';

// Providers & DB
import 'providers/drift_providers.dart';
import 'data/database.dart';

// Seeders (update if in /dev/ or /seed/)
import 'dev/seed_users.dart';
import 'dev/seed_inventory.dart';
import 'dev/seed_test_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();
  final db = container.read(databaseProvider);

  await _initializeSeedIfNeeded(db);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

/// Seeds the database only if no work orders are found
Future<void> _initializeSeedIfNeeded(AppDatabase db) async {
  final count = await db.workOrderDao.countWorkOrders();

  if (count == 0) {
    debugPrint('🌱 No data found, seeding DB...');
    await seedUsers(db);
    await seedInventory(db);
    await seedTestData(db);
    debugPrint('✅ Seeding complete.');
  } else {
    debugPrint('📦 Existing data found. Skipping seed.');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
    );

    return MaterialApp(
      title: 'ScaleWrite',
      theme: theme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/admin': (context) => const AdminPage(),
        '/admin/users': (_) => const ManageUsersPage(),
        '/admin/unsynced': (_) => const ViewUnsyncedWorkOrdersPage(),
        '/admin/inventory': (_) => const ManageInventoryPage(),
      },
    );
  }
}
