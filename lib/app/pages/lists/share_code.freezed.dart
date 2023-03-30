// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'share_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShareCode _$ShareCodeFromJson(Map<String, dynamic> json) {
  return _ShareCode.fromJson(json);
}

/// @nodoc
mixin _$ShareCode {
  String get path => throw _privateConstructorUsedError;
  String get shareCode => throw _privateConstructorUsedError;
  List<String> get users => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get listId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShareCodeCopyWith<ShareCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareCodeCopyWith<$Res> {
  factory $ShareCodeCopyWith(ShareCode value, $Res Function(ShareCode) then) =
      _$ShareCodeCopyWithImpl<$Res, ShareCode>;
  @useResult
  $Res call(
      {String path,
      String shareCode,
      List<String> users,
      String userId,
      String listId});
}

/// @nodoc
class _$ShareCodeCopyWithImpl<$Res, $Val extends ShareCode>
    implements $ShareCodeCopyWith<$Res> {
  _$ShareCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? shareCode = null,
    Object? users = null,
    Object? userId = null,
    Object? listId = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      shareCode: null == shareCode
          ? _value.shareCode
          : shareCode // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShareCodeCopyWith<$Res> implements $ShareCodeCopyWith<$Res> {
  factory _$$_ShareCodeCopyWith(
          _$_ShareCode value, $Res Function(_$_ShareCode) then) =
      __$$_ShareCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String path,
      String shareCode,
      List<String> users,
      String userId,
      String listId});
}

/// @nodoc
class __$$_ShareCodeCopyWithImpl<$Res>
    extends _$ShareCodeCopyWithImpl<$Res, _$_ShareCode>
    implements _$$_ShareCodeCopyWith<$Res> {
  __$$_ShareCodeCopyWithImpl(
      _$_ShareCode _value, $Res Function(_$_ShareCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? shareCode = null,
    Object? users = null,
    Object? userId = null,
    Object? listId = null,
  }) {
    return _then(_$_ShareCode(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      shareCode: null == shareCode
          ? _value.shareCode
          : shareCode // ignore: cast_nullable_to_non_nullable
              as String,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<String>,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShareCode implements _ShareCode {
  const _$_ShareCode(
      {required this.path,
      required this.shareCode,
      required final List<String> users,
      required this.userId,
      required this.listId})
      : _users = users;

  factory _$_ShareCode.fromJson(Map<String, dynamic> json) =>
      _$$_ShareCodeFromJson(json);

  @override
  final String path;
  @override
  final String shareCode;
  final List<String> _users;
  @override
  List<String> get users {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  final String userId;
  @override
  final String listId;

  @override
  String toString() {
    return 'ShareCode(path: $path, shareCode: $shareCode, users: $users, userId: $userId, listId: $listId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShareCode &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.shareCode, shareCode) ||
                other.shareCode == shareCode) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.listId, listId) || other.listId == listId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path, shareCode,
      const DeepCollectionEquality().hash(_users), userId, listId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShareCodeCopyWith<_$_ShareCode> get copyWith =>
      __$$_ShareCodeCopyWithImpl<_$_ShareCode>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShareCodeToJson(
      this,
    );
  }
}

abstract class _ShareCode implements ShareCode {
  const factory _ShareCode(
      {required final String path,
      required final String shareCode,
      required final List<String> users,
      required final String userId,
      required final String listId}) = _$_ShareCode;

  factory _ShareCode.fromJson(Map<String, dynamic> json) =
      _$_ShareCode.fromJson;

  @override
  String get path;
  @override
  String get shareCode;
  @override
  List<String> get users;
  @override
  String get userId;
  @override
  String get listId;
  @override
  @JsonKey(ignore: true)
  _$$_ShareCodeCopyWith<_$_ShareCode> get copyWith =>
      throw _privateConstructorUsedError;
}
