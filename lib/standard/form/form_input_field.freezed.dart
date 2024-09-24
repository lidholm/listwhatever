// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_input_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormInputField<T> {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  T get currentValue => throw _privateConstructorUsedError;
  List<String? Function(String?)> get validators =>
      throw _privateConstructorUsedError;
  String get sectionName => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            T currentValue,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        textArea,
    required TResult Function(
            String id,
            String label,
            T currentValue,
            List<T> options,
            String Function(T) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        dropdown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            T currentValue,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        textArea,
    TResult? Function(
            String id,
            String label,
            T currentValue,
            List<T> options,
            String Function(T) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            T currentValue,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        textArea,
    TResult Function(
            String id,
            String label,
            T currentValue,
            List<T> options,
            String Function(T) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldTextArea<T> value) textArea,
    required TResult Function(FormInputFieldDropDown<T> value) dropdown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldTextArea<T> value)? textArea,
    TResult? Function(FormInputFieldDropDown<T> value)? dropdown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldTextArea<T> value)? textArea,
    TResult Function(FormInputFieldDropDown<T> value)? dropdown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FormInputField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormInputFieldCopyWith<T, FormInputField<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormInputFieldCopyWith<T, $Res> {
  factory $FormInputFieldCopyWith(
          FormInputField<T> value, $Res Function(FormInputField<T>) then) =
      _$FormInputFieldCopyWithImpl<T, $Res, FormInputField<T>>;
  @useResult
  $Res call(
      {String id,
      String label,
      T currentValue,
      List<String? Function(String?)> validators,
      String sectionName,
      bool hasError});
}

/// @nodoc
class _$FormInputFieldCopyWithImpl<T, $Res, $Val extends FormInputField<T>>
    implements $FormInputFieldCopyWith<T, $Res> {
  _$FormInputFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormInputField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? currentValue = freezed,
    Object? validators = null,
    Object? sectionName = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as T,
      validators: null == validators
          ? _value.validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<String? Function(String?)>,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormInputFieldTextAreaImplCopyWith<T, $Res>
    implements $FormInputFieldCopyWith<T, $Res> {
  factory _$$FormInputFieldTextAreaImplCopyWith(
          _$FormInputFieldTextAreaImpl<T> value,
          $Res Function(_$FormInputFieldTextAreaImpl<T>) then) =
      __$$FormInputFieldTextAreaImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      T currentValue,
      List<String? Function(String?)> validators,
      String sectionName,
      bool hasError});
}

