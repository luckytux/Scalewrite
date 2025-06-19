// File: lib/pages/checklists/ipo_checklist_page.dart

import 'package:flutter/material.dart';

class IPOChecklistPage extends StatelessWidget {
  final String ipoTitle;
  final List<IPOSection> sections;

  const IPOChecklistPage({
    super.key,
    required this.ipoTitle,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(ipoTitle)),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: sections.map((section) {
            return Container(
              width: 300,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(section.title,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 12),
                    ...section.items.map((item) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_box_outline_blank, size: 20),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(item,
                                  style: const TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class IPOSection {
  final String title;
  final List<String> items;

  IPOSection({required this.title, required this.items});
}
