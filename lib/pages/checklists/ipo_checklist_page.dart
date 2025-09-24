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
  /// sectionTitle -> (item -> checked)
  late Map<String, Map<String, bool>> checklistState;

  @override
  void initState() {
    super.initState();
    // Default all items to TRUE; we only persist exceptions (false) on save.
    checklistState = {
      for (final section in widget.sections)
        section.title: {
          for (final item in section.items) item: true,
        }
    };
  }

  void _toggleAllInSection(String sectionTitle, bool value) {
    setState(() {
      checklistState[sectionTitle]?.updateAll((_, __) => value);
    });
  }

  void _toggleItem(String sectionTitle, String item, bool value) {
    setState(() {
      checklistState[sectionTitle]?[item] = value;
    });
  }

  /// Build a dotted-path list for items explicitly FALSE:
  /// e.g. ["Trade Approval & Verification.Device is sealed (NoA, STP-4)", ...]
  List<String> _collectFalseMarkers(Map<String, Map<String, bool>> state) {
    final out = <String>[];
    state.forEach((section, items) {
      items.forEach((item, checked) {
        if (checked == false) {
          out.add('$section.$item');
        }
      });
    });
    return out;
  }

  Future<void> _saveChecklist() async {
    final db = ref.read(databaseProvider);

    final exceptions = _collectFalseMarkers(checklistState);

    final payload = <String, dynamic>{
      'schemaVersion': 1,
      'template': widget.ipoType,
      'completed': true,
      'exceptions': exceptions, // empty list if everything stayed true
      'ts': DateTime.now().toIso8601String(),
    };

    await db.serviceReportDao.updateIpoState(
      reportId: widget.serviceReportId,
      ipoStateJson: payload,
    );

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Inspection checklist saved.')),
    );
    Navigator.of(context).pop(); // back to the Service Report page
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
            final allChecked = items.isNotEmpty && items.values.every((v) => v);

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
                          onChanged: (val) =>
                              _toggleAllInSection(section.title, val ?? false),
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
                      final checked =
                          checklistState[section.title]?[item] ?? true;
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(item),
                        value: checked,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (val) =>
                            _toggleItem(section.title, item, val ?? true),
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
