// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listanything/app/geocoder/bounds.dart';
import 'package:listanything/app/geocoder/latlong.dart';

part 'geometry.freezed.dart';
part 'geometry.g.dart';

@freezed
class Geometry with _$Geometry {
  factory Geometry({
    required LatLong location,
    @JsonKey(name: 'location_type') required String locationType,
    required Bounds viewport,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) => _$GeometryFromJson(json);
}
