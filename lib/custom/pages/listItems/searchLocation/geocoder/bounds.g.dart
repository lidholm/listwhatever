// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoundsImpl _$$BoundsImplFromJson(Map<String, dynamic> json) => _$BoundsImpl(
      northeast: LatLong.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: LatLong.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BoundsImplToJson(_$BoundsImpl instance) =>
    <String, dynamic>{
      'northeast': instance.northeast.toJson(),
      'southwest': instance.southwest.toJson(),
    };
