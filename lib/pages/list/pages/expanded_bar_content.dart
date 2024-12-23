import 'package:flutter/material.dart';
import 'package:listwhatever/pages/list/pages/outlined_chip.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

class ExpandedAppBarContent extends StatelessWidget {
  const ExpandedAppBarContent({
    required this.list,
    super.key,
  });

  final ListOfThings list;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 140,
          height: 200,
          child: Material(
            borderRadius: BorderRadius.circular(
              15,
            ),
            elevation: 7,
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              // list.imageFilename ?? '',
              'assets/images/restaurants.jpeg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          list.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          list.ownerId ?? '',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedChip(
              label: 3.toStringAsFixed(1),
              icon: const Icon(
                Icons.star,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const OutlinedChip(
              label: 'SE',
              icon: Icon(
                Icons.flag,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const OutlinedChip(
              label: '',
              icon: Icon(
                Icons.language,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
