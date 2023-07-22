import 'package:flutter/material.dart';

class BorderWithHeader extends StatelessWidget {
  const BorderWithHeader({
    required this.title,
    required this.child,
    super.key,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: title,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: child,
    );
  }
}
