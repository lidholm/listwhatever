// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'emulator_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EmulatorInfo {
  EmulatorType get type => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmulatorInfoCopyWith<EmulatorInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmulatorInfoCopyWith<$Res> {
  factory $EmulatorInfoCopyWith(
          EmulatorInfo value, $Res Function(EmulatorInfo) then) =
      _$EmulatorInfoCopyWithImpl<$Res, EmulatorInfo>;
  @useResult
  $Res call({EmulatorType type, String? address});
}

/// @nodoc
class _$EmulatorInfoCopyWithImpl<$Res, $Val extends EmulatorInfo>
    implements $EmulatorInfoCopyWith<$Res> {
  _$EmulatorInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmulatorType,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EmulatorInfoImplCopyWith<$Res>
    implements $EmulatorInfoCopyWith<$Res> {
  factory _$$EmulatorInfoImplCopyWith(
          _$EmulatorInfoImpl value, $Res Function(_$EmulatorInfoImpl) then) =
      __$$EmulatorInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({EmulatorType type, String? address});
}

/// @nodoc
class __$$EmulatorInfoImplCopyWithImpl<$Res>
    extends _$EmulatorInfoCopyWithImpl<$Res, _$EmulatorInfoImpl>
    implements _$$EmulatorInfoImplCopyWith<$Res> {
  __$$EmulatorInfoImplCopyWithImpl(
      _$EmulatorInfoImpl _value, $Res Function(_$EmulatorInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? address = freezed,
  }) {
    return _then(_$EmulatorInfoImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EmulatorType,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EmulatorInfoImpl implements _EmulatorInfo {
  _$EmulatorInfoImpl({required this.type, required this.address});

  @override
  final EmulatorType type;
  @override
  final String? address;

  @override
  String toString() {
    return 'EmulatorInfo(type: $type, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmulatorInfoImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmulatorInfoImplCopyWith<_$EmulatorInfoImpl> get copyWith =>
      __$$EmulatorInfoImplCopyWithImpl<_$EmulatorInfoImpl>(this, _$identity);
}

abstract class _EmulatorInfo implements EmulatorInfo {
  factory _EmulatorInfo(
      {required final EmulatorType type,
      required final String? address}) = _$EmulatorInfoImpl;

  @override
  EmulatorType get type;
  @override
  String? get address;
  @override
  @JsonKey(ignore: true)
  _$$EmulatorInfoImplCopyWith<_$EmulatorInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
