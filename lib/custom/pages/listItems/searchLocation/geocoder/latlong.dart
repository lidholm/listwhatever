import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'latlong.freezed.dart';
part 'latlong.g.dart';

@freezed
class LatLong with _$LatLong {

  const factory LatLong({
    required double lat,
    required double lng,
  }) = _LatLong;

  // Added constructor. Must not have any parameter
  const LatLong._();

  factory LatLong.fromJson(Map<String, dynamic> json) => _$LatLongFromJson(json);

  LatLng toLatLng() {
    return LatLng(lat,lng);
  }
}
