// File: lib/models/ipo_section.dart

class IPOSection {
  final String title;
  final List<String> items;
  final List<bool> itemStates;

  IPOSection({
    required this.title,
    required this.items,
  }) : itemStates = List<bool>.filled(items.length, false);

  bool get isAllChecked =>
      itemStates.isNotEmpty && itemStates.every((checked) => checked);

  void toggleAll(bool checked) {
    for (var i = 0; i < itemStates.length; i++) {
      itemStates[i] = checked;
    }
  }
}
