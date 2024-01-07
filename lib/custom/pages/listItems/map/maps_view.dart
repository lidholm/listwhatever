import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '/standard/constants.dart';
import '../list_item.dart';

class MapsView extends StatefulWidget {
  const MapsView({required this.items, required this.onTap, super.key});
  final List<ListItem> items;
  final void Function(String itemId) onTap;

  @override
  State<MapsView> createState() => MapsViewState();
}

class MapsViewState extends State<MapsView> {
  GoogleMapController? mapController;

  CameraPosition getCameraPosition() {
    return CameraPosition(
      target: getCenter(),
      zoom: 14.4746,
    );
  }

  // ignore: use_setters_to_change_properties
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    moveCamera();
  }

  void moveCamera() {
    if (mapController != null) {
      final bounds = getBounds();
      mapController!.animateCamera(CameraUpdate.newLatLngBounds(bounds, 1));
    }
  }

  @override
  void didUpdateWidget(covariant MapsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    moveCamera();
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      // AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: getCameraPosition(),
      markers: _createMarkers(widget.items),
      zoomControlsEnabled: false,
      onMapCreated: _onMapCreated,
    );
  }

  Set<Marker> _createMarkers(List<ListItem> items) {
    final itemsWithLatLongs = items.where(
      (item) => item.latLong != null,
    );
    final markers = itemsWithLatLongs
        .map(
          (item) => Marker(
            markerId: MarkerId(item.id ?? getRandomString(6)),
            position: LatLng(item.latLong!.lat, item.latLong!.lng),
            onTap: () {
              widget.onTap(item.id!);
            },
          ),
        )
        .toSet();
    return markers;
  }

  LatLngBounds getBounds() {
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
    return LatLngBounds(northeast: LatLng(x1!, y1!), southwest: LatLng(x0!, y0!));
  }

  LatLng getCenter() {
    final bounds = getBounds();
    return LatLng(
      (bounds.northeast.latitude - bounds.southwest.latitude) / 2 + bounds.southwest.latitude,
      (bounds.northeast.longitude - bounds.southwest.longitude) / 2 + bounds.southwest.longitude,
    );
  }
}
