// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'public_list_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PublicListId _$PublicListIdFromJson(Map<String, dynamic> json) {
  return _PublicListId.fromJson(json);
}

/// @nodoc
mixin _$PublicListId {
  String get path => throw _privateConstructorUsedError;
  String get publicListId => throw _privateConstructorUsedError;
  Map<String, bool> get editors => throw _privateConstructorUsedError;
  Map<String, bool> get viewers => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get listId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicListIdCopyWith<PublicListId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicListIdCopyWith<$Res> {
  factory $PublicListIdCopyWith(
          PublicListId value, $Res Function(PublicListId) then) =
      _$PublicListIdCopyWithImpl<$Res, PublicListId>;
  @useResult
  $Res call(
      {String path,
      String publicListId,
      Map<String, bool> editors,
      Map<String, bool> viewers,
      String userId,
      String listId});
}

/// @nodoc
class _$PublicListIdCopyWithImpl<$Res, $Val extends PublicListId>
    implements $PublicListIdCopyWith<$Res> {
  _$PublicListIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? publicListId = null,
    Object? editors = null,
    Object? viewers = null,
    Object? userId = null,
    Object? listId = null,
  }) {
    return _then(_value.copyWith(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      publicListId: null == publicListId
          ? _value.publicListId
          : publicListId // ignore: cast_nullable_to_non_nullable
              as String,
      editors: null == editors
          ? _value.editors
          : editors // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      viewers: null == viewers
          ? _value.viewers
          : viewers // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
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
abstract class _$$_PublicListIdCopyWith<$Res>
    implements $PublicListIdCopyWith<$Res> {
  factory _$$_PublicListIdCopyWith(
          _$_PublicListId value, $Res Function(_$_PublicListId) then) =
      __$$_PublicListIdCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String path,
      String publicListId,
      Map<String, bool> editors,
      Map<String, bool> viewers,
      String userId,
      String listId});
}

/// @nodoc
class __$$_PublicListIdCopyWithImpl<$Res>
    extends _$PublicListIdCopyWithImpl<$Res, _$_PublicListId>
    implements _$$_PublicListIdCopyWith<$Res> {
  __$$_PublicListIdCopyWithImpl(
      _$_PublicListId _value, $Res Function(_$_PublicListId) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? publicListId = null,
    Object? editors = null,
    Object? viewers = null,
    Object? userId = null,
    Object? listId = null,
  }) {
    return _then(_$_PublicListId(
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      publicListId: null == publicListId
          ? _value.publicListId
          : publicListId // ignore: cast_nullable_to_non_nullable
              as String,
      editors: null == editors
          ? _value._editors
          : editors // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
      viewers: null == viewers
          ? _value._viewers
          : viewers // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>,
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
class _$_PublicListId implements _PublicListId {
  const _$_PublicListId(
      {required this.path,
      required this.publicListId,
      required final Map<String, bool> editors,
      required final Map<String, bool> viewers,
      required this.userId,
      required this.listId})
      : _editors = editors,
        _viewers = viewers;

  factory _$_PublicListId.fromJson(Map<String, dynamic> json) =>
      _$$_PublicListIdFromJson(json);

  @override
  final String path;
  @override
  final String publicListId;
  final Map<String, bool> _editors;
  @override
  Map<String, bool> get editors {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_editors);
  }

  final Map<String, bool> _viewers;
  @override
  Map<String, bool> get viewers {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_viewers);
  }

  @override
  final String userId;
  @override
  final String listId;

  @override
  String toString() {
    return 'PublicListId(path: $path, publicListId: $publicListId, editors: $editors, viewers: $viewers, userId: $userId, listId: $listId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PublicListId &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.publicListId, publicListId) ||
                other.publicListId == publicListId) &&
            const DeepCollectionEquality().equals(other._editors, _editors) &&
            const DeepCollectionEquality().equals(other._viewers, _viewers) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.listId, listId) || other.listId == listId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      path,
      publicListId,
      const DeepCollectionEquality().hash(_editors),
      const DeepCollectionEquality().hash(_viewers),
      userId,
      listId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PublicListIdCopyWith<_$_PublicListId> get copyWith =>
      __$$_PublicListIdCopyWithImpl<_$_PublicListId>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PublicListIdToJson(
      this,
    );
  }
}

abstract class _PublicListId implements PublicListId {
  const factory _PublicListId(
      {required final String path,
      required final String publicListId,
      required final Map<String, bool> editors,
      required final Map<String, bool> viewers,
      required final String userId,
      required final String listId}) = _$_PublicListId;

  factory _PublicListId.fromJson(Map<String, dynamic> json) =
      _$_PublicListId.fromJson;

  @override
  String get path;
  @override
  String get publicListId;
  @override
  Map<String, bool> get editors;
  @override
  Map<String, bool> get viewers;
  @override
  String get userId;
  @override
  String get listId;
  @override
  @JsonKey(ignore: true)
  _$$_PublicListIdCopyWith<_$_PublicListId> get copyWith =>
      throw _privateConstructorUsedError;
}
