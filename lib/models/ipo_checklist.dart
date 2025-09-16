// lib/models/ipo_checklist.dart
import 'ipo_section.dart';

class IPOChecklist {
  final String id;
  final String title;
  final List<IPOSection> sections;

  const IPOChecklist({
    required this.id,
    required this.title,
    required this.sections,
  });
}