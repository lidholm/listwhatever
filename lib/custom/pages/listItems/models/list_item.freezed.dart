// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ListItem _$ListItemFromJson(Map<String, dynamic> json) {
  return _ListItem.fromJson(json);
}

/// @nodoc
mixin _$ListItem {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get info => throw _privateConstructorUsedError;
  List<String> get urls => throw _privateConstructorUsedError;
  DateTime? get datetime => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  LatLong? get latLong => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  Map<String, List<String>> get categories =>
      throw _privateConstructorUsedError;
  String? get latestUpdateUser => throw _privateConstructorUsedError;

  /// Serializes this ListItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListItemCopyWith<ListItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListItemCopyWith<$Res> {
  factory $ListItemCopyWith(ListItem value, $Res Function(ListItem) then) =
      _$ListItemCopyWithImpl<$Res, ListItem>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String? info,
      List<String> urls,
      DateTime? datetime,
      @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
      LatLong? latLong,
      String? address,
      Map<String, List<String>> categories,
      String? latestUpdateUser});

  $LatLongCopyWith<$Res>? get latLong;
}

/// @nodoc
class _$ListItemCopyWithImpl<$Res, $Val extends ListItem>
    implements $ListItemCopyWith<$Res> {
  _$ListItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? info = freezed,
    Object? urls = null,
    Object? datetime = freezed,
    Object? latLong = freezed,
    Object? address = freezed,
    Object? categories = null,
    Object? latestUpdateUser = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      latLong: freezed == latLong
          ? _value.latLong
          : latLong // ignore: cast_nullable_to_non_nullable
              as LatLong?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      latestUpdateUser: freezed == latestUpdateUser
          ? _value.latestUpdateUser
          : latestUpdateUser // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LatLongCopyWith<$Res>? get latLong {
    if (_value.latLong == null) {
      return null;
    }

    return $LatLongCopyWith<$Res>(_value.latLong!, (value) {
      return _then(_value.copyWith(latLong: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ListItemImplCopyWith<$Res>
    implements $ListItemCopyWith<$Res> {
  factory _$$ListItemImplCopyWith(
          _$ListItemImpl value, $Res Function(_$ListItemImpl) then) =
      __$$ListItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String? info,
      List<String> urls,
      DateTime? datetime,
      @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
      LatLong? latLong,
      String? address,
      Map<String, List<String>> categories,
      String? latestUpdateUser});

  @override
  $LatLongCopyWith<$Res>? get latLong;
}

/// @nodoc
class __$$ListItemImplCopyWithImpl<$Res>
    extends _$ListItemCopyWithImpl<$Res, _$ListItemImpl>
    implements _$$ListItemImplCopyWith<$Res> {
  __$$ListItemImplCopyWithImpl(
      _$ListItemImpl _value, $Res Function(_$ListItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? info = freezed,
    Object? urls = null,
    Object? datetime = freezed,
    Object? latLong = freezed,
    Object? address = freezed,
    Object? categories = null,
    Object? latestUpdateUser = freezed,
  }) {
    return _then(_$ListItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      info: freezed == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      datetime: freezed == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      latLong: freezed == latLong
          ? _value.latLong
          : latLong // ignore: cast_nullable_to_non_nullable
              as LatLong?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      latestUpdateUser: freezed == latestUpdateUser
          ? _value.latestUpdateUser
          : latestUpdateUser // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListItemImpl implements _ListItem {
  const _$ListItemImpl(
      {required this.id,
      required this.name,
      this.info = null,
      final List<String> urls = const [],
      this.datetime = null,
      @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
      this.latLong = null,
      this.address = null,
      final Map<String, List<String>> categories = const {},
      this.latestUpdateUser = null})
      : _urls = urls,
        _categories = categories;

  factory _$ListItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListItemImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  @JsonKey()
  final String? info;
  final List<String> _urls;
  @override
  @JsonKey()
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  @JsonKey()
  final DateTime? datetime;
  @override
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  final LatLong? latLong;
  @override
  @JsonKey()
  final String? address;
  final Map<String, List<String>> _categories;
  @override
  @JsonKey()
  Map<String, List<String>> get categories {
    if (_categories is EqualUnmodifiableMapView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categories);
  }

  @override
  @JsonKey()
  final String? latestUpdateUser;

  @override
  String toString() {
    return 'ListItem(id: $id, name: $name, info: $info, urls: $urls, datetime: $datetime, latLong: $latLong, address: $address, categories: $categories, latestUpdateUser: $latestUpdateUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.info, info) || other.info == info) &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.latLong, latLong) || other.latLong == latLong) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.latestUpdateUser, latestUpdateUser) ||
                other.latestUpdateUser == latestUpdateUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      info,
      const DeepCollectionEquality().hash(_urls),
      datetime,
      latLong,
      address,
      const DeepCollectionEquality().hash(_categories),
      latestUpdateUser);

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListItemImplCopyWith<_$ListItemImpl> get copyWith =>
      __$$ListItemImplCopyWithImpl<_$ListItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListItemImplToJson(
      this,
    );
  }
}

abstract class _ListItem implements ListItem {
  const factory _ListItem(
      {required final String? id,
      required final String name,
      final String? info,
      final List<String> urls,
      final DateTime? datetime,
      @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
      final LatLong? latLong,
      final String? address,
      final Map<String, List<String>> categories,
      final String? latestUpdateUser}) = _$ListItemImpl;

  factory _ListItem.fromJson(Map<String, dynamic> json) =
      _$ListItemImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String? get info;
  @override
  List<String> get urls;
  @override
  DateTime? get datetime;
  @override
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  LatLong? get latLong;
  @override
  String? get address;
  @override
  Map<String, List<String>> get categories;
  @override
  String? get latestUpdateUser;

  /// Create a copy of ListItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListItemImplCopyWith<_$ListItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
