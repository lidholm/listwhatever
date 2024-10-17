import 'package:flutter/material.dart';
import 'package:listwhatever/standard/widgets/vStack/h_stack.dart';
import 'package:listwhatever/standard/widgets/vStack/v_stack.dart';

enum AxisDirection {
  horizontal,
  vertical,
}

enum SpacingPosition {
  none,
  before,
  beforeAndBetween,
  beforeAndBetweenAndAfter,
  between,
  betweenAndAfter,
  after,
  beforeAndAfter,
}

class XStack extends StatelessWidget {
  const XStack({
    required this.children,
    this.axisDirection = AxisDirection.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 10,
    this.spacingPosition = SpacingPosition.between,
    super.key,
  });
  final List<Widget> children;
  final AxisDirection axisDirection;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;
  final SpacingPosition spacingPosition;

  @override
  Widget build(BuildContext context) {
    return switch (axisDirection) {
      AxisDirection.horizontal => HStack(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          spacing: spacing,
          spacingPosition: spacingPosition,
          children: children,
        ),
      AxisDirection.vertical => VStack(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          spacing: spacing,
          spacingPosition: spacingPosition,
          children: children,
        ),
    };
  }
}
