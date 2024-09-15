// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_location_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SearchLocationResponse _$SearchLocationResponseFromJson(
    Map<String, dynamic> json) {
  return _SearchLocationResponse.fromJson(json);
}

/// @nodoc
mixin _$SearchLocationResponse {
  String get address => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;
  double get long => throw _privateConstructorUsedError;
  String get searchPhrase => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchLocationResponseCopyWith<SearchLocationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchLocationResponseCopyWith<$Res> {
  factory $SearchLocationResponseCopyWith(SearchLocationResponse value,
          $Res Function(SearchLocationResponse) then) =
      _$SearchLocationResponseCopyWithImpl<$Res, SearchLocationResponse>;
  @useResult
  $Res call({String address, double lat, double long, String searchPhrase});
}

/// @nodoc
class _$SearchLocationResponseCopyWithImpl<$Res,
        $Val extends SearchLocationResponse>
    implements $SearchLocationResponseCopyWith<$Res> {
  _$SearchLocationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? lat = null,
    Object? long = null,
    Object? searchPhrase = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      searchPhrase: null == searchPhrase
          ? _value.searchPhrase
          : searchPhrase // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchLocationResponseImplCopyWith<$Res>
    implements $SearchLocationResponseCopyWith<$Res> {
  factory _$$SearchLocationResponseImplCopyWith(
          _$SearchLocationResponseImpl value,
          $Res Function(_$SearchLocationResponseImpl) then) =
      __$$SearchLocationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String address, double lat, double long, String searchPhrase});
}

/// @nodoc
class __$$SearchLocationResponseImplCopyWithImpl<$Res>
    extends _$SearchLocationResponseCopyWithImpl<$Res,
        _$SearchLocationResponseImpl>
    implements _$$SearchLocationResponseImplCopyWith<$Res> {
  __$$SearchLocationResponseImplCopyWithImpl(
      _$SearchLocationResponseImpl _value,
      $Res Function(_$SearchLocationResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? lat = null,
    Object? long = null,
    Object? searchPhrase = null,
  }) {
    return _then(_$SearchLocationResponseImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double,
      searchPhrase: null == searchPhrase
          ? _value.searchPhrase
          : searchPhrase // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SearchLocationResponseImpl implements _SearchLocationResponse {
  const _$SearchLocationResponseImpl(
      {required this.address,
      required this.lat,
      required this.long,
      required this.searchPhrase});

  factory _$SearchLocationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SearchLocationResponseImplFromJson(json);

  @override
  final String address;
  @override
  final double lat;
  @override
  final double long;
  @override
  final String searchPhrase;

  @override
  String toString() {
    return 'SearchLocationResponse(address: $address, lat: $lat, long: $long, searchPhrase: $searchPhrase)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchLocationResponseImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.searchPhrase, searchPhrase) ||
                other.searchPhrase == searchPhrase));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, address, lat, long, searchPhrase);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchLocationResponseImplCopyWith<_$SearchLocationResponseImpl>
      get copyWith => __$$SearchLocationResponseImplCopyWithImpl<
          _$SearchLocationResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SearchLocationResponseImplToJson(
      this,
    );
  }
}

abstract class _SearchLocationResponse implements SearchLocationResponse {
  const factory _SearchLocationResponse(
      {required final String address,
      required final double lat,
      required final double long,
      required final String searchPhrase}) = _$SearchLocationResponseImpl;

  factory _SearchLocationResponse.fromJson(Map<String, dynamic> json) =
      _$SearchLocationResponseImpl.fromJson;

  @override
  String get address;
  @override
  double get lat;
  @override
  double get long;
  @override
  String get searchPhrase;
  @override
  @JsonKey(ignore: true)
  _$$SearchLocationResponseImplCopyWith<_$SearchLocationResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
