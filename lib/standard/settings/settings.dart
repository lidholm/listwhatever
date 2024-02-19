import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

enum DistanceUnitOptions {
  kilometers,
  miles,
}

const metersInMile = 1608;
const metersInKilometer = 1000;

double convertDistanceToMeters(DistanceUnitOptions distanceTypes, double d) {
  return {DistanceUnitOptions.kilometers: 1000, DistanceUnitOptions.miles: 1608}[distanceTypes]! * d;
}

@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required DistanceUnitOptions distanceUnit,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);
}

const defaultSettings = Settings(
  distanceUnit: DistanceUnitOptions.kilometers,
);
