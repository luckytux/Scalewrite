// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/pages/login_page.dart';
import 'package:scalewrite_v2/pages/home_page.dart';
import 'package:scalewrite_v2/pages/admin/admin_page.dart';
import 'package:scalewrite_v2/pages/admin/manage_users_page.dart';
import 'package:scalewrite_v2/pages/admin/view_unsynced_work_orders_page.dart';
import "package:scalewrite_v2/pages/admin/manage_inventory_page.dart"; // <-- Add this import

void main() {
  runApp(const ProviderScope(child: MyApp()));
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
        '/admin/inventory': (_) => const ManageInventoryPage(), // <- Add this line
      },
    );
  }
}
