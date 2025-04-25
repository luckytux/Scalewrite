// File: lib/pages/view_weight_test_page.dart

import 'package:flutter/material.dart';

class ViewWeightTestPage extends StatelessWidget {
  final int serviceReportId;

  const ViewWeightTestPage({super.key, required this.serviceReportId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weight Test Results')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'Weight test results will appear here.\nDrift integration coming soon.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
