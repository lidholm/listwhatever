// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_input_section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormInputSection {
  String get name => throw _privateConstructorUsedError;
  FormAxisDirection get direction => throw _privateConstructorUsedError;
  bool get showBorder => throw _privateConstructorUsedError;

  /// Create a copy of FormInputSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormInputSectionCopyWith<FormInputSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormInputSectionCopyWith<$Res> {
  factory $FormInputSectionCopyWith(
          FormInputSection value, $Res Function(FormInputSection) then) =
      _$FormInputSectionCopyWithImpl<$Res, FormInputSection>;
  @useResult
  $Res call({String name, FormAxisDirection direction, bool showBorder});
}

/// @nodoc
class _$FormInputSectionCopyWithImpl<$Res, $Val extends FormInputSection>
    implements $FormInputSectionCopyWith<$Res> {
  _$FormInputSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormInputSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? direction = null,
    Object? showBorder = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as FormAxisDirection,
      showBorder: null == showBorder
          ? _value.showBorder
          : showBorder // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormInputSectionImplCopyWith<$Res>
    implements $FormInputSectionCopyWith<$Res> {
  factory _$$FormInputSectionImplCopyWith(_$FormInputSectionImpl value,
          $Res Function(_$FormInputSectionImpl) then) =
      __$$FormInputSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, FormAxisDirection direction, bool showBorder});
}

/// @nodoc
class __$$FormInputSectionImplCopyWithImpl<$Res>
    extends _$FormInputSectionCopyWithImpl<$Res, _$FormInputSectionImpl>
    implements _$$FormInputSectionImplCopyWith<$Res> {
  __$$FormInputSectionImplCopyWithImpl(_$FormInputSectionImpl _value,
      $Res Function(_$FormInputSectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? direction = null,
    Object? showBorder = null,
  }) {
    return _then(_$FormInputSectionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as FormAxisDirection,
      showBorder: null == showBorder
          ? _value.showBorder
          : showBorder // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FormInputSectionImpl implements _FormInputSection {
  _$FormInputSectionImpl(
      {required this.name, required this.direction, required this.showBorder});

  @override
  final String name;
  @override
  final FormAxisDirection direction;
  @override
  final bool showBorder;

  @override
  String toString() {
    return 'FormInputSection(name: $name, direction: $direction, showBorder: $showBorder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputSectionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.showBorder, showBorder) ||
                other.showBorder == showBorder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, direction, showBorder);

  /// Create a copy of FormInputSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputSectionImplCopyWith<_$FormInputSectionImpl> get copyWith =>
      __$$FormInputSectionImplCopyWithImpl<_$FormInputSectionImpl>(
          this, _$identity);
}

abstract class _FormInputSection implements FormInputSection {
  factory _FormInputSection(
      {required final String name,
      required final FormAxisDirection direction,
      required final bool showBorder}) = _$FormInputSectionImpl;

  @override
  String get name;
  @override
  FormAxisDirection get direction;
  @override
  bool get showBorder;

  /// Create a copy of FormInputSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputSectionImplCopyWith<_$FormInputSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
