// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
mixin _$Settings {
// ignore: invalid_annotation_target
  @JsonKey(fromJson: _fromJsonDistanceUnit, toJson: _toJsonDistanceUnit)
  DistanceUnitType get distanceUnit =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(fromJson: _fromJsonClockType, toJson: _toJsonClockType)
  ClockType get clockType =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(fromJson: _fromJsonDateFormatType, toJson: _toJsonDateFormatType)
  DateFormatType get dateFormatType =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(
      fromJson: _fromJsonReadableDateFormatType,
      toJson: _toJsonReadableDateFormatType)
  DateFormatType get readableDateFormatType =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res, Settings>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _fromJsonDistanceUnit, toJson: _toJsonDistanceUnit)
      DistanceUnitType distanceUnit,
      @JsonKey(fromJson: _fromJsonClockType, toJson: _toJsonClockType)
      ClockType clockType,
      @JsonKey(fromJson: _fromJsonDateFormatType, toJson: _toJsonDateFormatType)
      DateFormatType dateFormatType,
      @JsonKey(
          fromJson: _fromJsonReadableDateFormatType,
          toJson: _toJsonReadableDateFormatType)
      DateFormatType readableDateFormatType});
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res, $Val extends Settings>
    implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distanceUnit = null,
    Object? clockType = null,
    Object? dateFormatType = null,
    Object? readableDateFormatType = null,
  }) {
    return _then(_value.copyWith(
      distanceUnit: null == distanceUnit
          ? _value.distanceUnit
          : distanceUnit // ignore: cast_nullable_to_non_nullable
              as DistanceUnitType,
      clockType: null == clockType
          ? _value.clockType
          : clockType // ignore: cast_nullable_to_non_nullable
              as ClockType,
      dateFormatType: null == dateFormatType
          ? _value.dateFormatType
          : dateFormatType // ignore: cast_nullable_to_non_nullable
              as DateFormatType,
      readableDateFormatType: null == readableDateFormatType
          ? _value.readableDateFormatType
          : readableDateFormatType // ignore: cast_nullable_to_non_nullable
              as DateFormatType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$$_SettingsCopyWith(
          _$_Settings value, $Res Function(_$_Settings) then) =
      __$$_SettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _fromJsonDistanceUnit, toJson: _toJsonDistanceUnit)
      DistanceUnitType distanceUnit,
      @JsonKey(fromJson: _fromJsonClockType, toJson: _toJsonClockType)
      ClockType clockType,
      @JsonKey(fromJson: _fromJsonDateFormatType, toJson: _toJsonDateFormatType)
      DateFormatType dateFormatType,
      @JsonKey(
          fromJson: _fromJsonReadableDateFormatType,
          toJson: _toJsonReadableDateFormatType)
      DateFormatType readableDateFormatType});
}

