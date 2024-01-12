import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:listwhatever/custom/pages/listItems/list_item.dart';
import 'package:listwhatever/custom/pages/listItems/map/custom_marker.dart';

class FlutterMapsView extends StatefulWidget {
  const FlutterMapsView({required this.items, required this.onTap, super.key});
  final List<ListItem> items;
  final void Function(String itemId) onTap;

  @override
  FlutterMapsViewState createState() => FlutterMapsViewState();
}

class FlutterMapsViewState extends State<FlutterMapsView> {
  double doubleInRange(Random source, num start, num end) => source.nextDouble() * (end - start) + start;
  List<Marker> allCircles = [];

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      for (final item in widget.items) {
        if (item.latLong != null) {
          allCircles.add(
            Marker(
              point: LatLng(
                item.latLong!.lat,
                item.latLong!.lng,
              ),
              child: CustomMarker(
                color: Colors.red,
                onPressed: () {
                  widget.onTap(item.id!);
                },
              ),
            ),
          );
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final initialCenter = getCenter();

    return Column(
      children: [
        Flexible(
          child: FlutterMap(
            options: MapOptions(
              initialCenter: initialCenter,
              initialZoom: 11,
            ),
            children: [
              openStreetMapTileLayer,
              MarkerLayer(markers: allCircles),
            ],
          ),
        ),
      ],
    );
  }

  (LatLng, LatLng) getBounds() {
    final latLngList = widget.items.where((e) => e.latLong != null).map((e) => e.latLong!.toLatLng()).toList();
    assert(latLngList.isNotEmpty, 'List is empty');
    double? x0;
    double? x1;
    double? y0;
    double? y1;
    for (final latLng in latLngList) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return (LatLng(x1!, y1!), LatLng(x0!, y0!));
  }

  LatLng getCenter() {
    final bounds = getBounds();
    return LatLng(
      (bounds.$1.latitude - bounds.$2.latitude) / 2 + bounds.$2.latitude,
      (bounds.$1.longitude - bounds.$2.longitude) / 2 + bounds.$2.longitude,
    );
  }
}

TileLayer get openStreetMapTileLayer => TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.anywhostudios.listwhatever',
      // Use the recommended flutter_map_cancellable_tile_provider package to
      // support the cancellation of loading tiles.
      tileProvider: CancellableNetworkTileProvider(),
    );
