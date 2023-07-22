// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '/app/custom/geocoder/bounds.dart';
import '/app/custom/geocoder/latlong.dart';

part 'geometry.freezed.dart';
part 'geometry.g.dart';

@freezed
class Geometry with _$Geometry {
  factory Geometry({
    required LatLong location,
    @JsonKey(name: 'location_type') required String locationType,
    required Bounds viewport,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}
