import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

enum DistanceUnitType {
  miles,
  kilometers,
}

// ignore: constant_identifier_names
enum ClockType { AM_PM, TwentyFourHour }

@freezed
class Settings with _$Settings {
  factory Settings({
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _fromJsonDistanceUnit, toJson: _toJsonDistanceUnit)
        required DistanceUnitType distanceUnit,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _fromJsonClockType, toJson: _toJsonClockType)
        required ClockType clockType,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}

String _toJsonDistanceUnit(DistanceUnitType unitType) {
  return unitType.name;
}

DistanceUnitType _fromJsonDistanceUnit(String unitType) {
  return DistanceUnitType.values
      .firstWhere((element) => element.name == unitType);
}

String _toJsonClockType(ClockType option) {
  return option.name;
}

ClockType _fromJsonClockType(String option) {
  return ClockType.values.firstWhere((element) => element.name == option);
}
