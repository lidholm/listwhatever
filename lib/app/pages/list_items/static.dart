import 'package:flutter/material.dart';

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
            style: TextStyle(
              color: Colors.orange.shade800,
              fontSize: 24,
            ),
          ),
        ),
      ]),
    );
  }
}
