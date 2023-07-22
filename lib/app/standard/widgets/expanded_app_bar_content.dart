import 'package:flutter/material.dart';
import '/app/custom/common_theme_data.dart';
import '/app/standard/widgets/outlined_text.dart';

class ExpandedAppBarContent extends StatelessWidget {
  const ExpandedAppBarContent({
    required this.background,
    required this.title,
    required this.isLoading,
    required this.expandedPercentage,
    super.key,
  });

  final String background;
  final String title;
  final bool isLoading;
  final double expandedPercentage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 140,
          width: double.infinity,
          decoration: isLoading
              ? BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                )
              : BoxDecoration(
                  image: DecorationImage(
                    opacity: 0.35,
                    image: AssetImage(background),
                    fit: BoxFit.cover,
                  ),
                ),
          child: Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              opacity: expandedPercentage,
              child: OutlinedText(
                strokes: [
                  OutlinedTextStroke(color: Colors.white, width: 5),
                ],
                text: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                    letterSpacing: 3,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
