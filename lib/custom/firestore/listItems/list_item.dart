// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:allmylists/custom/pages/listItems/searchLocation/geocoder/latlong.dart';

part 'list_item.freezed.dart';
part 'list_item.g.dart';

@freezed
class ListItem with _$ListItem {
  const factory ListItem({
    required String? id,
    required String name,
    @Default(null) String? info,
    @Default([]) List<String> urls,
    @Default(null) DateTime? datetime,
    @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
    @Default(null) LatLong? latLong,
    @Default(null) String? address,
    @Default({}) Map<String, List<String>> categories,
    @Default(null) String? latestUpdateUser,
  }) = _ListItem;

  factory ListItem.fromJson(Map<String, Object?> json)
  => _$ListItemFromJson(json);
}

GeoPoint? _toJsonGeoPoint(LatLong? latLong) {
  if (latLong == null) {
    return null;
  }
  return GeoPoint(latLong.lat, latLong.lng);
}

LatLong? _fromJsonGeoPoint(GeoPoint? geoPoint) {
  if (geoPoint == null) {
    return null;
  }
  return LatLong(lat: geoPoint.latitude, lng: geoPoint.longitude);
}
