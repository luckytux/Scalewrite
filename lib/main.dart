// File: lib/main.dart

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'package:scalewrite_v2/pages/admin/price_admin_page.dart';

import 'data/database.dart';
import 'dev/seed_inventory.dart';
import 'dev/seed_test_data.dart';
import 'dev/seed_users.dart';
import 'pages/admin/admin_page.dart';
import 'pages/admin/manage_inventory_page.dart';
import 'pages/admin/manage_users_page.dart';
import 'pages/admin/view_unsynced_work_orders_page.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'providers/drift_providers.dart';

/// Append a line to BOTH (%APPDATA%\ScaleWrite_v2\logs\startup.log)
/// AND a fallback file next to the EXE (startup_local.log).
Future<void> _log(String msg) async {
  final line = '${DateTime.now().toIso8601String()}  $msg\n';

  // A) Roaming AppData (path_provider)
  try {
    final supportDir = await getApplicationSupportDirectory();
    final logDir = Directory(p.join(supportDir.path, 'ScaleWrite_v2', 'logs'));
    await logDir.create(recursive: true);
    final f = File(p.join(logDir.path, 'startup.log'));
    await f.writeAsString(line, mode: FileMode.append);
  } catch (_) {
    // ignore
  }

  // B) Fallback next to EXE (works even if path_provider hiccups)
  try {
    final exeDir = Directory.current;
    final f2 = File(p.join(exeDir.path, 'startup_local.log'));
    await f2.writeAsString(line, mode: FileMode.append);
  } catch (_) {
    // ignore
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _log('main() entered');

  // Capture framework errors (Flutter layer)
  FlutterError.onError = (FlutterErrorDetails details) async {
    FlutterError.dumpErrorToConsole(details);
    await _log('FlutterError: ${details.exceptionAsString()}');
    if (details.stack != null) {
      await _log(details.stack.toString());
    }
  };

  // Also catch uncaught async errors at the engine boundary (Flutter 3.3+)
  // Return true to indicate we've handled it.
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    // Fire-and-forget; don't block the handler.
    // ignore: discarded_futures
    _log('PlatformDispatcher error: $error\n$stack');
    return true;
  };

  // Route all prints & errors through a zone so we get breadcrumbs in logs.
  final zoneSpec = ZoneSpecification(
    print: (self, parent, zone, line) {
      parent.print(zone, line);
      // ignore: discarded_futures
      _log('print: $line');
    },
  );

  // Mirror debugPrint to the log as well.
  debugPrint = (String? message, {int? wrapWidth}) {
    if (message != null) {
      // ignore: discarded_futures
      _log('debug: $message');
    }
    if (kDebugMode) {
      // Still show in console when running with flutter run
      // (wrapWidth left default).
      // ignore: avoid_print
      print(message);
    }
  };

  await runZonedGuarded(() async {
    final container = ProviderContainer();
    final db = container.read(databaseProvider);
    await _log('DB instance acquired');

    await _initializeSeedIfNeeded(db);
    await _log('Seeding check complete');

    runApp(
      UncontrolledProviderScope(
        container: container,
        child: const MyApp(),
      ),
    );
  }, (Object error, StackTrace stack) async {
    await _log('Uncaught zone error: $error');
    await _log(stack.toString());
  });
}

/// Seeds the database only if no work orders are found
Future<void> _initializeSeedIfNeeded(AppDatabase db) async {
  final count = await db.workOrderDao.countWorkOrders();

  if (count == 0) {
    debugPrint('🌱 No data found, seeding DB...');
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
        '/admin/prices': (_) => const PriceAdminPage(),
      },
    );
  }
}
