// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  $Res call({String? id, String name, ListType type, bool withMap});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ListOfThingsCopyWith<$Res>
    implements $ListOfThingsCopyWith<$Res> {
  factory _$$_ListOfThingsCopyWith(
          _$_ListOfThings value, $Res Function(_$_ListOfThings) then) =
      __$$_ListOfThingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String name, ListType type, bool withMap});
}

/// @nodoc
class __$$_ListOfThingsCopyWithImpl<$Res>
    extends _$ListOfThingsCopyWithImpl<$Res, _$_ListOfThings>
    implements _$$_ListOfThingsCopyWith<$Res> {
  __$$_ListOfThingsCopyWithImpl(
      _$_ListOfThings _value, $Res Function(_$_ListOfThings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? type = null,
    Object? withMap = null,
  }) {
    return _then(_$_ListOfThings(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ListOfThings implements _ListOfThings {
  const _$_ListOfThings(
      {this.id, required this.name, required this.type, this.withMap = false});

  factory _$_ListOfThings.fromJson(Map<String, dynamic> json) =>
      _$$_ListOfThingsFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final ListType type;
  @override
  @JsonKey()
  final bool withMap;

  @override
  String toString() {
    return 'ListOfThings(id: $id, name: $name, type: $type, withMap: $withMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ListOfThings &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.withMap, withMap) || other.withMap == withMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type, withMap);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ListOfThingsCopyWith<_$_ListOfThings> get copyWith =>
      __$$_ListOfThingsCopyWithImpl<_$_ListOfThings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ListOfThingsToJson(
      this,
    );
  }
}

abstract class _ListOfThings implements ListOfThings {
  const factory _ListOfThings(
      {final String? id,
      required final String name,
      required final ListType type,
      final bool withMap}) = _$_ListOfThings;

  factory _ListOfThings.fromJson(Map<String, dynamic> json) =
      _$_ListOfThings.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  ListType get type;
  @override
  bool get withMap;
  @override
  @JsonKey(ignore: true)
  _$$_ListOfThingsCopyWith<_$_ListOfThings> get copyWith =>
      throw _privateConstructorUsedError;
}
