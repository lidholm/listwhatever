import 'package:flutter/material.dart';

class CustomMarker extends StatelessWidget {
  const CustomMarker({
    required this.color,
    required this.onPressed,
    super.key,
  });
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          const Icon(
            Icons.location_on,
            color: Color.fromARGB(255, 7, 22, 65),
            size: 50,
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(17, 13, 0, 0),
            child: Icon(
              Icons.circle,
              color: Color.fromARGB(255, 7, 22, 65),
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 4, 0, 0),
            child: Icon(
              Icons.location_on,
              color: color,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
