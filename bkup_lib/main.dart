// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/home_page.dart';

// Dummy references to force DAO imports for build_runner
import 'data/database.dart';
import 'data/daos/scale_dao.dart';
import 'data/daos/work_order_dao.dart';
import 'data/daos/service_report_dao.dart';

void main() {
  // This forces Drift to include these DAOs in build output
  final _ = [
    AppDatabase().scaleDao,
    AppDatabase().workOrderDao,
    AppDatabase().serviceReportDao,
  ];

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.teal,
        primary: Colors.teal.shade600,
        secondary: Colors.orange.shade300,
      ),
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.teal.shade50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'ScaleWrite',
      theme: theme,
      home: const HomePage(),
    );
  }
}
