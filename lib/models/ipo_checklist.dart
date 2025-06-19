// File: lib/models/ipo_checklist.dart

class IPOChecklist {
  final String id;         // e.g., IPO-1
  final String title;      // e.g., "General Requirements"
  final List<String> sections;

  const IPOChecklist({
    required this.id,
    required this.title,
    required this.sections,
  });
}
