// File: lib/utils/sanitizer.dart

/// Removes all non-numeric characters except periods and hyphens.
/// Useful for cleaning numeric inputs before parsing.
String sanitizeNumberInput(String input) {
  return input.replaceAll(RegExp(r'[^\d.-]'), '');
}

/// Tries to parse a cleaned string into a double.
/// Returns null if parsing fails.
double? parseDouble(String input) {
  final cleaned = sanitizeNumberInput(input);
  return double.tryParse(cleaned);
}

/// Tries to parse a cleaned string into an int.
/// Returns null if parsing fails.
int? parseInt(String input) {
  final cleaned = sanitizeNumberInput(input);
  return int.tryParse(cleaned);
}
