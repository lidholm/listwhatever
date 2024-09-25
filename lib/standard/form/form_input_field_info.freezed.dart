// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_input_field_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FormInputFieldInfo<T> {
  String get id => throw _privateConstructorUsedError;
  String get label => throw _privateConstructorUsedError;
  Object? get currentValue => throw _privateConstructorUsedError;
  List<String? Function(Never?)> get validators =>
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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)
        checkbox,
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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)?
        checkbox,
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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)?
        checkbox,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea<T> value) textArea,
    required TResult Function(FormInputFieldInfoDropDown<T> value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox<T> value) checkbox,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea<T> value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown<T> value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox<T> value)? checkbox,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea<T> value)? textArea,
    TResult Function(FormInputFieldInfoDropDown<T> value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox<T> value)? checkbox,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormInputFieldInfoCopyWith<T, FormInputFieldInfo<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormInputFieldInfoCopyWith<T, $Res> {
  factory $FormInputFieldInfoCopyWith(FormInputFieldInfo<T> value,
          $Res Function(FormInputFieldInfo<T>) then) =
      _$FormInputFieldInfoCopyWithImpl<T, $Res, FormInputFieldInfo<T>>;
  @useResult
  $Res call({String id, String label, String sectionName, bool hasError});
}

