import 'package:flutter/material.dart';

class StpChecklistPage extends StatelessWidget {
  const StpChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('STP Checklist - LFT Inspection')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Checklist Items',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildChecklistTile('All labels and markings visible'),
                  _buildChecklistTile('Load cell wiring intact'),
                  _buildChecklistTile('Junction box sealed'),
                  _buildChecklistTile('Power supply stable'),
                  _buildChecklistTile('No corrosion on scale components'),
                  // Add more items here as needed
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save STP checklist and return
                  Navigator.pop(context);
                },
                child: const Text('Save Checklist'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistTile(String title) {
    return CheckboxListTile(
      value: false,
      onChanged: (val) {},
      title: Text(title),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
