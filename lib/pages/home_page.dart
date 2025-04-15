// File: lib/pages/home_page.dart
import 'package:flutter/material.dart';

// Working imports
import 'package:scalewrite_v2/pages/create_work_order_page.dart';

// Commented out until those files are restored or reconnected
// import 'package:scalewrite_v2/pages/create_service_report_page.dart';
// import 'package:scalewrite_v2/pages/view_reports_page.dart';
// import 'package:scalewrite_v2/forms/weight/weight_test_form.dart';
// import 'package:scalewrite_v2/pages/service_report_form_page.dart';
// import 'package:scalewrite_v2/pages/work_order_detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScaleWrite Home')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
    );
  }

  Widget _buildTileButton(BuildContext context,
      {required IconData icon,
      required String label,
      required VoidCallback onPressed}) {
    return SizedBox(
      width: 120,
      height: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
