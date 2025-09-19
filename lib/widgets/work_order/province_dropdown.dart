// File: lib/widgets/work_order/province_dropdown.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProvinceDropdown extends StatefulWidget {
  final TextEditingController controller;
  final bool enabled;

  const ProvinceDropdown({
    super.key,
    required this.controller,
    this.enabled = true,
  });

  @override
  State<ProvinceDropdown> createState() => _ProvinceDropdownState();

  static const Map<String, String> provinceMap = {
    'AB': 'Alberta',
    'BC': 'British Columbia',
    'SK': 'Saskatchewan',
    'MB': 'Manitoba',
    'ON': 'Ontario',
    'QC': 'Quebec',
    'NB': 'New Brunswick',
    'NS': 'Nova Scotia',
    'PE': 'Prince Edward Island',
    'NL': 'Newfoundland and Labrador',
    'YT': 'Yukon',
    'NT': 'Northwest Territories',
    'NU': 'Nunavut',
  };

  static const Map<String, String> _aliasToCode = {
    'alberta': 'AB',
    'british columbia': 'BC',
    'saskatchewan': 'SK',
    'manitoba': 'MB',
    'ontario': 'ON',
    'quebec': 'QC',
    'québec': 'QC',
    'new brunswick': 'NB',
    'nova scotia': 'NS',
    'prince edward island': 'PE',
    'newfoundland and labrador': 'NL',
    'yukon': 'YT',
    'northwest territories': 'NT',
    'nunavut': 'NU',
    'alta': 'AB',
    'bc': 'BC',
    'sask': 'SK',
    'man': 'MB',
    'ont': 'ON',
    'que': 'QC',
    'nb': 'NB',
    'ns': 'NS',
    'pei': 'PE',
    'nfl': 'NL',
    'nl': 'NL',
    'ytn': 'YT',
    'nwt': 'NT',
  };
}

class _ProvinceDropdownState extends State<ProvinceDropdown> {
  String? _currentCode;
  final FocusNode _focusNode = FocusNode(debugLabel: 'ProvinceDropdown');

  @override
  void initState() {
    super.initState();
    _normalizeFromController(defaultIfEmpty: true);
    widget.controller.addListener(_onExternalChange);
  }

  @override
  void didUpdateWidget(covariant ProvinceDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller.removeListener(_onExternalChange);
      _normalizeFromController(defaultIfEmpty: true);
      widget.controller.addListener(_onExternalChange);
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onExternalChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onExternalChange() => _normalizeFromController(defaultIfEmpty: true);

  void _normalizeFromController({bool defaultIfEmpty = false}) {
    final normalized = _normalizeToCode(widget.controller.text, defaultIfEmpty: defaultIfEmpty);
    if (normalized != _currentCode) setState(() => _currentCode = normalized);
    if (widget.controller.text != normalized) widget.controller.text = normalized;
  }

  String _normalizeToCode(String? raw, {bool defaultIfEmpty = false}) {
    final s = (raw ?? '').trim();
    if (s.isEmpty) return defaultIfEmpty ? 'AB' : '';
    final upper = s.toUpperCase();
    if (ProvinceDropdown.provinceMap.containsKey(upper)) return upper;
    final lower = s.toLowerCase();
    final aliasDirect = ProvinceDropdown._aliasToCode[lower];
    if (aliasDirect != null) return aliasDirect;
    final byPrefix = ProvinceDropdown.provinceMap.entries.firstWhere(
      (e) => e.value.toLowerCase().startsWith(lower),
      orElse: () => const MapEntry('', ''),
    );
    if (byPrefix.key.isNotEmpty) return byPrefix.key;
    return defaultIfEmpty ? 'AB' : '';
  }

  KeyEventResult _handleKeyEvent(FocusNode node, KeyEvent event) {
    if (!widget.enabled) return KeyEventResult.ignored;
    if (event is! KeyDownEvent) return KeyEventResult.ignored;

    final key = event.logicalKey;
    if (key == LogicalKeyboardKey.arrowDown ||
        key == LogicalKeyboardKey.arrowRight ||
        key == LogicalKeyboardKey.pageDown) {
      _moveSelection(1);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.arrowUp ||
        key == LogicalKeyboardKey.arrowLeft ||
        key == LogicalKeyboardKey.pageUp) {
      _moveSelection(-1);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.home) {
      _setByIndex(0);
      return KeyEventResult.handled;
    }
    if (key == LogicalKeyboardKey.end) {
      _setByIndex(ProvinceDropdown.provinceMap.length - 1);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  void _moveSelection(int delta) {
    final codes = ProvinceDropdown.provinceMap.keys.toList(growable: false);
    if (codes.isEmpty) return;
    final current = ProvinceDropdown.provinceMap.containsKey(_currentCode) ? _currentCode! : 'AB';
    var idx = codes.indexOf(current);
    if (idx == -1) idx = 0;
    var next = idx + delta;
    next = next.clamp(0, codes.length - 1);
    _setByIndex(next);
  }

  void _setByIndex(int index) {
    final codes = ProvinceDropdown.provinceMap.keys.toList(growable: false);
    if (index < 0 || index >= codes.length) return;
    final code = codes[index];
    setState(() => _currentCode = code);
    widget.controller.text = code;
  }

  @override
  Widget build(BuildContext context) {
    final initial = (ProvinceDropdown.provinceMap.containsKey(_currentCode)) ? _currentCode : 'AB';

    return Focus(
      focusNode: _focusNode,
      onKeyEvent: _handleKeyEvent,
      child: DropdownMenu<String>(
        // 🚫 do NOT pass focusNode here; it causes reparent loops with the Focus wrapper
        enabled: widget.enabled,
        initialSelection: initial,
        onSelected: (code) {
          final normalized = _normalizeToCode(code, defaultIfEmpty: true);
          setState(() => _currentCode = normalized);
          widget.controller.text = normalized;
        },
        label: const Text('Province'),
        dropdownMenuEntries: ProvinceDropdown.provinceMap.entries
            .map((e) => DropdownMenuEntry<String>(value: e.key, label: e.value))
            .toList(),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: widget.enabled ? Colors.teal.shade50 : Colors.grey.shade200,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: widget.enabled ? Colors.teal : Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.teal, width: 2),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
