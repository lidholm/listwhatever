// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'latlong.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LatLong _$LatLongFromJson(Map<String, dynamic> json) {
  return _LatLong.fromJson(json);
}

/// @nodoc
mixin _$LatLong {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LatLongCopyWith<LatLong> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LatLongCopyWith<$Res> {
  factory $LatLongCopyWith(LatLong value, $Res Function(LatLong) then) =
      _$LatLongCopyWithImpl<$Res, LatLong>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$LatLongCopyWithImpl<$Res, $Val extends LatLong>
    implements $LatLongCopyWith<$Res> {
  _$LatLongCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LatLongCopyWith<$Res> implements $LatLongCopyWith<$Res> {
  factory _$$_LatLongCopyWith(
          _$_LatLong value, $Res Function(_$_LatLong) then) =
      __$$_LatLongCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_LatLongCopyWithImpl<$Res>
    extends _$LatLongCopyWithImpl<$Res, _$_LatLong>
    implements _$$_LatLongCopyWith<$Res> {
  __$$_LatLongCopyWithImpl(_$_LatLong _value, $Res Function(_$_LatLong) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_LatLong(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LatLong implements _LatLong {
  const _$_LatLong({required this.lat, required this.lng});

  factory _$_LatLong.fromJson(Map<String, dynamic> json) =>
      _$$_LatLongFromJson(json);

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'LatLong(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LatLong &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LatLongCopyWith<_$_LatLong> get copyWith =>
      __$$_LatLongCopyWithImpl<_$_LatLong>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LatLongToJson(
      this,
    );
  }
}

abstract class _LatLong implements LatLong {
  const factory _LatLong(
      {required final double lat, required final double lng}) = _$_LatLong;

  factory _LatLong.fromJson(Map<String, dynamic> json) = _$_LatLong.fromJson;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_LatLongCopyWith<_$_LatLong> get copyWith =>
      throw _privateConstructorUsedError;
}
