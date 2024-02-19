import 'package:flutter/material.dart';

/// {@template app_button}
/// Button with text displayed in the application.
/// {@endtemplate}
class AppDropdown<T> extends StatelessWidget {
  /// {@macro app_button}
  const AppDropdown({
    required this.selectedValue,
    required this.values,
    required this.onChanged,
    super.key,
  });

  /// [String] values in the dropdown.
  final Map<T, String> values;
  final T selectedValue;

  /// Called when the value of the dropdown should change.
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    final items = values.entries.map((entry) {
      return DropdownMenuItem<T>(
        value: entry.key,
        child: Text(entry.value),
      );
    }).toList();

    return DropdownButton<T>(
      value: selectedValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: onChanged,
      items: items,
    );
  }
}
