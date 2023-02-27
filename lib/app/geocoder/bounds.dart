import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listanything/app/geocoder/latlong.dart';

part 'bounds.freezed.dart';
part 'bounds.g.dart';

@freezed
class Bounds with _$Bounds {
  factory Bounds({
    required LatLong northeast,
    required LatLong southwest,
  }) = _Bounds;

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);
}
