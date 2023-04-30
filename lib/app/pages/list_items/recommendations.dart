import 'package:flutter/material.dart';

class Recommendations extends StatelessWidget {
  const Recommendations({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Recommendation(index: index);
        },
        childCount: 100,
      ),
    );
  }
}

class Recommendation extends StatelessWidget {
  const Recommendation({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Text('🎁 You might also like #${index + 1}'),
        ],
      ),
    );
  }
}
