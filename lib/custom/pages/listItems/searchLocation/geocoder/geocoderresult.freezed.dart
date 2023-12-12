// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocoderresult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GeocoderResult _$GeocoderResultFromJson(Map<String, dynamic> json) {
  return _GeocoderResult.fromJson(json);
}

/// @nodoc
mixin _$GeocoderResult {
  @JsonKey(name: 'address_components')
  List<AddressComponent> get addressComponents =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_address')
  String get formattedAddress => throw _privateConstructorUsedError;
  Geometry get geometry => throw _privateConstructorUsedError;
  @JsonKey(name: 'partial_match')
  bool get partialMatch => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_id')
  String get placeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'plus_code')
  PlusCode get plusCode => throw _privateConstructorUsedError;
  List<String> get types => throw _privateConstructorUsedError;
  String get searchPhrase => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeocoderResultCopyWith<GeocoderResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeocoderResultCopyWith<$Res> {
  factory $GeocoderResultCopyWith(
          GeocoderResult value, $Res Function(GeocoderResult) then) =
      _$GeocoderResultCopyWithImpl<$Res, GeocoderResult>;
  @useResult
  $Res call(
      {@JsonKey(name: 'address_components')
      List<AddressComponent> addressComponents,
      @JsonKey(name: 'formatted_address') String formattedAddress,
      Geometry geometry,
      @JsonKey(name: 'partial_match') bool partialMatch,
      @JsonKey(name: 'place_id') String placeId,
      @JsonKey(name: 'plus_code') PlusCode plusCode,
      List<String> types,
      String searchPhrase});

  $GeometryCopyWith<$Res> get geometry;
  $PlusCodeCopyWith<$Res> get plusCode;
}

