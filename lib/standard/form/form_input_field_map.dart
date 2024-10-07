import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/geocoder/geocoderresult.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

class FormInputFieldMap extends StatelessWidget {
  FormInputFieldMap({
    required this.field,
    super.key,
  });
  final FormInputFieldInfoMap field;
  late GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Text('sdf');
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 10.4746,
  );

  // ignore: use_setters_to_change_properties
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _createMarker(GeocoderResult? result) {
    if (result == null) return Set.of({});

    return Set.of({
      Marker(
        markerId: MarkerId(result.formattedAddress),
        position: LatLng(
          result.geometry.location.lat,
          result.geometry.location.lng,
        ),
      ),
    });
  }

  Future<void> moveMap(
    GoogleMapController? mapController,
    GeocoderResult result,
  ) async {
    if (mapController == null) {
      return;
    }

    const cameraBuffer = 0.01;

    await mapController.moveCamera(
      CameraUpdate.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(
            result.geometry.location.lat - cameraBuffer,
            result.geometry.location.lng - cameraBuffer,
          ),
          northeast: LatLng(
            result.geometry.location.lat + cameraBuffer,
            result.geometry.location.lng + cameraBuffer,
          ),
        ),
        18,
      ),
    );
  }
}
