import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

class BlurredBackdropImage extends StatelessWidget {
  const BlurredBackdropImage({
    required this.list,
    super.key,
  });

  final ListOfThings list;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            list.imageFilename ?? '',
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height / 1.5,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0),
          ),
        ),
      ),
    );
  }
}
