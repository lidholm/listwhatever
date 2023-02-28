// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'list_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListItem _$ListItemFromJson(Map<String, dynamic> json) {
  return _ListItem.fromJson(json);
}

/// @nodoc
mixin _$ListItem {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Map<String, List<String>> get categories =>
      throw _privateConstructorUsedError;
  String? get searchPhrase => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  LatLong? get latLong => throw _privateConstructorUsedError;
  List<String> get urls => throw _privateConstructorUsedError;
  String get info => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      Map<String, List<String>> categories,
      String? searchPhrase,
      String? address,
      @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
          LatLong? latLong,
      List<String> urls,
      String info});

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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? categories = null,
    Object? searchPhrase = freezed,
    Object? address = freezed,
    Object? latLong = freezed,
    Object? urls = null,
    Object? info = null,
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
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      searchPhrase: freezed == searchPhrase
          ? _value.searchPhrase
          : searchPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latLong: freezed == latLong
          ? _value.latLong
          : latLong // ignore: cast_nullable_to_non_nullable
              as LatLong?,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

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
abstract class _$$_ListItemCopyWith<$Res> implements $ListItemCopyWith<$Res> {
  factory _$$_ListItemCopyWith(
          _$_ListItem value, $Res Function(_$_ListItem) then) =
      __$$_ListItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      Map<String, List<String>> categories,
      String? searchPhrase,
      String? address,
      @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
          LatLong? latLong,
      List<String> urls,
      String info});

  @override
  $LatLongCopyWith<$Res>? get latLong;
}

/// @nodoc
class __$$_ListItemCopyWithImpl<$Res>
    extends _$ListItemCopyWithImpl<$Res, _$_ListItem>
    implements _$$_ListItemCopyWith<$Res> {
  __$$_ListItemCopyWithImpl(
      _$_ListItem _value, $Res Function(_$_ListItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? categories = null,
    Object? searchPhrase = freezed,
    Object? address = freezed,
    Object? latLong = freezed,
    Object? urls = null,
    Object? info = null,
  }) {
    return _then(_$_ListItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
      searchPhrase: freezed == searchPhrase
          ? _value.searchPhrase
          : searchPhrase // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      latLong: freezed == latLong
          ? _value.latLong
          : latLong // ignore: cast_nullable_to_non_nullable
              as LatLong?,
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      info: null == info
          ? _value.info
          : info // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListItem implements _ListItem {
  const _$_ListItem(
      {this.id,
      required this.name,
      required final Map<String, List<String>> categories,
      this.searchPhrase = null,
      this.address = null,
      @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
          this.latLong = null,
      final List<String> urls = const <String>[],
      this.info = ''})
      : _categories = categories,
        _urls = urls;

  factory _$_ListItem.fromJson(Map<String, dynamic> json) =>
      _$$_ListItemFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  final Map<String, List<String>> _categories;
  @override
  Map<String, List<String>> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_categories);
  }

  @override
  @JsonKey()
  final String? searchPhrase;
  @override
  @JsonKey()
  final String? address;
  @override
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  final LatLong? latLong;
  final List<String> _urls;
  @override
  @JsonKey()
  List<String> get urls {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  @JsonKey()
  final String info;

  @override
  String toString() {
    return 'ListItem(id: $id, name: $name, categories: $categories, searchPhrase: $searchPhrase, address: $address, latLong: $latLong, urls: $urls, info: $info)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.searchPhrase, searchPhrase) ||
                other.searchPhrase == searchPhrase) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latLong, latLong) || other.latLong == latLong) &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.info, info) || other.info == info));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      const DeepCollectionEquality().hash(_categories),
      searchPhrase,
      address,
      latLong,
      const DeepCollectionEquality().hash(_urls),
      info);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListItemCopyWith<_$_ListItem> get copyWith =>
      __$$_ListItemCopyWithImpl<_$_ListItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListItemToJson(
      this,
    );
  }
}

abstract class _ListItem implements ListItem {
  const factory _ListItem(
      {final String? id,
      required final String name,
      required final Map<String, List<String>> categories,
      final String? searchPhrase,
      final String? address,
      @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
          final LatLong? latLong,
      final List<String> urls,
      final String info}) = _$_ListItem;

  factory _ListItem.fromJson(Map<String, dynamic> json) = _$_ListItem.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  Map<String, List<String>> get categories;
  @override
  String? get searchPhrase;
  @override
  String? get address;
  @override
  @JsonKey(fromJson: _fromJsonGeoPoint, toJson: _toJsonGeoPoint)
  LatLong? get latLong;
  @override
  List<String> get urls;
  @override
  String get info;
  @override
  @JsonKey(ignore: true)
  _$$_ListItemCopyWith<_$_ListItem> get copyWith =>
      throw _privateConstructorUsedError;
}
