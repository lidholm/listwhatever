import 'package:flutter/material.dart';
import '/standard/constants.dart';

import 'v_stack.dart';

class HStack extends StatelessWidget {

  const HStack({
    required this.children,
    this.horizontalAlignment = HorizontalAlignment.center,
    this.verticalAlignment = VerticalAlignment.center,
    this.spacing = 10,
    super.key,
  });
  final List<Widget> children;
  final VerticalAlignment verticalAlignment;
  final HorizontalAlignment horizontalAlignment;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: horizontalAlignment.alignmentForRow,
      mainAxisAlignment: verticalAlignment.alignmentForRow,
      mainAxisSize: MainAxisSize.min,
      children: mapIndexed(children).expand((c) {
        return [
          c.$2,
          if (c.$1 != children.length - 1)
            SizedBox(
              width: spacing,
            ),
        ];
      }).toList(),
    );
  }
}
