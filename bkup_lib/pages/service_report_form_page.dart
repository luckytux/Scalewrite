import 'package:flutter/material.dart';
import 'package:scalewrite_v2/forms/checklists/stp_checklist_form.dart' as checklist;
import 'package:scalewrite_v2/forms/inspections/lft_inspection_page.dart';
import 'package:scalewrite_v2/forms/inspections/bulk_inspection_form.dart';
import 'package:scalewrite_v2/forms/weight/weight_test_form.dart';
import 'package:scalewrite_v2/models/service_report.dart';

class ServiceReportFormsPage extends StatelessWidget {
  final ServiceReport serviceReport;

  const ServiceReportFormsPage({super.key, required this.serviceReport});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Service Report Forms')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildFormTile(
              context,
              icon: Icons.check_circle_outline,
              label: 'LFT Inspection',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const LftInspectionPage(),
                ),
              ),
            ),
            _buildFormTile(
              context,
              icon: Icons.list_alt,
              label: 'STP Checklist (LFT)',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const checklist.StpChecklistPage(),
                ),
              ),
            ),
            _buildFormTile(
              context,
              icon: Icons.scale,
              label: 'Bulk Inspection',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const BulkInspectionPage(),
                ),
              ),
            ),
            _buildFormTile(
              context,
              icon: Icons.list_alt,
              label: 'STP Checklist (Bulk)',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const checklist.StpChecklistPage(),
                ),
              ),
            ),
            _buildFormTile(
              context,
              icon: Icons.fitness_center,
              label: 'Weight Test',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => WeightTestPage(report: serviceReport),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormTile(BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        tileColor: Colors.grey.shade200,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        leading: Icon(icon, size: 30, color: Colors.teal),
        title: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        onTap: onTap,
      ),
    );
  }
}
