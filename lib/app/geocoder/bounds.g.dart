// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Bounds _$$_BoundsFromJson(Map<String, dynamic> json) => _$_Bounds(
      northeast: LatLong.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: LatLong.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BoundsToJson(_$_Bounds instance) => <String, dynamic>{
      'northeast': instance.northeast.toJson(),
      'southwest': instance.southwest.toJson(),
    };
