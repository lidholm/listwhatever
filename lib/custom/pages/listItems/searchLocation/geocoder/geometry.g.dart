// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeometryImpl _$$GeometryImplFromJson(Map<String, dynamic> json) =>
    _$GeometryImpl(
      location: LatLong.fromJson(json['location'] as Map<String, dynamic>),
      locationType: json['location_type'] as String,
      viewport: Bounds.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GeometryImplToJson(_$GeometryImpl instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'location_type': instance.locationType,
      'viewport': instance.viewport.toJson(),
    };
