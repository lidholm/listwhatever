// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$$_SettingsFromJson(Map<String, dynamic> json) => _$_Settings(
      distanceUnit: _fromJsonDistanceUnit(json['distanceUnit'] as String),
      clockType: _fromJsonClockType(json['clockType'] as String),
    );

Map<String, dynamic> _$$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'distanceUnit': _toJsonDistanceUnit(instance.distanceUnit),
      'clockType': _toJsonClockType(instance.clockType),
    };