/// @nodoc
class _$FormInputFieldInfoCopyWithImpl<T, $Res,
        $Val extends FormInputFieldInfo<T>>
    implements $FormInputFieldInfoCopyWith<T, $Res> {
  _$FormInputFieldInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
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
abstract class _$$FormInputFieldInfoTextAreaImplCopyWith<T, $Res>
    implements $FormInputFieldInfoCopyWith<T, $Res> {
  factory _$$FormInputFieldInfoTextAreaImplCopyWith(
          _$FormInputFieldInfoTextAreaImpl<T> value,
          $Res Function(_$FormInputFieldInfoTextAreaImpl<T>) then) =
      __$$FormInputFieldInfoTextAreaImplCopyWithImpl<T, $Res>;
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
class __$$FormInputFieldInfoTextAreaImplCopyWithImpl<T, $Res>
    extends _$FormInputFieldInfoCopyWithImpl<T, $Res,
        _$FormInputFieldInfoTextAreaImpl<T>>
    implements _$$FormInputFieldInfoTextAreaImplCopyWith<T, $Res> {
  __$$FormInputFieldInfoTextAreaImplCopyWithImpl(
      _$FormInputFieldInfoTextAreaImpl<T> _value,
      $Res Function(_$FormInputFieldInfoTextAreaImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
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
    return _then(_$FormInputFieldInfoTextAreaImpl<T>(
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

class _$FormInputFieldInfoTextAreaImpl<T>
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoTextArea<T> {
  const _$FormInputFieldInfoTextAreaImpl(
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
    return 'FormInputFieldInfo<$T>.textArea(id: $id, label: $label, currentValue: $currentValue, validators: $validators, sectionName: $sectionName, hasError: $hasError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo<$T>.textArea'))
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
            other is _$FormInputFieldInfoTextAreaImpl<T> &&
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

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoTextAreaImplCopyWith<T,
          _$FormInputFieldInfoTextAreaImpl<T>>
      get copyWith => __$$FormInputFieldInfoTextAreaImplCopyWithImpl<T,
          _$FormInputFieldInfoTextAreaImpl<T>>(this, _$identity);

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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)
        checkbox,
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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)?
        checkbox,
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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)?
        checkbox,
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
    required TResult Function(FormInputFieldInfoTextArea<T> value) textArea,
    required TResult Function(FormInputFieldInfoDropDown<T> value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox<T> value) checkbox,
  }) {
    return textArea(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea<T> value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown<T> value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox<T> value)? checkbox,
  }) {
    return textArea?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea<T> value)? textArea,
    TResult Function(FormInputFieldInfoDropDown<T> value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox<T> value)? checkbox,
    required TResult orElse(),
  }) {
    if (textArea != null) {
      return textArea(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoTextArea<T> implements FormInputFieldInfo<T> {
  const factory FormInputFieldInfoTextArea(
      {required final String id,
      required final String label,
      required final T currentValue,
      required final List<String? Function(String?)> validators,
      required final String sectionName,
      required final bool hasError}) = _$FormInputFieldInfoTextAreaImpl<T>;

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

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoTextAreaImplCopyWith<T,
          _$FormInputFieldInfoTextAreaImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoDropDownImplCopyWith<T, $Res>
    implements $FormInputFieldInfoCopyWith<T, $Res> {
  factory _$$FormInputFieldInfoDropDownImplCopyWith(
          _$FormInputFieldInfoDropDownImpl<T> value,
          $Res Function(_$FormInputFieldInfoDropDownImpl<T>) then) =
      __$$FormInputFieldInfoDropDownImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      T currentValue,
      List<T> options,
      String Function(dynamic) optionToString,
      List<String? Function(String?)> validators,
      String sectionName,
      bool hasError});
}

/// @nodoc
class __$$FormInputFieldInfoDropDownImplCopyWithImpl<T, $Res>
    extends _$FormInputFieldInfoCopyWithImpl<T, $Res,
        _$FormInputFieldInfoDropDownImpl<T>>
    implements _$$FormInputFieldInfoDropDownImplCopyWith<T, $Res> {
  __$$FormInputFieldInfoDropDownImplCopyWithImpl(
      _$FormInputFieldInfoDropDownImpl<T> _value,
      $Res Function(_$FormInputFieldInfoDropDownImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
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
    return _then(_$FormInputFieldInfoDropDownImpl<T>(
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
              as String Function(dynamic),
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

class _$FormInputFieldInfoDropDownImpl<T>
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoDropDown<T> {
  const _$FormInputFieldInfoDropDownImpl(
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
  final String Function(dynamic) optionToString;
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
    return 'FormInputFieldInfo<$T>.dropdown(id: $id, label: $label, currentValue: $currentValue, options: $options, optionToString: $optionToString, validators: $validators, sectionName: $sectionName, hasError: $hasError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo<$T>.dropdown'))
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
            other is _$FormInputFieldInfoDropDownImpl<T> &&
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

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoDropDownImplCopyWith<T,
          _$FormInputFieldInfoDropDownImpl<T>>
      get copyWith => __$$FormInputFieldInfoDropDownImplCopyWithImpl<T,
          _$FormInputFieldInfoDropDownImpl<T>>(this, _$identity);

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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)
        checkbox,
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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)?
        checkbox,
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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)?
        checkbox,
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
    required TResult Function(FormInputFieldInfoTextArea<T> value) textArea,
    required TResult Function(FormInputFieldInfoDropDown<T> value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox<T> value) checkbox,
  }) {
    return dropdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea<T> value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown<T> value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox<T> value)? checkbox,
  }) {
    return dropdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea<T> value)? textArea,
    TResult Function(FormInputFieldInfoDropDown<T> value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox<T> value)? checkbox,
    required TResult orElse(),
  }) {
    if (dropdown != null) {
      return dropdown(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoDropDown<T> implements FormInputFieldInfo<T> {
  const factory FormInputFieldInfoDropDown(
      {required final String id,
      required final String label,
      required final T currentValue,
      required final List<T> options,
      required final String Function(dynamic) optionToString,
      required final List<String? Function(String?)> validators,
      required final String sectionName,
      required final bool hasError}) = _$FormInputFieldInfoDropDownImpl<T>;

  @override
  String get id;
  @override
  String get label;
  @override
  T get currentValue;
  List<T> get options;
  String Function(dynamic) get optionToString;
  @override
  List<String? Function(String?)> get validators;
  @override
  String get sectionName;
  @override
  bool get hasError;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoDropDownImplCopyWith<T,
          _$FormInputFieldInfoDropDownImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoCheckboxImplCopyWith<T, $Res>
    implements $FormInputFieldInfoCopyWith<T, $Res> {
  factory _$$FormInputFieldInfoCheckboxImplCopyWith(
          _$FormInputFieldInfoCheckboxImpl<T> value,
          $Res Function(_$FormInputFieldInfoCheckboxImpl<T>) then) =
      __$$FormInputFieldInfoCheckboxImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      bool currentValue,
      List<String? Function(bool?)> validators,
      String sectionName,
      bool hasError});
}

/// @nodoc
class __$$FormInputFieldInfoCheckboxImplCopyWithImpl<T, $Res>
    extends _$FormInputFieldInfoCopyWithImpl<T, $Res,
        _$FormInputFieldInfoCheckboxImpl<T>>
    implements _$$FormInputFieldInfoCheckboxImplCopyWith<T, $Res> {
  __$$FormInputFieldInfoCheckboxImplCopyWithImpl(
      _$FormInputFieldInfoCheckboxImpl<T> _value,
      $Res Function(_$FormInputFieldInfoCheckboxImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? currentValue = null,
    Object? validators = null,
    Object? sectionName = null,
    Object? hasError = null,
  }) {
    return _then(_$FormInputFieldInfoCheckboxImpl<T>(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as bool,
      validators: null == validators
          ? _value._validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<String? Function(bool?)>,
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

class _$FormInputFieldInfoCheckboxImpl<T>
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoCheckbox<T> {
  const _$FormInputFieldInfoCheckboxImpl(
      {required this.id,
      required this.label,
      required this.currentValue,
      required final List<String? Function(bool?)> validators,
      required this.sectionName,
      required this.hasError})
      : _validators = validators;

  @override
  final String id;
  @override
  final String label;
  @override
  final bool currentValue;
  final List<String? Function(bool?)> _validators;
  @override
  List<String? Function(bool?)> get validators {
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
    return 'FormInputFieldInfo<$T>.checkbox(id: $id, label: $label, currentValue: $currentValue, validators: $validators, sectionName: $sectionName, hasError: $hasError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo<$T>.checkbox'))
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
            other is _$FormInputFieldInfoCheckboxImpl<T> &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, currentValue,
      const DeepCollectionEquality().hash(_validators), sectionName, hasError);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoCheckboxImplCopyWith<T,
          _$FormInputFieldInfoCheckboxImpl<T>>
      get copyWith => __$$FormInputFieldInfoCheckboxImplCopyWithImpl<T,
          _$FormInputFieldInfoCheckboxImpl<T>>(this, _$identity);

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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)
        checkbox,
  }) {
    return checkbox(id, label, currentValue, validators, sectionName, hasError);
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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)?
        checkbox,
  }) {
    return checkbox?.call(
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
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            bool hasError)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            bool hasError)?
        checkbox,
    required TResult orElse(),
  }) {
    if (checkbox != null) {
      return checkbox(
          id, label, currentValue, validators, sectionName, hasError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea<T> value) textArea,
    required TResult Function(FormInputFieldInfoDropDown<T> value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox<T> value) checkbox,
  }) {
    return checkbox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea<T> value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown<T> value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox<T> value)? checkbox,
  }) {
    return checkbox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea<T> value)? textArea,
    TResult Function(FormInputFieldInfoDropDown<T> value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox<T> value)? checkbox,
    required TResult orElse(),
  }) {
    if (checkbox != null) {
      return checkbox(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoCheckbox<T> implements FormInputFieldInfo<T> {
  const factory FormInputFieldInfoCheckbox(
      {required final String id,
      required final String label,
      required final bool currentValue,
      required final List<String? Function(bool?)> validators,
      required final String sectionName,
      required final bool hasError}) = _$FormInputFieldInfoCheckboxImpl<T>;

  @override
  String get id;
  @override
  String get label;
  @override
  bool get currentValue;
  @override
  List<String? Function(bool?)> get validators;
  @override
  String get sectionName;
  @override
  bool get hasError;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoCheckboxImplCopyWith<T,
          _$FormInputFieldInfoCheckboxImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
