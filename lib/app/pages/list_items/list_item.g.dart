// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListItem _$$_ListItemFromJson(Map<String, dynamic> json) => _$_ListItem(
      id: json['id'] as String?,
      name: json['name'] as String,
      categories: (json['categories'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      searchPhrase: json['searchPhrase'] as String? ?? null,
      address: json['address'] as String? ?? null,
      latLong: json['latLong'] == null
          ? null
          : _fromJsonGeoPoint(json['latLong'] as GeoPoint?),
    );

Map<String, dynamic> _$$_ListItemToJson(_$_ListItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'categories': instance.categories,
      'searchPhrase': instance.searchPhrase,
      'address': instance.address,
      'latLong': _toJsonGeoPoint(instance.latLong),
    };
