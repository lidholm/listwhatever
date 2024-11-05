import 'package:flutter/material.dart';
import 'package:listwhatever/standard/widgets/vStack/x_stack.dart';
import '/standard/constants.dart';

const className = 'HStack';

class HStack extends StatelessWidget {
  const HStack({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.spacing = 10,
    this.spacingPosition = SpacingPosition.between,
    super.key,
  });

  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final double spacing;
  final SpacingPosition spacingPosition;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: mapIndexed(children)
          .expand((c) {
            return [
              spacingBefore(c.$1),
              c.$2,
              spacingBetween(c.$1, children.length),
              spacingAfter(c.$1, children.length),
            ];
          })
          .where((c) => c != null)
          .map((c) => c!)
          .toList(),
    );
  }

  Widget getSpacer() {
    return SizedBox(width: spacing);
  }

  Widget? spacingBefore(int currentIndex) {
    if (currentIndex > 0) return null;

    final w = switch (spacingPosition) {
      SpacingPosition.none => null,
      SpacingPosition.before => getSpacer(),
      SpacingPosition.beforeAndBetween => getSpacer(),
      SpacingPosition.beforeAndBetweenAndAfter => getSpacer(),
      SpacingPosition.between => null,
      SpacingPosition.betweenAndAfter => null,
      SpacingPosition.after => null,
      SpacingPosition.beforeAndAfter => getSpacer(),
    };
    // LoggerHelper.logger.i('$className: Spacer at $currentIndex: $w');
    return w;
  }

  Widget? spacingBetween(int currentIndex, int numberInList) {
    if (currentIndex == 0 && currentIndex == numberInList - 1) return null;

    final w = switch (spacingPosition) {
      SpacingPosition.none => null,
      SpacingPosition.before => null,
      SpacingPosition.beforeAndBetween => getSpacer(),
      SpacingPosition.beforeAndBetweenAndAfter => getSpacer(),
      SpacingPosition.between => getSpacer(),
      SpacingPosition.betweenAndAfter => getSpacer(),
      SpacingPosition.after => null,
      SpacingPosition.beforeAndAfter => null,
    };
    // LoggerHelper.logger.i('$className: Spacer at $currentIndex: $w');
    return w;
  }

  Widget? spacingAfter(int currentIndex, int numberInList) {
    if (currentIndex < numberInList - 1) return null;

    final w = switch (spacingPosition) {
      SpacingPosition.none => null,
      SpacingPosition.before => null,
      SpacingPosition.beforeAndBetween => null,
      SpacingPosition.beforeAndBetweenAndAfter => getSpacer(),
      SpacingPosition.between => null,
      SpacingPosition.betweenAndAfter => getSpacer(),
      SpacingPosition.after => getSpacer(),
      SpacingPosition.beforeAndAfter => getSpacer(),
    };
    // LoggerHelper.logger.i('$className: Spacer at $currentIndex: $w');
    return w;
  }
}
