import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listanything/app/pages/settings/settings.dart';

part 'firestore_user.freezed.dart';
part 'firestore_user.g.dart';

@freezed
class FirestoreUser with _$FirestoreUser {
  factory FirestoreUser({
    required String uid,
    required String email,
    // ignore: invalid_annotation_target
    @JsonKey(fromJson: _fromJsonSettings, toJson: _toJsonSettings)
        required Settings settings,
  }) = _FirestoreUser;

  factory FirestoreUser.fromJson(Map<String, dynamic> json) =>
      _$FirestoreUserFromJson(json);
}

Map<String, dynamic> _toJsonSettings(Settings settings) {
  return settings.toJson();
}

Settings _fromJsonSettings(Map<String, dynamic>? json) {
  if (json == null) {
    return Settings(
      distanceUnit: DistanceUnitType.kilometers,
      clockType: ClockType.TwentyFourHour,
      dateFormatType: DateFormatType.ISO_8601,
      readableDateFormatType: DateFormatType.MONTH_AND_DAY,
    );
  }
  return Settings.fromJson(json);
}
