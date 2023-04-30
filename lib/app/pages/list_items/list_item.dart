// ignore_for_file: invalid_annotation_target, always_put_required_named_parameters_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listanything/app/geocoder/latlong.dart';

part 'list_item.freezed.dart';
part 'list_item.g.dart';

typedef CategoryName = String;
typedef CategoryValue = String;

@freezed
class ListItem with _$ListItem {
  const factory ListItem({
    String? id,
    required String name,
    required Map<CategoryName, List<CategoryValue>> categories,
    @Default(null) String? searchPhrase,
    @Default(null) String? address,
    @Default(null)
    @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
        LatLong? latLong,
    @Default(<String>[]) List<String> urls,
    @Default('') String info,
    @Default(null)
    @JsonKey(fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
        DateTime? datetime,
  }) = _ListItem;

  factory ListItem.fromJson(Map<String, dynamic> json) =>
      _$ListItemFromJson(json);
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

Timestamp? _toJsonDateTime(DateTime? dateTime) {
  if (dateTime == null) {
    return null;
  }
  return Timestamp.fromDate(dateTime);
}

DateTime? _fromJsonDateTime(Timestamp? timestamp) {
  if (timestamp == null) {
    return null;
  }
  return timestamp.toDate();
}
