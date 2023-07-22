import 'package:freezed_annotation/freezed_annotation.dart';

part 'latlong.freezed.dart';
part 'latlong.g.dart';

@freezed
class LatLong with _$LatLong {
  const factory LatLong({
    required double lat,
    required double lng,
  }) = _LatLong;
  factory LatLong.fromJson(Map<String, dynamic> json) => _$LatLongFromJson(json);
}
