// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListItemImpl _$$ListItemImplFromJson(Map<String, dynamic> json) =>
    _$ListItemImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      info: json['info'] as String? ?? null,
      urls:
          (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      datetime: json['datetime'] == null
          ? null
          : DateTime.parse(json['datetime'] as String),
      latLong: json['latLong'] == null
          ? null
          : _fromJsonGeoPoint(json['latLong'] as GeoPoint?),
      address: json['address'] as String? ?? null,
      categories: (json['categories'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, (e as List<dynamic>).map((e) => e as String).toList()),
          ) ??
          const {},
      latestUpdateUser: json['latestUpdateUser'] as String? ?? null,
    );

Map<String, dynamic> _$$ListItemImplToJson(_$ListItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'info': instance.info,
      'urls': instance.urls,
      'datetime': instance.datetime?.toIso8601String(),
      'latLong': _toJsonGeoPoint(instance.latLong),
      'address': instance.address,
      'categories': instance.categories,
      'latestUpdateUser': instance.latestUpdateUser,
    };
