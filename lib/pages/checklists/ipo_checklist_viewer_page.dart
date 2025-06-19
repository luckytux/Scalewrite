// File: lib/pages/checklists/ipo_checklist_viewer_page.dart

import 'package:flutter/material.dart';
import '../../data/static/ipo_checklists.dart'; // now includes the map

class IpoChecklistViewerPage extends StatelessWidget {
  final String ipoId;

  const IpoChecklistViewerPage({super.key, required this.ipoId});

  @override
  Widget build(BuildContext context) {
    final checklist = ipoChecklists[ipoId]; // works now

    if (checklist == null) {
      return Scaffold(
        appBar: AppBar(title: Text('Checklist $ipoId')),
        body: const Center(child: Text('Checklist not found')),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(checklist.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: checklist.sections.map((item) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text('• $item', style: TextStyle(fontSize: 16)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
