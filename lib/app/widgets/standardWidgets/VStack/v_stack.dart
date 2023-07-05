import 'package:flutter/material.dart';
import 'package:listanything/app/helpers/constants.dart';

class VStack extends StatelessWidget {
  const VStack({
    required this.children,
    this.alignment = HorizontalAlignment.center,
    this.spacing = 10,
    super.key,
  });
  final List<Widget> children;
  final HorizontalAlignment alignment;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment.columnAlignment,
      mainAxisSize: MainAxisSize.min,
      children: mapIndexed(children).expand((c) {
        return [
          c.value,
          if (c.key != children.length - 1)
            SizedBox(
              height: spacing,
            )
        ];
      }).toList(),
    );
  }
}

enum HorizontalAlignment {
  leading(CrossAxisAlignment.start),
  center(CrossAxisAlignment.center),
  trailing(CrossAxisAlignment.end);

  const HorizontalAlignment(
    this.columnAlignment,
  );
  final CrossAxisAlignment columnAlignment;
}
