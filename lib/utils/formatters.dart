// File: lib/utils/formatters.dart

import 'package:flutter/services.dart';

/// Canadian Postal Code formatter: A1A 1A1
class PostalCodeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(RegExp(r'\s+'), '').toUpperCase();
    if (text.length > 3) {
      text = '${text.substring(0, 3)} ${text.substring(3)}';
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

/// Canadian postal code validator (no space): A1A1A1
bool isValidCanadianPostalCode(String input) {
  final cleaned = input.replaceAll(RegExp(r'\s+'), '').toUpperCase();
  final pattern = RegExp(r'^[A-Z]\d[A-Z]\d[A-Z]\d$');
  return pattern.hasMatch(cleaned);
}

/// Simple email validation (basic format: *@*.*)
bool isValidEmail(String input) {
  return RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(input);
}

/// Phone number formatter: (999) 999-9999
class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    for (int i = 0; i < digits.length && i < 10; i++) {
      if (i == 0) buffer.write('(');
      if (i == 3) buffer.write(') ');
      if (i == 6) buffer.write('-');
      buffer.write(digits[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
