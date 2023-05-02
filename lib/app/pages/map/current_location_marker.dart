import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class CurrentLocationMarker extends Marker {
  CurrentLocationMarker({
    required super.point,
  }) : super(builder: (context) => const CurrentLocationMarkerBuilder());
}

class CurrentLocationMarkerBuilder extends StatelessWidget {
  const CurrentLocationMarkerBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Icon(
          Icons.circle,
          color: Color.fromARGB(119, 55, 105, 243),
          size: 31,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(6, 6, 0, 0),
          child: Icon(
            Icons.circle,
            color: Color.fromARGB(255, 255, 255, 255),
            size: 19,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: Icon(
            Icons.circle,
            color: Colors.blue,
            size: 15,
          ),
        ),
      ],
    );
  }
}
