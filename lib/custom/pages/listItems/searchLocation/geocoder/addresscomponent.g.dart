// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addresscomponent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressComponent _$$_AddressComponentFromJson(Map<String, dynamic> json) =>
    _$_AddressComponent(
      longName: json['long_name'] as String,
      shortName: json['short_name'] as String,
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_AddressComponentToJson(_$_AddressComponent instance) =>
    <String, dynamic>{
      'long_name': instance.longName,
      'short_name': instance.shortName,
      'types': instance.types,
    };
