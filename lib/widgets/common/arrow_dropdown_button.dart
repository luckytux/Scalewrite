// File: lib/widgets/common/arrow_dropdown_button.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A keyboard-friendly dropdown with a DropdownButtonFormField
/// so it matches TextFormField styling 1:1.
/// - Arrow ↑/↓ changes selection when the field is focused.
/// - PageUp/PageDown jump by 5.
/// - Home/End go to first/last.
/// Keeps a DropdownButtonFormField-like API.
class ArrowDropdownButton<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? selected;
  final ValueChanged<T?>? onChanged;
  final bool enabled;
  final InputDecoration? decoration;

  const ArrowDropdownButton({
    super.key,
    required this.items,
    required this.selected,
    required this.onChanged,
    this.enabled = true,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    // Build the dropdown as usual…
    final field = DropdownButtonFormField<T>(
      value: selected,
      items: items,
      onChanged: enabled ? onChanged : null,
      decoration: (decoration ??
              InputDecoration(
                filled: true,
                fillColor: enabled ? Colors.teal.shade50 : Colors.grey.shade200,
              ))
          .copyWith(
        // make sure height/padding match your TextFormFields
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        constraints: const BoxConstraints(minHeight: 56),
      ),
      borderRadius: BorderRadius.circular(
        _borderRadiusFrom(decoration?.border) ?? 12,
      ),
    );

    // …and wrap with Focus to add arrow-key cycling.
    return Focus(
      canRequestFocus: enabled,
      onKeyEvent: (node, event) {
        if (!enabled || onChanged == null) return KeyEventResult.ignored;
        if (event is! KeyDownEvent) return KeyEventResult.ignored;

        final key = event.logicalKey;
        final values = items.map((e) => e.value).toList();
        if (values.isEmpty) return KeyEventResult.ignored;

        int idx = values.indexOf(selected);
        idx = idx < 0 ? 0 : idx;

        int? newIdx;
        if (key == LogicalKeyboardKey.arrowDown) {
          newIdx = (idx + 1).clamp(0, values.length - 1);
        } else if (key == LogicalKeyboardKey.arrowUp) {
          newIdx = (idx - 1).clamp(0, values.length - 1);
        } else if (key == LogicalKeyboardKey.pageDown) {
          newIdx = (idx + 5).clamp(0, values.length - 1);
        } else if (key == LogicalKeyboardKey.pageUp) {
          newIdx = (idx - 5).clamp(0, values.length - 1);
        } else if (key == LogicalKeyboardKey.home) {
          newIdx = 0;
        } else if (key == LogicalKeyboardKey.end) {
          newIdx = values.length - 1;
        }

        if (newIdx != null && newIdx != idx) {
          onChanged!(values[newIdx]);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: field,
    );
  }

  double? _borderRadiusFrom(InputBorder? border) {
    if (border is OutlineInputBorder) {
      return border.borderRadius.topLeft.x;
    }
    return null;
  }
}
