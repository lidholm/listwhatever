// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CurrentUser _$CurrentUserFromJson(Map<String, dynamic> json) {
  return _CurrentUser.fromJson(json);
}

/// @nodoc
mixin _$CurrentUser {
  String get uid => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJsonIsAdmin, toJson: _toJsonIsAdmin)
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJsonSettings, toJson: _toJsonSettings)
  Settings get settings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrentUserCopyWith<CurrentUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentUserCopyWith<$Res> {
  factory $CurrentUserCopyWith(
          CurrentUser value, $Res Function(CurrentUser) then) =
      _$CurrentUserCopyWithImpl<$Res, CurrentUser>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String name,
      @JsonKey(fromJson: _fromJsonIsAdmin, toJson: _toJsonIsAdmin) bool isAdmin,
      @JsonKey(fromJson: _fromJsonSettings, toJson: _toJsonSettings)
      Settings settings});

  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class _$CurrentUserCopyWithImpl<$Res, $Val extends CurrentUser>
    implements $CurrentUserCopyWith<$Res> {
  _$CurrentUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? name = null,
    Object? isAdmin = null,
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingsCopyWith<$Res> get settings {
    return $SettingsCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CurrentUserCopyWith<$Res>
    implements $CurrentUserCopyWith<$Res> {
  factory _$$_CurrentUserCopyWith(
          _$_CurrentUser value, $Res Function(_$_CurrentUser) then) =
      __$$_CurrentUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String name,
      @JsonKey(fromJson: _fromJsonIsAdmin, toJson: _toJsonIsAdmin) bool isAdmin,
      @JsonKey(fromJson: _fromJsonSettings, toJson: _toJsonSettings)
      Settings settings});

  @override
  $SettingsCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_CurrentUserCopyWithImpl<$Res>
    extends _$CurrentUserCopyWithImpl<$Res, _$_CurrentUser>
    implements _$$_CurrentUserCopyWith<$Res> {
  __$$_CurrentUserCopyWithImpl(
      _$_CurrentUser _value, $Res Function(_$_CurrentUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? name = null,
    Object? isAdmin = null,
    Object? settings = null,
  }) {
    return _then(_$_CurrentUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Settings,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CurrentUser implements _CurrentUser {
  _$_CurrentUser(
      {required this.uid,
      required this.email,
      required this.name,
      @JsonKey(fromJson: _fromJsonIsAdmin, toJson: _toJsonIsAdmin)
      required this.isAdmin,
      @JsonKey(fromJson: _fromJsonSettings, toJson: _toJsonSettings)
      required this.settings});

  factory _$_CurrentUser.fromJson(Map<String, dynamic> json) =>
      _$$_CurrentUserFromJson(json);

  @override
  final String uid;
  @override
  final String email;
  @override
  final String name;
  @override
  @JsonKey(fromJson: _fromJsonIsAdmin, toJson: _toJsonIsAdmin)
  final bool isAdmin;
  @override
  @JsonKey(fromJson: _fromJsonSettings, toJson: _toJsonSettings)
  final Settings settings;

  @override
  String toString() {
    return 'CurrentUser(uid: $uid, email: $email, name: $name, isAdmin: $isAdmin, settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CurrentUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, email, name, isAdmin, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrentUserCopyWith<_$_CurrentUser> get copyWith =>
      __$$_CurrentUserCopyWithImpl<_$_CurrentUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrentUserToJson(
      this,
    );
  }
}

abstract class _CurrentUser implements CurrentUser {
  factory _CurrentUser(
      {required final String uid,
      required final String email,
      required final String name,
      @JsonKey(fromJson: _fromJsonIsAdmin, toJson: _toJsonIsAdmin)
      required final bool isAdmin,
      @JsonKey(fromJson: _fromJsonSettings, toJson: _toJsonSettings)
      required final Settings settings}) = _$_CurrentUser;

  factory _CurrentUser.fromJson(Map<String, dynamic> json) =
      _$_CurrentUser.fromJson;

  @override
  String get uid;
  @override
  String get email;
  @override
  String get name;
  @override
  @JsonKey(fromJson: _fromJsonIsAdmin, toJson: _toJsonIsAdmin)
  bool get isAdmin;
  @override
  @JsonKey(fromJson: _fromJsonSettings, toJson: _toJsonSettings)
  Settings get settings;
  @override
  @JsonKey(ignore: true)
  _$$_CurrentUserCopyWith<_$_CurrentUser> get copyWith =>
      throw _privateConstructorUsedError;
}
