import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/geocoder/geocoderresult.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';

const String className = 'FormInputFieldMap';

class FormInputFieldMap extends StatefulWidget {
  const FormInputFieldMap({
    required this.field,
    super.key,
  });
  final FormInputFieldInfoMap field;

  @override
  State<FormInputFieldMap> createState() => _FormInputFieldMapState();
}

class _FormInputFieldMapState extends State<FormInputFieldMap> {
  GoogleMapController? mapController;
  @override
  Widget build(BuildContext context) {
    LoggerHelper.logger.i('$className: field.value: ${widget.field.value}');

    return FormBuilderField(
      name: widget.field.id,
      builder: (FormFieldState<GeocoderResult?> formField) {
        if (formField.value != null && mapController != null) {
          moveMap(mapController, formField.value!);
        }
        return SizedBox(
          height: 300,
          width: 400,
          child: GoogleMap(
            mapType: MapType.hybrid,
            initialCameraPosition: getCameraPosition(formField),
            markers: _createMarker(formField.value ?? widget.field.value),
            onMapCreated: _onMapCreated,
          ),
        );
      },
    );
  }

  CameraPosition getCameraPosition(FormFieldState<GeocoderResult?> formField) {
    LoggerHelper.logger.i('$className: formField: ${formField.value}');

    var camera = const CameraPosition(
      target: LatLng(0, 0),
      zoom: 10.4746,
    );

    if (formField.value != null) {
      camera = CameraPosition(
        target: LatLng(
          formField.value!.geometry.location.lat,
          formField.value!.geometry.location.lng,
        ),
        zoom: 10.4746,
      );
    } else if (widget.field.value != null) {
      camera = CameraPosition(
        target: LatLng(
          widget.field.value!.geometry.location.lat,
          widget.field.value!.geometry.location.lng,
        ),
        zoom: 10.4746,
      );
    }

    LoggerHelper.logger.i('$className: camera: $camera');
    return camera;
  }

  // ignore: use_setters_to_change_properties
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _createMarker(GeocoderResult? result) {
    LoggerHelper.logger.i('$className: result: $result');
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
