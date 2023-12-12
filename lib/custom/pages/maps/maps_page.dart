import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => MapsPageState();
}

class MapsPageState extends State<MapsPage> {
  GoogleMapController? mapController;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  // ignore: use_setters_to_change_properties
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      // AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Maps')),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: _createMarkers(),
        onMapCreated: _onMapCreated,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return Set.of({
      const Marker(
        markerId: MarkerId('marker_1'),
        position: LatLng(37.42796133580664, -122.085749655962),
      ),
      const Marker(
        markerId: MarkerId('marker_2'),
        position: LatLng(37.43796133580664, -122.085749655962),
      ),
    });
  }

  Future<void> _goToTheLake() async {
    await mapController?.moveCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: const LatLng(
            56.248673,
            12.483935,
          ),
          northeast: const LatLng(
            56.823821,
            12.5,
          ),
        ),
        18,
      ),
    );
  }
}
