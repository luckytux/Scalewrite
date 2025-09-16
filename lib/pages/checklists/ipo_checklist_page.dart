// File: lib/pages/checklists/ipo_checklist_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/ipo_section.dart';
import '../../providers/drift_providers.dart';

class IPOChecklistPage extends ConsumerStatefulWidget {
  final String ipoType;
  final int serviceReportId;
  final String ipoTitle;
  final List<IPOSection> sections;

  const IPOChecklistPage({
    super.key,
    required this.ipoType,
    required this.serviceReportId,
    required this.ipoTitle,
    required this.sections,
  });

  @override
  ConsumerState<IPOChecklistPage> createState() => _IPOChecklistPageState();
}

class _IPOChecklistPageState extends ConsumerState<IPOChecklistPage> {
  late Map<String, Map<String, bool>> checklistState;

  @override
  void initState() {
    super.initState();
    checklistState = {
      for (var section in widget.sections)
        section.title: {
          for (var item in section.items) item: false,
        }
    };
  }

  void _toggleAllInSection(String sectionTitle, bool value) {
    setState(() {
      checklistState[sectionTitle]?.updateAll((key, _) => value);
    });
  }

  void _toggleItem(String sectionTitle, String item, bool value) {
    setState(() {
      checklistState[sectionTitle]?[item] = value;
    });
  }

  Future<void> _saveChecklist() async {
    final db = ref.read(databaseProvider);

    await db.serviceReportDao.updateIpoState(
      reportId: widget.serviceReportId,
      ipoStateJson: {
        widget.ipoType: checklistState,
      },
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Checklist saved.')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.ipoTitle)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...widget.sections.map((section) {
            final items = checklistState[section.title] ?? {};
            final allChecked = items.values.every((val) => val);

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: allChecked,
                          onChanged: (val) => _toggleAllInSection(section.title, val ?? false),
                        ),
                        Expanded(
                          child: Text(
                            section.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ...section.items.map((item) {
                      final checked = checklistState[section.title]?[item] ?? false;
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(item),
                        value: checked,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (val) => _toggleItem(section.title, item, val ?? false),
                      );
                    }),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Save Checklist'),
              onPressed: _saveChecklist,
            ),
          ),
        ],
      ),
    );
  }
}
