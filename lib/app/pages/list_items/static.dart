import 'package:flutter/material.dart';
import 'package:listanything/app/common_theme_data.dart';

class Static extends StatelessWidget {
  const Static({
    required this.title,
    super.key,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            title,
            style: const TextStyle(
              color: mainColor,
              fontSize: 24,
            ),
          ),
        ),
      ]),
    );
  }
}
