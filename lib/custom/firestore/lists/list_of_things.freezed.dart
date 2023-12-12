// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_of_things.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ListOfThings _$ListOfThingsFromJson(Map<String, dynamic> json) {
  return _ListOfThings.fromJson(json);
}

/// @nodoc
mixin _$ListOfThings {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  ListType get type => throw _privateConstructorUsedError;
  bool get withMap => throw _privateConstructorUsedError;
  bool get withDates => throw _privateConstructorUsedError;
  bool get withTimes => throw _privateConstructorUsedError;
  bool get shared => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ListOfThingsCopyWith<ListOfThings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListOfThingsCopyWith<$Res> {
  factory $ListOfThingsCopyWith(
          ListOfThings value, $Res Function(ListOfThings) then) =
      _$ListOfThingsCopyWithImpl<$Res, ListOfThings>;
  @useResult
  $Res call(
      {String? id,
      String name,
      ListType type,
      bool withMap,
      bool withDates,
      bool withTimes,
      bool shared});
}

/// @nodoc
class _$ListOfThingsCopyWithImpl<$Res, $Val extends ListOfThings>
    implements $ListOfThingsCopyWith<$Res> {
  _$ListOfThingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? withMap = null,
    Object? withDates = null,
    Object? withTimes = null,
    Object? shared = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ListType,
      withMap: null == withMap
          ? _value.withMap
          : withMap // ignore: cast_nullable_to_non_nullable
              as bool,
      withDates: null == withDates
          ? _value.withDates
          : withDates // ignore: cast_nullable_to_non_nullable
              as bool,
      withTimes: null == withTimes
          ? _value.withTimes
          : withTimes // ignore: cast_nullable_to_non_nullable
              as bool,
      shared: null == shared
          ? _value.shared
          : shared // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ListOfThingsImplCopyWith<$Res>
    implements $ListOfThingsCopyWith<$Res> {
  factory _$$ListOfThingsImplCopyWith(
          _$ListOfThingsImpl value, $Res Function(_$ListOfThingsImpl) then) =
      __$$ListOfThingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      ListType type,
      bool withMap,
      bool withDates,
      bool withTimes,
      bool shared});
}

/// @nodoc
class __$$ListOfThingsImplCopyWithImpl<$Res>
    extends _$ListOfThingsCopyWithImpl<$Res, _$ListOfThingsImpl>
    implements _$$ListOfThingsImplCopyWith<$Res> {
  __$$ListOfThingsImplCopyWithImpl(
      _$ListOfThingsImpl _value, $Res Function(_$ListOfThingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? withMap = null,
    Object? withDates = null,
    Object? withTimes = null,
    Object? shared = null,
  }) {
    return _then(_$ListOfThingsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ListType,
      withMap: null == withMap
          ? _value.withMap
          : withMap // ignore: cast_nullable_to_non_nullable
              as bool,
      withDates: null == withDates
          ? _value.withDates
          : withDates // ignore: cast_nullable_to_non_nullable
              as bool,
      withTimes: null == withTimes
          ? _value.withTimes
          : withTimes // ignore: cast_nullable_to_non_nullable
              as bool,
      shared: null == shared
          ? _value.shared
          : shared // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ListOfThingsImpl implements _ListOfThings {
  const _$ListOfThingsImpl(
      {required this.id,
      required this.name,
      required this.type,
      required this.withMap,
      required this.withDates,
      required this.withTimes,
      required this.shared});

  factory _$ListOfThingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ListOfThingsImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final ListType type;
  @override
  final bool withMap;
  @override
  final bool withDates;
  @override
  final bool withTimes;
  @override
  final bool shared;

  @override
  String toString() {
    return 'ListOfThings(id: $id, name: $name, type: $type, withMap: $withMap, withDates: $withDates, withTimes: $withTimes, shared: $shared)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListOfThingsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.withMap, withMap) || other.withMap == withMap) &&
            (identical(other.withDates, withDates) ||
                other.withDates == withDates) &&
            (identical(other.withTimes, withTimes) ||
                other.withTimes == withTimes) &&
            (identical(other.shared, shared) || other.shared == shared));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, type, withMap, withDates, withTimes, shared);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ListOfThingsImplCopyWith<_$ListOfThingsImpl> get copyWith =>
      __$$ListOfThingsImplCopyWithImpl<_$ListOfThingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ListOfThingsImplToJson(
      this,
    );
  }
}

abstract class _ListOfThings implements ListOfThings {
  const factory _ListOfThings(
      {required final String? id,
      required final String name,
      required final ListType type,
      required final bool withMap,
      required final bool withDates,
      required final bool withTimes,
      required final bool shared}) = _$ListOfThingsImpl;

  factory _ListOfThings.fromJson(Map<String, dynamic> json) =
      _$ListOfThingsImpl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  ListType get type;
  @override
  bool get withMap;
  @override
  bool get withDates;
  @override
  bool get withTimes;
  @override
  bool get shared;
  @override
  @JsonKey(ignore: true)
  _$$ListOfThingsImplCopyWith<_$ListOfThingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
