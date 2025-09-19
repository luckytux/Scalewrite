// File: lib/pages/home_page.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:scalewrite_v2/pages/create_work_order_page.dart';
import 'package:scalewrite_v2/pages/create_service_report_page.dart';
import 'package:scalewrite_v2/pages/create_customer_page.dart';
import 'package:scalewrite_v2/pages/view_work_orders_page.dart';
import 'package:scalewrite_v2/pages/admin/admin_page.dart';

import 'package:scalewrite_v2/providers/test_data_loader_provider.dart';
import 'package:scalewrite_v2/providers/customer_list_provider.dart';
import 'package:scalewrite_v2/providers/auth_provider.dart';

// ⬇️ Sync preview UI
import 'package:scalewrite_v2/sync/sync_ui.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final isAdmin = ref.watch(authControllerProvider)?.isAdmin ?? false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ScaleWrite Home'),
        actions: [
          IconButton(
            tooltip: 'Sync',
            icon: const Icon(Icons.sync),
            onPressed: () => showSyncPreviewSheet(context, ref),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              if (kDebugMode)
                ElevatedButton.icon(
                  onPressed: () async {
                    final loader = ref.read(testDataLoaderProvider);
                    final result = await loader.loadTestData();
                    if (!context.mounted) return;

                    ref.invalidate(customerListProvider);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(result ? '✅ Test Data Loaded' : '❌ Failed to Load'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Load Test Data'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade800,
                    foregroundColor: Colors.white,
                  ),
                ),

              const SizedBox(height: 16),
              const Text(
                'Create',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildTileButton(
                    context,
                    icon: Icons.add_business,
                    label: 'Customer',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateCustomerPage()),
                    ),
                  ),
                  _buildTileButton(
                    context,
                    icon: Icons.add_box,
                    label: 'Work Order',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const CreateWorkOrderPage()),
                    ),
                  ),
                  _buildTileButton(
                    context,
                    icon: Icons.receipt_long,
                    label: 'Service Report',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CreateServiceReportPage(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const Text(
                'View',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                  _buildTileButton(
                    context,
                    icon: Icons.assignment,
                    label: 'Work Orders',
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ViewWorkOrdersPage()),
                    ),
                  ),

                  // ⬇️ NEW: Big, obvious sync tile
                  _buildTileButton(
                    context,
                    icon: Icons.sync,
                    label: 'Sync Now',
                    onPressed: () => showSyncPreviewSheet(context, ref),
                  ),

                  if (isAdmin)
                    _buildTileButton(
                      context,
                      icon: Icons.admin_panel_settings,
                      label: 'Admin Panel',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const AdminPage()),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTileButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
