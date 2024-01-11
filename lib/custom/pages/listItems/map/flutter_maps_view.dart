import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';

const circlesCount = 4;

/// On this page, [maxCirclesCount] circles are randomly generated
/// across europe, and then you can limit them with a slider
///
/// This way, you can test how map performs under a lot of circles
class FlutterMapsView extends StatefulWidget {
  const FlutterMapsView({super.key});

  static const String route = '/many_circles';

  @override
  FlutterMapsViewState createState() => FlutterMapsViewState();
}

class FlutterMapsViewState extends State<FlutterMapsView> {
  double doubleInRange(Random source, num start, num end) => source.nextDouble() * (end - start) + start;
  List<CircleMarker> allCircles = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final r = Random();
      for (var x = 0; x < circlesCount; x++) {
        allCircles.add(
          CircleMarker(
            point: LatLng(
              doubleInRange(r, 37, 55),
              doubleInRange(r, -9, 30),
            ),
            color: Colors.red,
            radius: 5,
          ),
        );
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('A lot of circles')),
      body: Column(
        children: [
          Flexible(
            child: FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(50, 20),
                initialZoom: 5,
                // interactionOptions: InteractionOptions(
                //   flags: InteractiveFlag.all - InteractiveFlag.rotate,
                // ),
              ),
              children: [
                openStreetMapTileLayer,
                CircleLayer(circles: allCircles.sublist(0, min(allCircles.length, circlesCount))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
      // Use the recommended flutter_map_cancellable_tile_provider package to
      // support the cancellation of loading tiles.
      tileProvider: CancellableNetworkTileProvider(),
    );
