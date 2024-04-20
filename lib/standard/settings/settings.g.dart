// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SettingsImpl _$$SettingsImplFromJson(Map<String, dynamic> json) =>
    _$SettingsImpl(
      distanceUnit:
          $enumDecode(_$DistanceUnitOptionsEnumMap, json['distanceUnit']),
      mapsType: $enumDecodeNullable(_$MapsTypeEnumMap, json['mapsType']) ??
          MapsType.flutterMaps,
    );

Map<String, dynamic> _$$SettingsImplToJson(_$SettingsImpl instance) =>
    <String, dynamic>{
      'distanceUnit': _$DistanceUnitOptionsEnumMap[instance.distanceUnit]!,
      'mapsType': _$MapsTypeEnumMap[instance.mapsType]!,
    };

const _$DistanceUnitOptionsEnumMap = {
  DistanceUnitOptions.kilometers: 'kilometers',
  DistanceUnitOptions.miles: 'miles',
};

const _$MapsTypeEnumMap = {
  MapsType.googleMaps: 'googleMaps',
  MapsType.flutterMaps: 'flutterMaps',
};
