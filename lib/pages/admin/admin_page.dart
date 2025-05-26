// File: lib/pages/admin/admin_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AdminPage extends ConsumerWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('🛠️ AdminPage is building...');

    return Scaffold(
      appBar: AppBar(title: const Text('Admin Dashboard')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Text(
                '✅ Admin Dashboard Loaded',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 20,
                children: [
                  _buildTile(
                    context,
                    icon: Icons.people,
                    label: 'Manage Users',
                    onPressed: () {
                      debugPrint('➡️ Navigating to ManageUsersPage');
                      Navigator.pushNamed(context, '/admin/users');
                    },
                  ),
                  _buildTile(
                    context,
                    icon: Icons.sync_problem,
                    label: 'Unsynced Work Orders',
                    onPressed: () {
                      debugPrint('➡️ Navigating to ViewUnsyncedWorkOrdersPage');
                      Navigator.pushNamed(context, '/admin/unsynced');
                    },
                  ),
                  _buildTile(
                    context,
                    icon: Icons.inventory,
                    label: 'Manage Inventory',
                    onPressed: () {
                      debugPrint('➡️ Navigating to ManageInventoryPage');
                      Navigator.pushNamed(context, '/admin/inventory');
                    },
                  ),
                  _buildTile(
                    context,
                    icon: Icons.exit_to_app,
                    label: 'Back to Home',
                    onPressed: () {
                      debugPrint('↩️ Returning to Home');
                      Navigator.pushReplacementNamed(context, '/home');
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

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: 160,
      height: 160,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48),
            const SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
