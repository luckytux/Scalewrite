// File: lib/utils/format_utils.dart

String formatPhoneNumber(String input) {
  final digits = input.replaceAll(RegExp(r'\D'), '');
  if (digits.length == 10) {
    return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
  }
  return input;
}

String formatPostalCode(String input) {
  final code = input.replaceAll(' ', '').toUpperCase();
  if (code.length == 6) {
    return '${code.substring(0, 3)} ${code.substring(3)}';
  }
  return input.toUpperCase();
}