/// @nodoc
class _$GeocoderResultCopyWithImpl<$Res, $Val extends GeocoderResult>
    implements $GeocoderResultCopyWith<$Res> {
  _$GeocoderResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressComponents = null,
    Object? formattedAddress = null,
    Object? geometry = null,
    Object? partialMatch = null,
    Object? placeId = null,
    Object? plusCode = null,
    Object? types = null,
    Object? searchPhrase = null,
  }) {
    return _then(_value.copyWith(
      addressComponents: null == addressComponents
          ? _value.addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
      partialMatch: null == partialMatch
          ? _value.partialMatch
          : partialMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      plusCode: null == plusCode
          ? _value.plusCode
          : plusCode // ignore: cast_nullable_to_non_nullable
              as PlusCode,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchPhrase: null == searchPhrase
          ? _value.searchPhrase
          : searchPhrase // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res> get geometry {
    return $GeometryCopyWith<$Res>(_value.geometry, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PlusCodeCopyWith<$Res> get plusCode {
    return $PlusCodeCopyWith<$Res>(_value.plusCode, (value) {
      return _then(_value.copyWith(plusCode: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GeocoderResultCopyWith<$Res>
    implements $GeocoderResultCopyWith<$Res> {
  factory _$$_GeocoderResultCopyWith(
          _$_GeocoderResult value, $Res Function(_$_GeocoderResult) then) =
      __$$_GeocoderResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'address_components')
      List<AddressComponent> addressComponents,
      @JsonKey(name: 'formatted_address') String formattedAddress,
      Geometry geometry,
      @JsonKey(name: 'partial_match') bool partialMatch,
      @JsonKey(name: 'place_id') String placeId,
      @JsonKey(name: 'plus_code') PlusCode plusCode,
      List<String> types,
      String searchPhrase});

  @override
  $GeometryCopyWith<$Res> get geometry;
  @override
  $PlusCodeCopyWith<$Res> get plusCode;
}

/// @nodoc
class __$$_GeocoderResultCopyWithImpl<$Res>
    extends _$GeocoderResultCopyWithImpl<$Res, _$_GeocoderResult>
    implements _$$_GeocoderResultCopyWith<$Res> {
  __$$_GeocoderResultCopyWithImpl(
      _$_GeocoderResult _value, $Res Function(_$_GeocoderResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressComponents = null,
    Object? formattedAddress = null,
    Object? geometry = null,
    Object? partialMatch = null,
    Object? placeId = null,
    Object? plusCode = null,
    Object? types = null,
    Object? searchPhrase = null,
  }) {
    return _then(_$_GeocoderResult(
      addressComponents: null == addressComponents
          ? _value._addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
      geometry: null == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry,
      partialMatch: null == partialMatch
          ? _value.partialMatch
          : partialMatch // ignore: cast_nullable_to_non_nullable
              as bool,
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      plusCode: null == plusCode
          ? _value.plusCode
          : plusCode // ignore: cast_nullable_to_non_nullable
              as PlusCode,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>,
      searchPhrase: null == searchPhrase
          ? _value.searchPhrase
          : searchPhrase // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GeocoderResult implements _GeocoderResult {
  _$_GeocoderResult(
      {@JsonKey(name: 'address_components')
      required final List<AddressComponent> addressComponents,
      @JsonKey(name: 'formatted_address') required this.formattedAddress,
      required this.geometry,
      @JsonKey(name: 'partial_match') required this.partialMatch,
      @JsonKey(name: 'place_id') required this.placeId,
      @JsonKey(name: 'plus_code') required this.plusCode,
      required final List<String> types,
      this.searchPhrase = ''})
      : _addressComponents = addressComponents,
        _types = types;

  factory _$_GeocoderResult.fromJson(Map<String, dynamic> json) =>
      _$$_GeocoderResultFromJson(json);

  final List<AddressComponent> _addressComponents;
  @override
  @JsonKey(name: 'address_components')
  List<AddressComponent> get addressComponents {
    if (_addressComponents is EqualUnmodifiableListView)
      return _addressComponents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addressComponents);
  }

  @override
  @JsonKey(name: 'formatted_address')
  final String formattedAddress;
  @override
  final Geometry geometry;
  @override
  @JsonKey(name: 'partial_match')
  final bool partialMatch;
  @override
  @JsonKey(name: 'place_id')
  final String placeId;
  @override
  @JsonKey(name: 'plus_code')
  final PlusCode plusCode;
  final List<String> _types;
  @override
  List<String> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  @JsonKey()
  final String searchPhrase;

  @override
  String toString() {
    return 'GeocoderResult(addressComponents: $addressComponents, formattedAddress: $formattedAddress, geometry: $geometry, partialMatch: $partialMatch, placeId: $placeId, plusCode: $plusCode, types: $types, searchPhrase: $searchPhrase)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GeocoderResult &&
            const DeepCollectionEquality()
                .equals(other._addressComponents, _addressComponents) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.partialMatch, partialMatch) ||
                other.partialMatch == partialMatch) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.plusCode, plusCode) ||
                other.plusCode == plusCode) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.searchPhrase, searchPhrase) ||
                other.searchPhrase == searchPhrase));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_addressComponents),
      formattedAddress,
      geometry,
      partialMatch,
      placeId,
      plusCode,
      const DeepCollectionEquality().hash(_types),
      searchPhrase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeocoderResultCopyWith<_$_GeocoderResult> get copyWith =>
      __$$_GeocoderResultCopyWithImpl<_$_GeocoderResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeocoderResultToJson(
      this,
    );
  }
}

abstract class _GeocoderResult implements GeocoderResult {
  factory _GeocoderResult(
      {@JsonKey(name: 'address_components')
      required final List<AddressComponent> addressComponents,
      @JsonKey(name: 'formatted_address')
      required final String formattedAddress,
      required final Geometry geometry,
      @JsonKey(name: 'partial_match') required final bool partialMatch,
      @JsonKey(name: 'place_id') required final String placeId,
      @JsonKey(name: 'plus_code') required final PlusCode plusCode,
      required final List<String> types,
      final String searchPhrase}) = _$_GeocoderResult;

  factory _GeocoderResult.fromJson(Map<String, dynamic> json) =
      _$_GeocoderResult.fromJson;

  @override
  @JsonKey(name: 'address_components')
  List<AddressComponent> get addressComponents;
  @override
  @JsonKey(name: 'formatted_address')
  String get formattedAddress;
  @override
  Geometry get geometry;
  @override
  @JsonKey(name: 'partial_match')
  bool get partialMatch;
  @override
  @JsonKey(name: 'place_id')
  String get placeId;
  @override
  @JsonKey(name: 'plus_code')
  PlusCode get plusCode;
  @override
  List<String> get types;
  @override
  String get searchPhrase;
  @override
  @JsonKey(ignore: true)
  _$$_GeocoderResultCopyWith<_$_GeocoderResult> get copyWith =>
      throw _privateConstructorUsedError;
}
