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
  String get actualListId => throw _privateConstructorUsedError;
  String get listName => throw _privateConstructorUsedError;
  ListType get listType => throw _privateConstructorUsedError;
  String get imageFilename => throw _privateConstructorUsedError;
  String get ownerId => throw _privateConstructorUsedError;
  bool? get isOwnList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      String actualListId,
      String listName,
      ListType listType,
      String imageFilename,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? actualListId = null,
    Object? listName = null,
    Object? listType = null,
    Object? imageFilename = null,
    Object? ownerId = null,
    Object? isOwnList = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      actualListId: null == actualListId
          ? _value.actualListId
          : actualListId // ignore: cast_nullable_to_non_nullable
              as String,
      listName: null == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      listType: null == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
      imageFilename: null == imageFilename
          ? _value.imageFilename
          : imageFilename // ignore: cast_nullable_to_non_nullable
              as String,
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
      String actualListId,
      String listName,
      ListType listType,
      String imageFilename,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? actualListId = null,
    Object? listName = null,
    Object? listType = null,
    Object? imageFilename = null,
    Object? ownerId = null,
    Object? isOwnList = freezed,
  }) {
    return _then(_$UserListImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      actualListId: null == actualListId
          ? _value.actualListId
          : actualListId // ignore: cast_nullable_to_non_nullable
              as String,
      listName: null == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      listType: null == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
      imageFilename: null == imageFilename
          ? _value.imageFilename
          : imageFilename // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.actualListId,
      required this.listName,
      required this.listType,
      required this.imageFilename,
      required this.ownerId,
      required this.isOwnList});

  factory _$UserListImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserListImplFromJson(json);

  @override
  final String? id;
  @override
  final String actualListId;
  @override
  final String listName;
  @override
  final ListType listType;
  @override
  final String imageFilename;
  @override
  final String ownerId;
  @override
  final bool? isOwnList;

  @override
  String toString() {
    return 'UserList(id: $id, actualListId: $actualListId, listName: $listName, listType: $listType, imageFilename: $imageFilename, ownerId: $ownerId, isOwnList: $isOwnList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actualListId, actualListId) ||
                other.actualListId == actualListId) &&
            (identical(other.listName, listName) ||
                other.listName == listName) &&
            (identical(other.listType, listType) ||
                other.listType == listType) &&
            (identical(other.imageFilename, imageFilename) ||
                other.imageFilename == imageFilename) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.isOwnList, isOwnList) ||
                other.isOwnList == isOwnList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, actualListId, listName,
      listType, imageFilename, ownerId, isOwnList);

  @JsonKey(ignore: true)
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
      required final String actualListId,
      required final String listName,
      required final ListType listType,
      required final String imageFilename,
      required final String ownerId,
      required final bool? isOwnList}) = _$UserListImpl;

  factory _UserList.fromJson(Map<String, dynamic> json) =
      _$UserListImpl.fromJson;

  @override
  String? get id;
  @override
  String get actualListId;
  @override
  String get listName;
  @override
  ListType get listType;
  @override
  String get imageFilename;
  @override
  String get ownerId;
  @override
  bool? get isOwnList;
  @override
  @JsonKey(ignore: true)
  _$$UserListImplCopyWith<_$UserListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
