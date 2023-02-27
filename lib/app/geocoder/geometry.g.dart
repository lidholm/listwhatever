// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geometry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Geometry _$$_GeometryFromJson(Map<String, dynamic> json) => _$_Geometry(
      location: LatLong.fromJson(json['location'] as Map<String, dynamic>),
      locationType: json['location_type'] as String,
      viewport: Bounds.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GeometryToJson(_$_Geometry instance) =>
    <String, dynamic>{
      'location': instance.location,
      'location_type': instance.locationType,
      'viewport': instance.viewport,
    };
