// File: lib/pages/home_page.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scalewrite_v2/pages/create_work_order_page.dart';
import 'package:scalewrite_v2/providers/test_data_loader_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScaleWrite Home')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),

              // Debug-only button for loading test data
              if (kDebugMode)
                ElevatedButton.icon(
                  onPressed: () async {
                    final loader = ref.read(testDataLoaderProvider);
                    final result = await loader.loadTestData();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(result ? '✅ Data Loaded' : '❌ Failed')),
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Create Customer - Coming soon')),
                      );
                    },
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Create Service Report - Coming soon')),
                      );
                    },
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
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Work Orders - Coming soon')),
                      );
                    },
                  ),
                  _buildTileButton(
                    context,
                    icon: Icons.article,
                    label: 'Service Reports',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Service Reports - Coming soon')),
                      );
                    },
                  ),
                  _buildTileButton(
                    context,
                    icon: Icons.scale,
                    label: 'Weight Tests',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Weight Tests - Coming soon')),
                      );
                    },
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
