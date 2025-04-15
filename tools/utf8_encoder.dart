// File: tools/utf8_encoder.dart
import 'dart:convert';
import 'dart:io';

void main() async {
  final dir = Directory('lib'); // Change to your target folder
  final dartFiles = await dir
      .list(recursive: true)
      .where((entity) => entity is File && entity.path.endsWith('.dart'))
      .cast<File>()
      .toList();

  for (final file in dartFiles) {
    try {
      final bytes = await file.readAsBytes();
      final content = const Utf8Decoder(allowMalformed: true).convert(bytes);
      await file.writeAsString(content, encoding: utf8);
      print('Re-encoded: ${file.path}');
    } catch (e) {
      print('Failed to encode ${file.path}: $e');
    }
  }
}
