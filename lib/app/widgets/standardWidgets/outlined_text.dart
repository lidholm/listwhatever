import 'package:flutter/material.dart';

class OutlinedTextStroke {
  OutlinedTextStroke({this.color, this.width});
  final Color? color;
  final double? width;
}

class OutlinedText extends StatelessWidget {
  const OutlinedText({Key? key, this.text, this.strokes}) : super(key: key);
  final Text? text;
  final List<OutlinedTextStroke>? strokes;

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    final list = strokes ?? <OutlinedTextStroke>[];
    var widthSum = 0.0;
    for (var i = 0; i < list.length; i++) {
      widthSum += list[i].width ?? 0.0;
      children.add(
        Text(
          text?.data ?? '',
          textAlign: text?.textAlign,
          maxLines: text?.maxLines,
          overflow: text?.overflow,
          style: (text?.style ?? const TextStyle()).copyWith(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = widthSum
              ..color = list[i].color ?? Colors.transparent,
          ),
        ),
      );
    }

    return Stack(
      children: [...children.reversed, text ?? const SizedBox.shrink()],
    );
  }
}
