// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticationUser _$AuthenticationUserFromJson(Map<String, dynamic> json) {
  return _AuthenticationUser.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationUser {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get photo => throw _privateConstructorUsedError;
  bool get isNewUser => throw _privateConstructorUsedError;

  /// Serializes this AuthenticationUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthenticationUserCopyWith<AuthenticationUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationUserCopyWith<$Res> {
  factory $AuthenticationUserCopyWith(
          AuthenticationUser value, $Res Function(AuthenticationUser) then) =
      _$AuthenticationUserCopyWithImpl<$Res, AuthenticationUser>;
  @useResult
  $Res call(
      {String id, String? email, String? name, String? photo, bool isNewUser});
}

/// @nodoc
class _$AuthenticationUserCopyWithImpl<$Res, $Val extends AuthenticationUser>
    implements $AuthenticationUserCopyWith<$Res> {
  _$AuthenticationUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? isNewUser = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationUserImplCopyWith<$Res>
    implements $AuthenticationUserCopyWith<$Res> {
  factory _$$AuthenticationUserImplCopyWith(_$AuthenticationUserImpl value,
          $Res Function(_$AuthenticationUserImpl) then) =
      __$$AuthenticationUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String? email, String? name, String? photo, bool isNewUser});
}

/// @nodoc
class __$$AuthenticationUserImplCopyWithImpl<$Res>
    extends _$AuthenticationUserCopyWithImpl<$Res, _$AuthenticationUserImpl>
    implements _$$AuthenticationUserImplCopyWith<$Res> {
  __$$AuthenticationUserImplCopyWithImpl(_$AuthenticationUserImpl _value,
      $Res Function(_$AuthenticationUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = freezed,
    Object? name = freezed,
    Object? photo = freezed,
    Object? isNewUser = null,
  }) {
    return _then(_$AuthenticationUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      photo: freezed == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String?,
      isNewUser: null == isNewUser
          ? _value.isNewUser
          : isNewUser // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationUserImpl implements _AuthenticationUser {
  _$AuthenticationUserImpl(
      {required this.id,
      required this.email,
      required this.name,
      required this.photo,
      required this.isNewUser});

  factory _$AuthenticationUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationUserImplFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? name;
  @override
  final String? photo;
  @override
  final bool isNewUser;

  @override
  String toString() {
    return 'AuthenticationUser(id: $id, email: $email, name: $name, photo: $photo, isNewUser: $isNewUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.photo, photo) || other.photo == photo) &&
            (identical(other.isNewUser, isNewUser) ||
                other.isNewUser == isNewUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, email, name, photo, isNewUser);

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationUserImplCopyWith<_$AuthenticationUserImpl> get copyWith =>
      __$$AuthenticationUserImplCopyWithImpl<_$AuthenticationUserImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationUserImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationUser implements AuthenticationUser {
  factory _AuthenticationUser(
      {required final String id,
      required final String? email,
      required final String? name,
      required final String? photo,
      required final bool isNewUser}) = _$AuthenticationUserImpl;

  factory _AuthenticationUser.fromJson(Map<String, dynamic> json) =
      _$AuthenticationUserImpl.fromJson;

  @override
  String get id;
  @override
  String? get email;
  @override
  String? get name;
  @override
  String? get photo;
  @override
  bool get isNewUser;

  /// Create a copy of AuthenticationUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthenticationUserImplCopyWith<_$AuthenticationUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
