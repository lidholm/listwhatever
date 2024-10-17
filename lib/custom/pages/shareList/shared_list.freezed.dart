// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shared_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SharedList _$SharedListFromJson(Map<String, dynamic> json) {
  return _SharedList.fromJson(json);
}

/// @nodoc
mixin _$SharedList {
  String? get id => throw _privateConstructorUsedError;
  String get listName => throw _privateConstructorUsedError;
  String get ownerName => throw _privateConstructorUsedError;
  String get ownerUserId => throw _privateConstructorUsedError;
  String get ownerListId => throw _privateConstructorUsedError;
  ShareType get shareType => throw _privateConstructorUsedError;
  ListType get listType => throw _privateConstructorUsedError;

  /// Serializes this SharedList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SharedList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SharedListCopyWith<SharedList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SharedListCopyWith<$Res> {
  factory $SharedListCopyWith(
          SharedList value, $Res Function(SharedList) then) =
      _$SharedListCopyWithImpl<$Res, SharedList>;
  @useResult
  $Res call(
      {String? id,
      String listName,
      String ownerName,
      String ownerUserId,
      String ownerListId,
      ShareType shareType,
      ListType listType});
}

/// @nodoc
class _$SharedListCopyWithImpl<$Res, $Val extends SharedList>
    implements $SharedListCopyWith<$Res> {
  _$SharedListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SharedList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? listName = null,
    Object? ownerName = null,
    Object? ownerUserId = null,
    Object? ownerListId = null,
    Object? shareType = null,
    Object? listType = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      listName: null == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUserId: null == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerListId: null == ownerListId
          ? _value.ownerListId
          : ownerListId // ignore: cast_nullable_to_non_nullable
              as String,
      shareType: null == shareType
          ? _value.shareType
          : shareType // ignore: cast_nullable_to_non_nullable
              as ShareType,
      listType: null == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SharedListImplCopyWith<$Res>
    implements $SharedListCopyWith<$Res> {
  factory _$$SharedListImplCopyWith(
          _$SharedListImpl value, $Res Function(_$SharedListImpl) then) =
      __$$SharedListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String listName,
      String ownerName,
      String ownerUserId,
      String ownerListId,
      ShareType shareType,
      ListType listType});
}

/// @nodoc
class __$$SharedListImplCopyWithImpl<$Res>
    extends _$SharedListCopyWithImpl<$Res, _$SharedListImpl>
    implements _$$SharedListImplCopyWith<$Res> {
  __$$SharedListImplCopyWithImpl(
      _$SharedListImpl _value, $Res Function(_$SharedListImpl) _then)
      : super(_value, _then);

  /// Create a copy of SharedList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? listName = null,
    Object? ownerName = null,
    Object? ownerUserId = null,
    Object? ownerListId = null,
    Object? shareType = null,
    Object? listType = null,
  }) {
    return _then(_$SharedListImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      listName: null == listName
          ? _value.listName
          : listName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerName: null == ownerName
          ? _value.ownerName
          : ownerName // ignore: cast_nullable_to_non_nullable
              as String,
      ownerUserId: null == ownerUserId
          ? _value.ownerUserId
          : ownerUserId // ignore: cast_nullable_to_non_nullable
              as String,
      ownerListId: null == ownerListId
          ? _value.ownerListId
          : ownerListId // ignore: cast_nullable_to_non_nullable
              as String,
      shareType: null == shareType
          ? _value.shareType
          : shareType // ignore: cast_nullable_to_non_nullable
              as ShareType,
      listType: null == listType
          ? _value.listType
          : listType // ignore: cast_nullable_to_non_nullable
              as ListType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SharedListImpl implements _SharedList {
  const _$SharedListImpl(
      {required this.id,
      required this.listName,
      required this.ownerName,
      required this.ownerUserId,
      required this.ownerListId,
      required this.shareType,
      required this.listType});

  factory _$SharedListImpl.fromJson(Map<String, dynamic> json) =>
      _$$SharedListImplFromJson(json);

  @override
  final String? id;
  @override
  final String listName;
  @override
  final String ownerName;
  @override
  final String ownerUserId;
  @override
  final String ownerListId;
  @override
  final ShareType shareType;
  @override
  final ListType listType;

  @override
  String toString() {
    return 'SharedList(id: $id, listName: $listName, ownerName: $ownerName, ownerUserId: $ownerUserId, ownerListId: $ownerListId, shareType: $shareType, listType: $listType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SharedListImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.listName, listName) ||
                other.listName == listName) &&
            (identical(other.ownerName, ownerName) ||
                other.ownerName == ownerName) &&
            (identical(other.ownerUserId, ownerUserId) ||
                other.ownerUserId == ownerUserId) &&
            (identical(other.ownerListId, ownerListId) ||
                other.ownerListId == ownerListId) &&
            (identical(other.shareType, shareType) ||
                other.shareType == shareType) &&
            (identical(other.listType, listType) ||
                other.listType == listType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, listName, ownerName,
      ownerUserId, ownerListId, shareType, listType);

  /// Create a copy of SharedList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SharedListImplCopyWith<_$SharedListImpl> get copyWith =>
      __$$SharedListImplCopyWithImpl<_$SharedListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SharedListImplToJson(
      this,
    );
  }
}

abstract class _SharedList implements SharedList {
  const factory _SharedList(
      {required final String? id,
      required final String listName,
      required final String ownerName,
      required final String ownerUserId,
      required final String ownerListId,
      required final ShareType shareType,
      required final ListType listType}) = _$SharedListImpl;

  factory _SharedList.fromJson(Map<String, dynamic> json) =
      _$SharedListImpl.fromJson;

  @override
  String? get id;
  @override
  String get listName;
  @override
  String get ownerName;
  @override
  String get ownerUserId;
  @override
  String get ownerListId;
  @override
  ShareType get shareType;
  @override
  ListType get listType;

  /// Create a copy of SharedList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SharedListImplCopyWith<_$SharedListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
