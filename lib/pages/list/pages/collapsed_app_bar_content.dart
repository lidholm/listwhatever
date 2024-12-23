import 'package:flutter/material.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

class CollapsedAppBarContent extends StatelessWidget {
  const CollapsedAppBarContent({
    Key? key,
    required this.list,
  }) : super(key: key);

  final ListOfThings list;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          list.name ?? '',
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 40,
          child: Image.asset(
            // list.imageFilename ??
            'assets/images/restaurants.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