/// @nodoc
class __$$_SettingsCopyWithImpl<$Res>
    extends _$SettingsCopyWithImpl<$Res, _$_Settings>
    implements _$$_SettingsCopyWith<$Res> {
  __$$_SettingsCopyWithImpl(
      _$_Settings _value, $Res Function(_$_Settings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? distanceUnit = null,
    Object? clockType = null,
    Object? dateFormatType = null,
    Object? readableDateFormatType = null,
  }) {
    return _then(_$_Settings(
      distanceUnit: null == distanceUnit
          ? _value.distanceUnit
          : distanceUnit // ignore: cast_nullable_to_non_nullable
              as DistanceUnitType,
      clockType: null == clockType
          ? _value.clockType
          : clockType // ignore: cast_nullable_to_non_nullable
              as ClockType,
      dateFormatType: null == dateFormatType
          ? _value.dateFormatType
          : dateFormatType // ignore: cast_nullable_to_non_nullable
              as DateFormatType,
      readableDateFormatType: null == readableDateFormatType
          ? _value.readableDateFormatType
          : readableDateFormatType // ignore: cast_nullable_to_non_nullable
              as DateFormatType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Settings implements _Settings {
  _$_Settings(
      {@JsonKey(fromJson: _fromJsonDistanceUnit, toJson: _toJsonDistanceUnit)
      required this.distanceUnit,
      @JsonKey(fromJson: _fromJsonClockType, toJson: _toJsonClockType)
      required this.clockType,
      @JsonKey(fromJson: _fromJsonDateFormatType, toJson: _toJsonDateFormatType)
      required this.dateFormatType,
      @JsonKey(
          fromJson: _fromJsonReadableDateFormatType,
          toJson: _toJsonReadableDateFormatType)
      required this.readableDateFormatType});

  factory _$_Settings.fromJson(Map<String, dynamic> json) =>
      _$$_SettingsFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _fromJsonDistanceUnit, toJson: _toJsonDistanceUnit)
  final DistanceUnitType distanceUnit;
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _fromJsonClockType, toJson: _toJsonClockType)
  final ClockType clockType;
// ignore: invalid_annotation_target
  @override
  @JsonKey(fromJson: _fromJsonDateFormatType, toJson: _toJsonDateFormatType)
  final DateFormatType dateFormatType;
// ignore: invalid_annotation_target
  @override
  @JsonKey(
      fromJson: _fromJsonReadableDateFormatType,
      toJson: _toJsonReadableDateFormatType)
  final DateFormatType readableDateFormatType;

  @override
  String toString() {
    return 'Settings(distanceUnit: $distanceUnit, clockType: $clockType, dateFormatType: $dateFormatType, readableDateFormatType: $readableDateFormatType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Settings &&
            (identical(other.distanceUnit, distanceUnit) ||
                other.distanceUnit == distanceUnit) &&
            (identical(other.clockType, clockType) ||
                other.clockType == clockType) &&
            (identical(other.dateFormatType, dateFormatType) ||
                other.dateFormatType == dateFormatType) &&
            (identical(other.readableDateFormatType, readableDateFormatType) ||
                other.readableDateFormatType == readableDateFormatType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, distanceUnit, clockType,
      dateFormatType, readableDateFormatType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      __$$_SettingsCopyWithImpl<_$_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SettingsToJson(
      this,
    );
  }
}

abstract class _Settings implements Settings {
  factory _Settings(
      {@JsonKey(fromJson: _fromJsonDistanceUnit, toJson: _toJsonDistanceUnit)
      required final DistanceUnitType distanceUnit,
      @JsonKey(fromJson: _fromJsonClockType, toJson: _toJsonClockType)
      required final ClockType clockType,
      @JsonKey(fromJson: _fromJsonDateFormatType, toJson: _toJsonDateFormatType)
      required final DateFormatType dateFormatType,
      @JsonKey(
          fromJson: _fromJsonReadableDateFormatType,
          toJson: _toJsonReadableDateFormatType)
      required final DateFormatType readableDateFormatType}) = _$_Settings;

  factory _Settings.fromJson(Map<String, dynamic> json) = _$_Settings.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(fromJson: _fromJsonDistanceUnit, toJson: _toJsonDistanceUnit)
  DistanceUnitType get distanceUnit;
  @override // ignore: invalid_annotation_target
  @JsonKey(fromJson: _fromJsonClockType, toJson: _toJsonClockType)
  ClockType get clockType;
  @override // ignore: invalid_annotation_target
  @JsonKey(fromJson: _fromJsonDateFormatType, toJson: _toJsonDateFormatType)
  DateFormatType get dateFormatType;
  @override // ignore: invalid_annotation_target
  @JsonKey(
      fromJson: _fromJsonReadableDateFormatType,
      toJson: _toJsonReadableDateFormatType)
  DateFormatType get readableDateFormatType;
  @override
  @JsonKey(ignore: true)
  _$$_SettingsCopyWith<_$_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
