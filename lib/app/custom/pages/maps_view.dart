import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '/app/custom/pages/list_items/list_item.dart';
import '/app/custom/pages/lists/list_of_things.dart';
import '/app/custom/pages/map/current_location_marker.dart';
import '/app/custom/pages/map/custom_marker.dart';

class MapsView extends StatelessWidget {
  const MapsView({
    required this.items,
    required this.isLoading,
    required this.list,
    required this.location,
    super.key,
  });
  final List<ListItem> items;
  final bool isLoading;
  final ListOfThings list;
  final LocationData location;

  @override
  Widget build(BuildContext context) {
    final allMarkers = items
            .where((item) => item.latLong != null)
            .map<Marker>(
              (item) => CustomMarker(
                point: LatLng(item.latLong!.lat, item.latLong!.lng),
              ),
            )
            .toList() +
        [
          CurrentLocationMarker(
            point: LatLng(location.latitude ?? 0.0, location.longitude ?? 0.0),
          )
        ];

    return Column(
      children: [
        Flexible(
          child: FlutterMap(
            options: MapOptions(
              center: const LatLng(32.71009, -117.16063),
              zoom: 13.5,
              interactiveFlags: InteractiveFlag.all - InteractiveFlag.rotate,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
              ),
              MarkerLayer(
                markers: allMarkers,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
