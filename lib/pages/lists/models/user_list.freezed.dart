// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserList _$UserListFromJson(Map<String, dynamic> json) {
  return _UserList.fromJson(json);
}

/// @nodoc
mixin _$UserList {
  String? get id => throw _privateConstructorUsedError;
  String get listId => throw _privateConstructorUsedError;
  String get listName => throw _privateConstructorUsedError;
  String? get imageFilename => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  bool? get isOwnList => throw _privateConstructorUsedError;

  /// Serializes this UserList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserListCopyWith<UserList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserListCopyWith<$Res> {
  factory $UserListCopyWith(UserList value, $Res Function(UserList) then) =
      _$UserListCopyWithImpl<$Res, UserList>;
  @useResult
  $Res call(
      {String? id,
      String listId,
      String listName,
      String? imageFilename,
      String ownerId,
      bool? isOwnList});
}

/// @nodoc
class _$UserListCopyWithImpl<$Res, $Val extends UserList>
    implements $UserListCopyWith<$Res> {
  _$UserListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? listId = null,
    Object? listName = null,
    Object? imageFilename = freezed,
    Object? ownerId = null,
    Object? isOwnList = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
      listName: null == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      imageFilename: freezed == imageFilename
          ? _value.imageFilename
          : imageFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      isOwnList: freezed == isOwnList
          ? _value.isOwnList
          : isOwnList // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserListImplCopyWith<$Res>
    implements $UserListCopyWith<$Res> {
  factory _$$UserListImplCopyWith(
          _$UserListImpl value, $Res Function(_$UserListImpl) then) =
      __$$UserListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String listId,
      String listName,
      String? imageFilename,
      String ownerId,
      bool? isOwnList});
}

/// @nodoc
class __$$UserListImplCopyWithImpl<$Res>
    extends _$UserListCopyWithImpl<$Res, _$UserListImpl>
    implements _$$UserListImplCopyWith<$Res> {
  __$$UserListImplCopyWithImpl(
      _$UserListImpl _value, $Res Function(_$UserListImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? listId = null,
    Object? listName = null,
    Object? imageFilename = freezed,
    Object? ownerId = null,
    Object? isOwnList = freezed,
  }) {
    return _then(_$UserListImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      listId: null == listId
          ? _value.listId
          : listId // ignore: cast_nullable_to_non_nullable
              as String,
      listName: null == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      imageFilename: freezed == imageFilename
          ? _value.imageFilename
          : imageFilename // ignore: cast_nullable_to_non_nullable
              as String?,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      isOwnList: freezed == isOwnList
          ? _value.isOwnList
          : isOwnList // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserListImpl implements _UserList {
  const _$UserListImpl(
      {required this.id,
      required this.listId,
      required this.listName,
      required this.imageFilename,
      required this.ownerId,
      required this.isOwnList});

  factory _$UserListImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserListImplFromJson(json);

  @override
  final String? id;
  @override
  final String listId;
  @override
  final String listName;
  @override
  final String? imageFilename;
  @override
  final String ownerId;
  @override
  final bool? isOwnList;

  @override
  String toString() {
    return 'UserList(id: $id, listId: $listId, listName: $listName, imageFilename: $imageFilename, ownerId: $ownerId, isOwnList: $isOwnList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.listId, listId) || other.listId == listId) &&
            (identical(other.listName, listName) ||
                other.listName == listName) &&
            (identical(other.imageFilename, imageFilename) ||
                other.imageFilename == imageFilename) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.isOwnList, isOwnList) ||
                other.isOwnList == isOwnList));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, listId, listName, imageFilename, ownerId, isOwnList);

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserListImplCopyWith<_$UserListImpl> get copyWith =>
      __$$UserListImplCopyWithImpl<_$UserListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserListImplToJson(
      this,
    );
  }
}

abstract class _UserList implements UserList {
  const factory _UserList(
      {required final String? id,
      required final String listId,
      required final String listName,
      required final String? imageFilename,
      required final String ownerId,
      required final bool? isOwnList}) = _$UserListImpl;

  factory _UserList.fromJson(Map<String, dynamic> json) =
      _$UserListImpl.fromJson;

  @override
  String? get id;
  @override
  String get listId;
  @override
  String get listName;
  @override
  String? get imageFilename;
  @override
  String get ownerId;
  @override
  bool? get isOwnList;

  /// Create a copy of UserList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserListImplCopyWith<_$UserListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
