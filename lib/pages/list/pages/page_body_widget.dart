import 'package:flutter/material.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

/// Shows the body of the movie details
///includes the watch now, favorite buttons and the movie introduction
class PageBodyWidget extends StatelessWidget {
  const PageBodyWidget({
    required this.list,
    super.key,
  });

  final ListOfThings list;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(
                child: Text('Watch now'),
              ),
            ],
          ),
          const Divider(),
          const SizedBox(
            height: 10,
          ),
          // Introduction title
          const Text(
            'Introduction',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            list.name,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
