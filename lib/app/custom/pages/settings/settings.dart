import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

// ignore: constant_identifier_names
enum DateFormatType { ISO_8601, US, MONTH_AND_DAY }

const dateFormatTypesInInputs = [DateFormatType.ISO_8601, DateFormatType.US];
const shortDateFormatTypesInInputs = [
  DateFormatType.MONTH_AND_DAY,
];

enum DistanceUnitType {
  miles,
  kilometers,
}

// ignore: constant_identifier_names
enum ClockType { AM_PM, TwentyFourHour }

final defaultSettings = Settings(
  clockType: ClockType.TwentyFourHour,
  dateFormatType: DateFormatType.ISO_8601,
  distanceUnit: DistanceUnitType.kilometers,
  readableDateFormatType: DateFormatType.MONTH_AND_DAY,
);

@freezed
class Settings with _$Settings {
  factory Settings({
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _fromJsonDistanceUnit, toJson: _toJsonDistanceUnit)
        required DistanceUnitType distanceUnit,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _fromJsonClockType, toJson: _toJsonClockType)
        required ClockType clockType,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _fromJsonDateFormatType, toJson: _toJsonDateFormatType)
        required DateFormatType dateFormatType,

    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _fromJsonReadableDateFormatType, toJson: _toJsonReadableDateFormatType)
        required DateFormatType readableDateFormatType,
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

String _toJsonDateFormatType(DateFormatType option) {
  return option.name;
}

DateFormatType _fromJsonDateFormatType(String option) {
  return DateFormatType.values.firstWhere((element) => element.name == option);
}

String _toJsonReadableDateFormatType(DateFormatType option) {
  return option.name;
}

DateFormatType _fromJsonReadableDateFormatType(String option) {
  return DateFormatType.values.firstWhere((element) => element.name == option);
}
