import 'package:flutter/material.dart';
import '/standard/constants.dart';

class VStack extends StatelessWidget {

  const VStack({
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
    return Column(
      crossAxisAlignment: verticalAlignment.alignmentForColumn,
      mainAxisAlignment: horizontalAlignment.alignmentForColumn,
      mainAxisSize: MainAxisSize.min,
      children: mapIndexed(children).expand((c) {
        return [
          c.$2,
          if (c.$1 != children.length - 1)
            SizedBox(
              height: spacing,
            ),
        ];
      }).toList(),
    );
  }
}

enum HorizontalAlignment {
  leading,
  center,
  trailing;
}

extension HorizontalAlignmentExtension on HorizontalAlignment {
  MainAxisAlignment get alignmentForColumn {
    return switch (this) {
      HorizontalAlignment.leading => MainAxisAlignment.start,
      HorizontalAlignment.center => MainAxisAlignment.center,
      HorizontalAlignment.trailing => MainAxisAlignment.end,
    };
  }
  CrossAxisAlignment get alignmentForRow {
    return switch (this) {
      HorizontalAlignment.leading => CrossAxisAlignment.start,
      HorizontalAlignment.center => CrossAxisAlignment.center,
      HorizontalAlignment.trailing => CrossAxisAlignment.end,
    };
  }
}

enum VerticalAlignment {
  leading,
  center,
  trailing;
}

extension VerticalAlignmentExtension on VerticalAlignment {
  CrossAxisAlignment get alignmentForColumn {
    return switch (this) {
      VerticalAlignment.leading => CrossAxisAlignment.start,
      VerticalAlignment.center => CrossAxisAlignment.center,
      VerticalAlignment.trailing => CrossAxisAlignment.end,
    };
  }
  MainAxisAlignment get alignmentForRow {
    return switch (this) {
      VerticalAlignment.leading => MainAxisAlignment.start,
      VerticalAlignment.center => MainAxisAlignment.center,
      VerticalAlignment.trailing => MainAxisAlignment.end,
    };
  }
}
