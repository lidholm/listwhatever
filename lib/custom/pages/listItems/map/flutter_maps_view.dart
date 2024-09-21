import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '/custom/currentLocationBloc/current_location_bloc.dart';
import '/custom/pages/listItems/map/custom_marker.dart';
import '/custom/pages/listItems/models/list_item.dart';
import '/standard/constants.dart';

class FlutterMapsView extends StatefulWidget {
  const FlutterMapsView({required this.items, required this.onTap, super.key});
  final List<ListItem> items;
  final void Function(String itemId) onTap;

  @override
  FlutterMapsViewState createState() => FlutterMapsViewState();
}

class FlutterMapsViewState extends State<FlutterMapsView> {
  static String className = 'FlutterMapsView';
  double doubleInRange(Random source, num start, num end) =>
      source.nextDouble() * (end - start) + start;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final currentLocation = context.watch<CurrentLocationCubit>().state;

    logger.d('rebuilding map view');
    final options = getMapOptions();

    final currentLocationMarker = getCurrentLocationMarker(currentLocation);
    return Column(
      children: [
        Flexible(
          child: FlutterMap(
            options: options,
            children: [
              openStreetMapTileLayer,
              MarkerLayer(
                markers: [
                  ...getMarkers(),
                  if (currentLocationMarker != null) currentLocationMarker,
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  MapOptions getMapOptions() {
    final initialCenter = getCenter();
    return initialCenter != null
        ? MapOptions(
            initialCenter: initialCenter,
            initialZoom: 11,
          )
        : const MapOptions(
            initialZoom: 11,
          );
  }

  (LatLng, LatLng)? getBounds() {
    final latLngList = widget.items
        .where((e) => e.latLong != null)
        .map((e) => e.latLong!.toLatLng())
        .toList();
    logger.i('$className => latLngList: $latLngList');
    if (latLngList.isEmpty) {
      return null;
    }

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

  LatLng? getCenter() {
    final bounds = getBounds();
    if (bounds == null) {
      return null;
    }
    return LatLng(
      (bounds.$1.latitude - bounds.$2.latitude) / 2 + bounds.$2.latitude,
      (bounds.$1.longitude - bounds.$2.longitude) / 2 + bounds.$2.longitude,
    );
  }

  List<Marker> getMarkers() {
    final markers = <Marker>[];
    for (final item in widget.items) {
      if (item.latLong != null) {
        markers.add(
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
    return markers;
  }

  Marker? getCurrentLocationMarker(Position? currentLocation) {
    if (currentLocation == null) {
      return null;
    }
    return Marker(
      point: LatLng(
        currentLocation.latitude,
        currentLocation.longitude,
      ),
      child: CustomMarker(
        color: Colors.blue,
        onPressed: () {},
      ),
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
