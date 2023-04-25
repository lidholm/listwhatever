// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SelectedUser {
  String get uid => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedUserCopyWith<SelectedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedUserCopyWith<$Res> {
  factory $SelectedUserCopyWith(
          SelectedUser value, $Res Function(SelectedUser) then) =
      _$SelectedUserCopyWithImpl<$Res, SelectedUser>;
  @useResult
  $Res call({String uid, String? email, String? name});
}

/// @nodoc
class _$SelectedUserCopyWithImpl<$Res, $Val extends SelectedUser>
    implements $SelectedUserCopyWith<$Res> {
  _$SelectedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SelectedUserCopyWith<$Res>
    implements $SelectedUserCopyWith<$Res> {
  factory _$$_SelectedUserCopyWith(
          _$_SelectedUser value, $Res Function(_$_SelectedUser) then) =
      __$$_SelectedUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String? email, String? name});
}

/// @nodoc
class __$$_SelectedUserCopyWithImpl<$Res>
    extends _$SelectedUserCopyWithImpl<$Res, _$_SelectedUser>
    implements _$$_SelectedUserCopyWith<$Res> {
  __$$_SelectedUserCopyWithImpl(
      _$_SelectedUser _value, $Res Function(_$_SelectedUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_SelectedUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SelectedUser implements _SelectedUser {
  _$_SelectedUser({required this.uid, this.email, this.name});

  @override
  final String uid;
  @override
  final String? email;
  @override
  final String? name;

  @override
  String toString() {
    return 'SelectedUser(uid: $uid, email: $email, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SelectedUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uid, email, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectedUserCopyWith<_$_SelectedUser> get copyWith =>
      __$$_SelectedUserCopyWithImpl<_$_SelectedUser>(this, _$identity);
}

abstract class _SelectedUser implements SelectedUser {
  factory _SelectedUser(
      {required final String uid,
      final String? email,
      final String? name}) = _$_SelectedUser;

  @override
  String get uid;
  @override
  String? get email;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_SelectedUserCopyWith<_$_SelectedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