/// @nodoc
class __$$FormInputFieldTextAreaImplCopyWithImpl<T, $Res>
    extends _$FormInputFieldCopyWithImpl<T, $Res,
        _$FormInputFieldTextAreaImpl<T>>
    implements _$$FormInputFieldTextAreaImplCopyWith<T, $Res> {
  __$$FormInputFieldTextAreaImplCopyWithImpl(
      _$FormInputFieldTextAreaImpl<T> _value,
      $Res Function(_$FormInputFieldTextAreaImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of FormInputField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? currentValue = freezed,
    Object? validators = null,
    Object? sectionName = null,
    Object? hasError = null,
  }) {
    return _then(_$FormInputFieldTextAreaImpl<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as T,
      validators: null == validators
          ? _value._validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<String? Function(String?)>,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FormInputFieldTextAreaImpl<T>
    with DiagnosticableTreeMixin
    implements FormInputFieldTextArea<T> {
  const _$FormInputFieldTextAreaImpl(
      {required this.id,
      required this.label,
      required this.currentValue,
      required final List<String? Function(String?)> validators,
      required this.sectionName,
      required this.hasError})
      : _validators = validators;

  @override
  final String id;
  @override
  final String label;
  @override
  final T currentValue;
  final List<String? Function(String?)> _validators;
  @override
  List<String? Function(String?)> get validators {
    if (_validators is EqualUnmodifiableListView) return _validators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validators);
  }

  @override
  final String sectionName;
  @override
  final bool hasError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputField<$T>.textArea(id: $id, label: $label, currentValue: $currentValue, validators: $validators, sectionName: $sectionName, hasError: $hasError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputField<$T>.textArea'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('validators', validators))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('hasError', hasError));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldTextAreaImpl<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality()
                .equals(other.currentValue, currentValue) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      const DeepCollectionEquality().hash(currentValue),
      const DeepCollectionEquality().hash(_validators),
      sectionName,
      hasError);

  /// Create a copy of FormInputField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldTextAreaImplCopyWith<T, _$FormInputFieldTextAreaImpl<T>>
      get copyWith => __$$FormInputFieldTextAreaImplCopyWithImpl<T,
          _$FormInputFieldTextAreaImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            T currentValue,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        textArea,
    required TResult Function(
            String id,
            String label,
            T currentValue,
            List<T> options,
            String Function(T) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        dropdown,
  }) {
    return textArea(id, label, currentValue, validators, sectionName, hasError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            T currentValue,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        textArea,
    TResult? Function(
            String id,
            String label,
            T currentValue,
            List<T> options,
            String Function(T) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
  }) {
    return textArea?.call(
        id, label, currentValue, validators, sectionName, hasError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            T currentValue,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        textArea,
    TResult Function(
            String id,
            String label,
            T currentValue,
            List<T> options,
            String Function(T) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    required TResult orElse(),
  }) {
    if (textArea != null) {
      return textArea(
          id, label, currentValue, validators, sectionName, hasError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldTextArea<T> value) textArea,
    required TResult Function(FormInputFieldDropDown<T> value) dropdown,
  }) {
    return textArea(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldTextArea<T> value)? textArea,
    TResult? Function(FormInputFieldDropDown<T> value)? dropdown,
  }) {
    return textArea?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldTextArea<T> value)? textArea,
    TResult Function(FormInputFieldDropDown<T> value)? dropdown,
    required TResult orElse(),
  }) {
    if (textArea != null) {
      return textArea(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldTextArea<T> implements FormInputField<T> {
  const factory FormInputFieldTextArea(
      {required final String id,
      required final String label,
      required final T currentValue,
      required final List<String? Function(String?)> validators,
      required final String sectionName,
      required final bool hasError}) = _$FormInputFieldTextAreaImpl<T>;

  @override
  String get id;
  @override
  String get label;
  @override
  T get currentValue;
  @override
  List<String? Function(String?)> get validators;
  @override
  String get sectionName;
  @override
  bool get hasError;

  /// Create a copy of FormInputField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldTextAreaImplCopyWith<T, _$FormInputFieldTextAreaImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldDropDownImplCopyWith<T, $Res>
    implements $FormInputFieldCopyWith<T, $Res> {
  factory _$$FormInputFieldDropDownImplCopyWith(
          _$FormInputFieldDropDownImpl<T> value,
          $Res Function(_$FormInputFieldDropDownImpl<T>) then) =
      __$$FormInputFieldDropDownImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      T currentValue,
      List<T> options,
      String Function(T) optionToString,
      List<String? Function(String?)> validators,
      String sectionName,
      bool hasError});
}

/// @nodoc
class __$$FormInputFieldDropDownImplCopyWithImpl<T, $Res>
    extends _$FormInputFieldCopyWithImpl<T, $Res,
        _$FormInputFieldDropDownImpl<T>>
    implements _$$FormInputFieldDropDownImplCopyWith<T, $Res> {
  __$$FormInputFieldDropDownImplCopyWithImpl(
      _$FormInputFieldDropDownImpl<T> _value,
      $Res Function(_$FormInputFieldDropDownImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of FormInputField
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? currentValue = freezed,
    Object? options = null,
    Object? optionToString = null,
    Object? validators = null,
    Object? sectionName = null,
    Object? hasError = null,
  }) {
    return _then(_$FormInputFieldDropDownImpl<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as T,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<T>,
      optionToString: null == optionToString
          ? _value.optionToString
          : optionToString // ignore: cast_nullable_to_non_nullable
              as String Function(T),
      validators: null == validators
          ? _value._validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<String? Function(String?)>,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FormInputFieldDropDownImpl<T>
    with DiagnosticableTreeMixin
    implements FormInputFieldDropDown<T> {
  const _$FormInputFieldDropDownImpl(
      {required this.id,
      required this.label,
      required this.currentValue,
      required final List<T> options,
      required this.optionToString,
      required final List<String? Function(String?)> validators,
      required this.sectionName,
      required this.hasError})
      : _options = options,
        _validators = validators;

  @override
  final String id;
  @override
  final String label;
  @override
  final T currentValue;
  final List<T> _options;
  @override
  List<T> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  final String Function(T) optionToString;
  final List<String? Function(String?)> _validators;
  @override
  List<String? Function(String?)> get validators {
    if (_validators is EqualUnmodifiableListView) return _validators;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validators);
  }

  @override
  final String sectionName;
  @override
  final bool hasError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputField<$T>.dropdown(id: $id, label: $label, currentValue: $currentValue, options: $options, optionToString: $optionToString, validators: $validators, sectionName: $sectionName, hasError: $hasError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputField<$T>.dropdown'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('options', options))
      ..add(DiagnosticsProperty('optionToString', optionToString))
      ..add(DiagnosticsProperty('validators', validators))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('hasError', hasError));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldDropDownImpl<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality()
                .equals(other.currentValue, currentValue) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.optionToString, optionToString) ||
                other.optionToString == optionToString) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      const DeepCollectionEquality().hash(currentValue),
      const DeepCollectionEquality().hash(_options),
      optionToString,
      const DeepCollectionEquality().hash(_validators),
      sectionName,
      hasError);

  /// Create a copy of FormInputField
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldDropDownImplCopyWith<T, _$FormInputFieldDropDownImpl<T>>
      get copyWith => __$$FormInputFieldDropDownImplCopyWithImpl<T,
          _$FormInputFieldDropDownImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            T currentValue,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        textArea,
    required TResult Function(
            String id,
            String label,
            T currentValue,
            List<T> options,
            String Function(T) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        dropdown,
  }) {
    return dropdown(id, label, currentValue, options, optionToString,
        validators, sectionName, hasError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            T currentValue,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        textArea,
    TResult? Function(
            String id,
            String label,
            T currentValue,
            List<T> options,
            String Function(T) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
  }) {
    return dropdown?.call(id, label, currentValue, options, optionToString,
        validators, sectionName, hasError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            T currentValue,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        textArea,
    TResult Function(
            String id,
            String label,
            T currentValue,
            List<T> options,
            String Function(T) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    required TResult orElse(),
  }) {
    if (dropdown != null) {
      return dropdown(id, label, currentValue, options, optionToString,
          validators, sectionName, hasError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldTextArea<T> value) textArea,
    required TResult Function(FormInputFieldDropDown<T> value) dropdown,
  }) {
    return dropdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldTextArea<T> value)? textArea,
    TResult? Function(FormInputFieldDropDown<T> value)? dropdown,
  }) {
    return dropdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldTextArea<T> value)? textArea,
    TResult Function(FormInputFieldDropDown<T> value)? dropdown,
    required TResult orElse(),
  }) {
    if (dropdown != null) {
      return dropdown(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldDropDown<T> implements FormInputField<T> {
  const factory FormInputFieldDropDown(
      {required final String id,
      required final String label,
      required final T currentValue,
      required final List<T> options,
      required final String Function(T) optionToString,
      required final List<String? Function(String?)> validators,
      required final String sectionName,
      required final bool hasError}) = _$FormInputFieldDropDownImpl<T>;

  @override
  String get id;
  @override
  String get label;
  @override
  T get currentValue;
  List<T> get options;
  String Function(T) get optionToString;
  @override
  List<String? Function(String?)> get validators;
  @override
  String get sectionName;
  @override
  bool get hasError;

  /// Create a copy of FormInputField
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldDropDownImplCopyWith<T, _$FormInputFieldDropDownImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
