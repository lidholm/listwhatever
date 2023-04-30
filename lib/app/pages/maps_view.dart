import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';

class MapsView extends StatelessWidget {
  const MapsView({
    required this.items,
    required this.isLoading,
    required this.list,
    super.key,
  });
  final List<ListItem> items;
  final bool isLoading;
  final ListOfThings list;

  @override
  Widget build(BuildContext context) {
    final allMarkers = items
        .where((item) => item.latLong != null)
        .map(
          (item) => Marker(
            point: LatLng(item.latLong!.lat, item.latLong!.lng),
            builder: (context) => const Icon(
              Icons.circle,
              color: Colors.red,
              size: 12,
            ),
          ),
        )
        .toList();

    return Column(
      children: [
        Flexible(
          child: FlutterMap(
            options: MapOptions(
              center: LatLng(32.71009, -117.16063),
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
