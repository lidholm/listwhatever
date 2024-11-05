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
mixin _$FormInputFieldInfo {
  String get sectionName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FormInputFieldInfoCopyWith<FormInputFieldInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormInputFieldInfoCopyWith<$Res> {
  factory $FormInputFieldInfoCopyWith(
          FormInputFieldInfo value, $Res Function(FormInputFieldInfo) then) =
      _$FormInputFieldInfoCopyWithImpl<$Res, FormInputFieldInfo>;
  @useResult
  $Res call({String sectionName});
}

/// @nodoc
class _$FormInputFieldInfoCopyWithImpl<$Res, $Val extends FormInputFieldInfo>
    implements $FormInputFieldInfoCopyWith<$Res> {
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
    Object? sectionName = null,
  }) {
    return _then(_value.copyWith(
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FormInputFieldInfoTextAreaImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoTextAreaImplCopyWith(
          _$FormInputFieldInfoTextAreaImpl value,
          $Res Function(_$FormInputFieldInfoTextAreaImpl) then) =
      __$$FormInputFieldInfoTextAreaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      List<String? Function(String?)> validators,
      String sectionName,
      String? currentValue,
      void Function(String)? onChange,
      bool deletable,
      void Function()? onDelete,
      TextEditingController? controller});
}

/// @nodoc
class __$$FormInputFieldInfoTextAreaImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoTextAreaImpl>
    implements _$$FormInputFieldInfoTextAreaImplCopyWith<$Res> {
  __$$FormInputFieldInfoTextAreaImplCopyWithImpl(
      _$FormInputFieldInfoTextAreaImpl _value,
      $Res Function(_$FormInputFieldInfoTextAreaImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? validators = null,
    Object? sectionName = null,
    Object? currentValue = freezed,
    Object? onChange = freezed,
    Object? deletable = null,
    Object? onDelete = freezed,
    Object? controller = freezed,
  }) {
    return _then(_$FormInputFieldInfoTextAreaImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      validators: null == validators
          ? _value._validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<String? Function(String?)>,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as String?,
      onChange: freezed == onChange
          ? _value.onChange
          : onChange // ignore: cast_nullable_to_non_nullable
              as void Function(String)?,
      deletable: null == deletable
          ? _value.deletable
          : deletable // ignore: cast_nullable_to_non_nullable
              as bool,
      onDelete: freezed == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as void Function()?,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoTextAreaImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoTextArea {
  const _$FormInputFieldInfoTextAreaImpl(
      {required this.id,
      required this.label,
      required final List<String? Function(String?)> validators,
      required this.sectionName,
      this.currentValue = null,
      this.onChange = null,
      this.deletable = false,
      this.onDelete = null,
      this.controller = null})
      : _validators = validators;

  @override
  final String id;
  @override
  final String label;
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
  @JsonKey()
  final String? currentValue;
  @override
  @JsonKey()
  final void Function(String)? onChange;
  @override
  @JsonKey()
  final bool deletable;
  @override
  @JsonKey()
  final void Function()? onDelete;
  @override
  @JsonKey()
  final TextEditingController? controller;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.textArea(id: $id, label: $label, validators: $validators, sectionName: $sectionName, currentValue: $currentValue, onChange: $onChange, deletable: $deletable, onDelete: $onDelete, controller: $controller)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.textArea'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('validators', validators))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('onChange', onChange))
      ..add(DiagnosticsProperty('deletable', deletable))
      ..add(DiagnosticsProperty('onDelete', onDelete))
      ..add(DiagnosticsProperty('controller', controller));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoTextAreaImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.onChange, onChange) ||
                other.onChange == onChange) &&
            (identical(other.deletable, deletable) ||
                other.deletable == deletable) &&
            (identical(other.onDelete, onDelete) ||
                other.onDelete == onDelete) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      const DeepCollectionEquality().hash(_validators),
      sectionName,
      currentValue,
      onChange,
      deletable,
      onDelete,
      controller);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoTextAreaImplCopyWith<_$FormInputFieldInfoTextAreaImpl>
      get copyWith => __$$FormInputFieldInfoTextAreaImplCopyWithImpl<
          _$FormInputFieldInfoTextAreaImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return textArea(id, label, validators, sectionName, currentValue, onChange,
        deletable, onDelete, controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return textArea?.call(id, label, validators, sectionName, currentValue,
        onChange, deletable, onDelete, controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (textArea != null) {
      return textArea(id, label, validators, sectionName, currentValue,
          onChange, deletable, onDelete, controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return textArea(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return textArea?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (textArea != null) {
      return textArea(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoTextArea implements FormInputFieldInfo {
  const factory FormInputFieldInfoTextArea(
          {required final String id,
          required final String label,
          required final List<String? Function(String?)> validators,
          required final String sectionName,
          final String? currentValue,
          final void Function(String)? onChange,
          final bool deletable,
          final void Function()? onDelete,
          final TextEditingController? controller}) =
      _$FormInputFieldInfoTextAreaImpl;

  String get id;
  String get label;
  List<String? Function(String?)> get validators;
  @override
  String get sectionName;
  String? get currentValue;
  void Function(String)? get onChange;
  bool get deletable;
  void Function()? get onDelete;
  TextEditingController? get controller;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoTextAreaImplCopyWith<_$FormInputFieldInfoTextAreaImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoDropDownImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoDropDownImplCopyWith(
          _$FormInputFieldInfoDropDownImpl value,
          $Res Function(_$FormInputFieldInfoDropDownImpl) then) =
      __$$FormInputFieldInfoDropDownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      dynamic currentValue,
      List<dynamic> options,
      String Function(dynamic) optionToString,
      List<String? Function(String?)> validators,
      String sectionName,
      void Function(dynamic)? onChange,
      bool deletable,
      void Function()? onDelete});
}

/// @nodoc
class __$$FormInputFieldInfoDropDownImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoDropDownImpl>
    implements _$$FormInputFieldInfoDropDownImplCopyWith<$Res> {
  __$$FormInputFieldInfoDropDownImplCopyWithImpl(
      _$FormInputFieldInfoDropDownImpl _value,
      $Res Function(_$FormInputFieldInfoDropDownImpl) _then)
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
    Object? onChange = freezed,
    Object? deletable = null,
    Object? onDelete = freezed,
  }) {
    return _then(_$FormInputFieldInfoDropDownImpl(
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
              as dynamic,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
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
      onChange: freezed == onChange
          ? _value.onChange
          : onChange // ignore: cast_nullable_to_non_nullable
              as void Function(dynamic)?,
      deletable: null == deletable
          ? _value.deletable
          : deletable // ignore: cast_nullable_to_non_nullable
              as bool,
      onDelete: freezed == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoDropDownImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoDropDown {
  const _$FormInputFieldInfoDropDownImpl(
      {required this.id,
      required this.label,
      required this.currentValue,
      required final List<dynamic> options,
      required this.optionToString,
      required final List<String? Function(String?)> validators,
      required this.sectionName,
      this.onChange = null,
      this.deletable = false,
      this.onDelete = null})
      : _options = options,
        _validators = validators;

  @override
  final String id;
  @override
  final String label;
  @override
  final dynamic currentValue;
  final List<dynamic> _options;
  @override
  List<dynamic> get options {
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
  @JsonKey()
  final void Function(dynamic)? onChange;
  @override
  @JsonKey()
  final bool deletable;
  @override
  @JsonKey()
  final void Function()? onDelete;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.dropdown(id: $id, label: $label, currentValue: $currentValue, options: $options, optionToString: $optionToString, validators: $validators, sectionName: $sectionName, onChange: $onChange, deletable: $deletable, onDelete: $onDelete)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.dropdown'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('options', options))
      ..add(DiagnosticsProperty('optionToString', optionToString))
      ..add(DiagnosticsProperty('validators', validators))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('onChange', onChange))
      ..add(DiagnosticsProperty('deletable', deletable))
      ..add(DiagnosticsProperty('onDelete', onDelete));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoDropDownImpl &&
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
            (identical(other.onChange, onChange) ||
                other.onChange == onChange) &&
            (identical(other.deletable, deletable) ||
                other.deletable == deletable) &&
            (identical(other.onDelete, onDelete) ||
                other.onDelete == onDelete));
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
      onChange,
      deletable,
      onDelete);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoDropDownImplCopyWith<_$FormInputFieldInfoDropDownImpl>
      get copyWith => __$$FormInputFieldInfoDropDownImplCopyWithImpl<
          _$FormInputFieldInfoDropDownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return dropdown(id, label, currentValue, options, optionToString,
        validators, sectionName, onChange, deletable, onDelete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return dropdown?.call(id, label, currentValue, options, optionToString,
        validators, sectionName, onChange, deletable, onDelete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (dropdown != null) {
      return dropdown(id, label, currentValue, options, optionToString,
          validators, sectionName, onChange, deletable, onDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return dropdown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return dropdown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (dropdown != null) {
      return dropdown(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoDropDown implements FormInputFieldInfo {
  const factory FormInputFieldInfoDropDown(
      {required final String id,
      required final String label,
      required final dynamic currentValue,
      required final List<dynamic> options,
      required final String Function(dynamic) optionToString,
      required final List<String? Function(String?)> validators,
      required final String sectionName,
      final void Function(dynamic)? onChange,
      final bool deletable,
      final void Function()? onDelete}) = _$FormInputFieldInfoDropDownImpl;

  String get id;
  String get label;
  dynamic get currentValue;
  List<dynamic> get options;
  String Function(dynamic) get optionToString;
  List<String? Function(String?)> get validators;
  @override
  String get sectionName;
  void Function(dynamic)? get onChange;
  bool get deletable;
  void Function()? get onDelete;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoDropDownImplCopyWith<_$FormInputFieldInfoDropDownImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoCheckboxImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoCheckboxImplCopyWith(
          _$FormInputFieldInfoCheckboxImpl value,
          $Res Function(_$FormInputFieldInfoCheckboxImpl) then) =
      __$$FormInputFieldInfoCheckboxImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      bool currentValue,
      List<String? Function(bool?)> validators,
      String sectionName,
      void Function(String)? onChange,
      bool deletable,
      void Function()? onDelete});
}

/// @nodoc
class __$$FormInputFieldInfoCheckboxImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoCheckboxImpl>
    implements _$$FormInputFieldInfoCheckboxImplCopyWith<$Res> {
  __$$FormInputFieldInfoCheckboxImplCopyWithImpl(
      _$FormInputFieldInfoCheckboxImpl _value,
      $Res Function(_$FormInputFieldInfoCheckboxImpl) _then)
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
    Object? onChange = freezed,
    Object? deletable = null,
    Object? onDelete = freezed,
  }) {
    return _then(_$FormInputFieldInfoCheckboxImpl(
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
      onChange: freezed == onChange
          ? _value.onChange
          : onChange // ignore: cast_nullable_to_non_nullable
              as void Function(String)?,
      deletable: null == deletable
          ? _value.deletable
          : deletable // ignore: cast_nullable_to_non_nullable
              as bool,
      onDelete: freezed == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoCheckboxImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoCheckbox {
  const _$FormInputFieldInfoCheckboxImpl(
      {required this.id,
      required this.label,
      required this.currentValue,
      required final List<String? Function(bool?)> validators,
      required this.sectionName,
      this.onChange = null,
      this.deletable = false,
      this.onDelete = null})
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
  @JsonKey()
  final void Function(String)? onChange;
  @override
  @JsonKey()
  final bool deletable;
  @override
  @JsonKey()
  final void Function()? onDelete;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.checkbox(id: $id, label: $label, currentValue: $currentValue, validators: $validators, sectionName: $sectionName, onChange: $onChange, deletable: $deletable, onDelete: $onDelete)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.checkbox'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('validators', validators))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('onChange', onChange))
      ..add(DiagnosticsProperty('deletable', deletable))
      ..add(DiagnosticsProperty('onDelete', onDelete));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoCheckboxImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.onChange, onChange) ||
                other.onChange == onChange) &&
            (identical(other.deletable, deletable) ||
                other.deletable == deletable) &&
            (identical(other.onDelete, onDelete) ||
                other.onDelete == onDelete));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      currentValue,
      const DeepCollectionEquality().hash(_validators),
      sectionName,
      onChange,
      deletable,
      onDelete);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoCheckboxImplCopyWith<_$FormInputFieldInfoCheckboxImpl>
      get copyWith => __$$FormInputFieldInfoCheckboxImplCopyWithImpl<
          _$FormInputFieldInfoCheckboxImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return checkbox(id, label, currentValue, validators, sectionName, onChange,
        deletable, onDelete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return checkbox?.call(id, label, currentValue, validators, sectionName,
        onChange, deletable, onDelete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (checkbox != null) {
      return checkbox(id, label, currentValue, validators, sectionName,
          onChange, deletable, onDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return checkbox(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return checkbox?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (checkbox != null) {
      return checkbox(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoCheckbox implements FormInputFieldInfo {
  const factory FormInputFieldInfoCheckbox(
      {required final String id,
      required final String label,
      required final bool currentValue,
      required final List<String? Function(bool?)> validators,
      required final String sectionName,
      final void Function(String)? onChange,
      final bool deletable,
      final void Function()? onDelete}) = _$FormInputFieldInfoCheckboxImpl;

  String get id;
  String get label;
  bool get currentValue;
  List<String? Function(bool?)> get validators;
  @override
  String get sectionName;
  void Function(String)? get onChange;
  bool get deletable;
  void Function()? get onDelete;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoCheckboxImplCopyWith<_$FormInputFieldInfoCheckboxImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoImagePickerImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoImagePickerImplCopyWith(
          _$FormInputFieldInfoImagePickerImpl value,
          $Res Function(_$FormInputFieldInfoImagePickerImpl) then) =
      __$$FormInputFieldInfoImagePickerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String? currentValue,
      List<String? Function(bool?)> validators,
      String sectionName,
      void Function(String)? onChange});
}

/// @nodoc
class __$$FormInputFieldInfoImagePickerImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoImagePickerImpl>
    implements _$$FormInputFieldInfoImagePickerImplCopyWith<$Res> {
  __$$FormInputFieldInfoImagePickerImplCopyWithImpl(
      _$FormInputFieldInfoImagePickerImpl _value,
      $Res Function(_$FormInputFieldInfoImagePickerImpl) _then)
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
    Object? onChange = freezed,
  }) {
    return _then(_$FormInputFieldInfoImagePickerImpl(
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
              as String?,
      validators: null == validators
          ? _value._validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<String? Function(bool?)>,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      onChange: freezed == onChange
          ? _value.onChange
          : onChange // ignore: cast_nullable_to_non_nullable
              as void Function(String)?,
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoImagePickerImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoImagePicker {
  const _$FormInputFieldInfoImagePickerImpl(
      {required this.id,
      required this.label,
      required this.currentValue,
      required final List<String? Function(bool?)> validators,
      required this.sectionName,
      this.onChange = null})
      : _validators = validators;

  @override
  final String id;
  @override
  final String label;
  @override
  final String? currentValue;
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
  @JsonKey()
  final void Function(String)? onChange;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.imagePicker(id: $id, label: $label, currentValue: $currentValue, validators: $validators, sectionName: $sectionName, onChange: $onChange)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.imagePicker'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('validators', validators))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('onChange', onChange));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoImagePickerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.onChange, onChange) ||
                other.onChange == onChange));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, currentValue,
      const DeepCollectionEquality().hash(_validators), sectionName, onChange);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoImagePickerImplCopyWith<
          _$FormInputFieldInfoImagePickerImpl>
      get copyWith => __$$FormInputFieldInfoImagePickerImplCopyWithImpl<
          _$FormInputFieldInfoImagePickerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return imagePicker(
        id, label, currentValue, validators, sectionName, onChange);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return imagePicker?.call(
        id, label, currentValue, validators, sectionName, onChange);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (imagePicker != null) {
      return imagePicker(
          id, label, currentValue, validators, sectionName, onChange);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return imagePicker(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return imagePicker?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (imagePicker != null) {
      return imagePicker(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoImagePicker implements FormInputFieldInfo {
  const factory FormInputFieldInfoImagePicker(
          {required final String id,
          required final String label,
          required final String? currentValue,
          required final List<String? Function(bool?)> validators,
          required final String sectionName,
          final void Function(String)? onChange}) =
      _$FormInputFieldInfoImagePickerImpl;

  String get id;
  String get label;
  String? get currentValue;
  List<String? Function(bool?)> get validators;
  @override
  String get sectionName;
  void Function(String)? get onChange;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoImagePickerImplCopyWith<
          _$FormInputFieldInfoImagePickerImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoCancelButtonImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoCancelButtonImplCopyWith(
          _$FormInputFieldInfoCancelButtonImpl value,
          $Res Function(_$FormInputFieldInfoCancelButtonImpl) then) =
      __$$FormInputFieldInfoCancelButtonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String label, String sectionName, void Function() cancel});
}

/// @nodoc
class __$$FormInputFieldInfoCancelButtonImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoCancelButtonImpl>
    implements _$$FormInputFieldInfoCancelButtonImplCopyWith<$Res> {
  __$$FormInputFieldInfoCancelButtonImplCopyWithImpl(
      _$FormInputFieldInfoCancelButtonImpl _value,
      $Res Function(_$FormInputFieldInfoCancelButtonImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? sectionName = null,
    Object? cancel = null,
  }) {
    return _then(_$FormInputFieldInfoCancelButtonImpl(
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
      cancel: null == cancel
          ? _value.cancel
          : cancel // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoCancelButtonImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoCancelButton {
  const _$FormInputFieldInfoCancelButtonImpl(
      {required this.id,
      required this.label,
      required this.sectionName,
      required this.cancel});

  @override
  final String id;
  @override
  final String label;
  @override
  final String sectionName;
  @override
  final void Function() cancel;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.cancelButton(id: $id, label: $label, sectionName: $sectionName, cancel: $cancel)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.cancelButton'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('cancel', cancel));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoCancelButtonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.cancel, cancel) || other.cancel == cancel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, sectionName, cancel);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoCancelButtonImplCopyWith<
          _$FormInputFieldInfoCancelButtonImpl>
      get copyWith => __$$FormInputFieldInfoCancelButtonImplCopyWithImpl<
          _$FormInputFieldInfoCancelButtonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return cancelButton(id, label, sectionName, cancel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return cancelButton?.call(id, label, sectionName, cancel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (cancelButton != null) {
      return cancelButton(id, label, sectionName, cancel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return cancelButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return cancelButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (cancelButton != null) {
      return cancelButton(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoCancelButton implements FormInputFieldInfo {
  const factory FormInputFieldInfoCancelButton(
          {required final String id,
          required final String label,
          required final String sectionName,
          required final void Function() cancel}) =
      _$FormInputFieldInfoCancelButtonImpl;

  String get id;
  String get label;
  @override
  String get sectionName;
  void Function() get cancel;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoCancelButtonImplCopyWith<
          _$FormInputFieldInfoCancelButtonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoSubmitButtonImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoSubmitButtonImplCopyWith(
          _$FormInputFieldInfoSubmitButtonImpl value,
          $Res Function(_$FormInputFieldInfoSubmitButtonImpl) then) =
      __$$FormInputFieldInfoSubmitButtonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      String sectionName,
      void Function(Map<String, dynamic>?) save});
}

/// @nodoc
class __$$FormInputFieldInfoSubmitButtonImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoSubmitButtonImpl>
    implements _$$FormInputFieldInfoSubmitButtonImplCopyWith<$Res> {
  __$$FormInputFieldInfoSubmitButtonImplCopyWithImpl(
      _$FormInputFieldInfoSubmitButtonImpl _value,
      $Res Function(_$FormInputFieldInfoSubmitButtonImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? sectionName = null,
    Object? save = null,
  }) {
    return _then(_$FormInputFieldInfoSubmitButtonImpl(
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
      save: null == save
          ? _value.save
          : save // ignore: cast_nullable_to_non_nullable
              as void Function(Map<String, dynamic>?),
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoSubmitButtonImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoSubmitButton {
  const _$FormInputFieldInfoSubmitButtonImpl(
      {required this.id,
      required this.label,
      required this.sectionName,
      required this.save});

  @override
  final String id;
  @override
  final String label;
  @override
  final String sectionName;
  @override
  final void Function(Map<String, dynamic>?) save;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.submitButton(id: $id, label: $label, sectionName: $sectionName, save: $save)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.submitButton'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('save', save));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoSubmitButtonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.save, save) || other.save == save));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, sectionName, save);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoSubmitButtonImplCopyWith<
          _$FormInputFieldInfoSubmitButtonImpl>
      get copyWith => __$$FormInputFieldInfoSubmitButtonImplCopyWithImpl<
          _$FormInputFieldInfoSubmitButtonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return submitButton(id, label, sectionName, save);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return submitButton?.call(id, label, sectionName, save);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (submitButton != null) {
      return submitButton(id, label, sectionName, save);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return submitButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return submitButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (submitButton != null) {
      return submitButton(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoSubmitButton implements FormInputFieldInfo {
  const factory FormInputFieldInfoSubmitButton(
          {required final String id,
          required final String label,
          required final String sectionName,
          required final void Function(Map<String, dynamic>?) save}) =
      _$FormInputFieldInfoSubmitButtonImpl;

  String get id;
  String get label;
  @override
  String get sectionName;
  void Function(Map<String, dynamic>?) get save;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoSubmitButtonImplCopyWith<
          _$FormInputFieldInfoSubmitButtonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoTwoAutoCompleteFieldsImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoTwoAutoCompleteFieldsImplCopyWith(
          _$FormInputFieldInfoTwoAutoCompleteFieldsImpl value,
          $Res Function(_$FormInputFieldInfoTwoAutoCompleteFieldsImpl) then) =
      __$$FormInputFieldInfoTwoAutoCompleteFieldsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String id2,
      String labelLeft,
      String labelRight,
      String currentValueLeft,
      String currentValueRight,
      List<String> optionsLeft,
      Map<String, Set<String>> optionsRight,
      List<String? Function(String?)> validatorsLeft,
      List<String? Function(String?)> validatorsRight,
      String sectionName,
      bool deletable,
      void Function()? onDelete});
}

/// @nodoc
class __$$FormInputFieldInfoTwoAutoCompleteFieldsImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoTwoAutoCompleteFieldsImpl>
    implements _$$FormInputFieldInfoTwoAutoCompleteFieldsImplCopyWith<$Res> {
  __$$FormInputFieldInfoTwoAutoCompleteFieldsImplCopyWithImpl(
      _$FormInputFieldInfoTwoAutoCompleteFieldsImpl _value,
      $Res Function(_$FormInputFieldInfoTwoAutoCompleteFieldsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? id2 = null,
    Object? labelLeft = null,
    Object? labelRight = null,
    Object? currentValueLeft = null,
    Object? currentValueRight = null,
    Object? optionsLeft = null,
    Object? optionsRight = null,
    Object? validatorsLeft = null,
    Object? validatorsRight = null,
    Object? sectionName = null,
    Object? deletable = null,
    Object? onDelete = freezed,
  }) {
    return _then(_$FormInputFieldInfoTwoAutoCompleteFieldsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      id2: null == id2
          ? _value.id2
          : id2 // ignore: cast_nullable_to_non_nullable
              as String,
      labelLeft: null == labelLeft
          ? _value.labelLeft
          : labelLeft // ignore: cast_nullable_to_non_nullable
              as String,
      labelRight: null == labelRight
          ? _value.labelRight
          : labelRight // ignore: cast_nullable_to_non_nullable
              as String,
      currentValueLeft: null == currentValueLeft
          ? _value.currentValueLeft
          : currentValueLeft // ignore: cast_nullable_to_non_nullable
              as String,
      currentValueRight: null == currentValueRight
          ? _value.currentValueRight
          : currentValueRight // ignore: cast_nullable_to_non_nullable
              as String,
      optionsLeft: null == optionsLeft
          ? _value._optionsLeft
          : optionsLeft // ignore: cast_nullable_to_non_nullable
              as List<String>,
      optionsRight: null == optionsRight
          ? _value._optionsRight
          : optionsRight // ignore: cast_nullable_to_non_nullable
              as Map<String, Set<String>>,
      validatorsLeft: null == validatorsLeft
          ? _value._validatorsLeft
          : validatorsLeft // ignore: cast_nullable_to_non_nullable
              as List<String? Function(String?)>,
      validatorsRight: null == validatorsRight
          ? _value._validatorsRight
          : validatorsRight // ignore: cast_nullable_to_non_nullable
              as List<String? Function(String?)>,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      deletable: null == deletable
          ? _value.deletable
          : deletable // ignore: cast_nullable_to_non_nullable
              as bool,
      onDelete: freezed == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoTwoAutoCompleteFieldsImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoTwoAutoCompleteFields {
  const _$FormInputFieldInfoTwoAutoCompleteFieldsImpl(
      {required this.id,
      required this.id2,
      required this.labelLeft,
      required this.labelRight,
      required this.currentValueLeft,
      required this.currentValueRight,
      required final List<String> optionsLeft,
      required final Map<String, Set<String>> optionsRight,
      required final List<String? Function(String?)> validatorsLeft,
      required final List<String? Function(String?)> validatorsRight,
      required this.sectionName,
      this.deletable = false,
      this.onDelete = null})
      : _optionsLeft = optionsLeft,
        _optionsRight = optionsRight,
        _validatorsLeft = validatorsLeft,
        _validatorsRight = validatorsRight;

  @override
  final String id;
  @override
  final String id2;
  @override
  final String labelLeft;
  @override
  final String labelRight;
  @override
  final String currentValueLeft;
  @override
  final String currentValueRight;
  final List<String> _optionsLeft;
  @override
  List<String> get optionsLeft {
    if (_optionsLeft is EqualUnmodifiableListView) return _optionsLeft;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_optionsLeft);
  }

  final Map<String, Set<String>> _optionsRight;
  @override
  Map<String, Set<String>> get optionsRight {
    if (_optionsRight is EqualUnmodifiableMapView) return _optionsRight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_optionsRight);
  }

  final List<String? Function(String?)> _validatorsLeft;
  @override
  List<String? Function(String?)> get validatorsLeft {
    if (_validatorsLeft is EqualUnmodifiableListView) return _validatorsLeft;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validatorsLeft);
  }

  final List<String? Function(String?)> _validatorsRight;
  @override
  List<String? Function(String?)> get validatorsRight {
    if (_validatorsRight is EqualUnmodifiableListView) return _validatorsRight;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_validatorsRight);
  }

  @override
  final String sectionName;
  @override
  @JsonKey()
  final bool deletable;
  @override
  @JsonKey()
  final void Function()? onDelete;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.twoAutoCompleteFields(id: $id, id2: $id2, labelLeft: $labelLeft, labelRight: $labelRight, currentValueLeft: $currentValueLeft, currentValueRight: $currentValueRight, optionsLeft: $optionsLeft, optionsRight: $optionsRight, validatorsLeft: $validatorsLeft, validatorsRight: $validatorsRight, sectionName: $sectionName, deletable: $deletable, onDelete: $onDelete)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'FormInputFieldInfo.twoAutoCompleteFields'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('id2', id2))
      ..add(DiagnosticsProperty('labelLeft', labelLeft))
      ..add(DiagnosticsProperty('labelRight', labelRight))
      ..add(DiagnosticsProperty('currentValueLeft', currentValueLeft))
      ..add(DiagnosticsProperty('currentValueRight', currentValueRight))
      ..add(DiagnosticsProperty('optionsLeft', optionsLeft))
      ..add(DiagnosticsProperty('optionsRight', optionsRight))
      ..add(DiagnosticsProperty('validatorsLeft', validatorsLeft))
      ..add(DiagnosticsProperty('validatorsRight', validatorsRight))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('deletable', deletable))
      ..add(DiagnosticsProperty('onDelete', onDelete));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoTwoAutoCompleteFieldsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.id2, id2) || other.id2 == id2) &&
            (identical(other.labelLeft, labelLeft) ||
                other.labelLeft == labelLeft) &&
            (identical(other.labelRight, labelRight) ||
                other.labelRight == labelRight) &&
            (identical(other.currentValueLeft, currentValueLeft) ||
                other.currentValueLeft == currentValueLeft) &&
            (identical(other.currentValueRight, currentValueRight) ||
                other.currentValueRight == currentValueRight) &&
            const DeepCollectionEquality()
                .equals(other._optionsLeft, _optionsLeft) &&
            const DeepCollectionEquality()
                .equals(other._optionsRight, _optionsRight) &&
            const DeepCollectionEquality()
                .equals(other._validatorsLeft, _validatorsLeft) &&
            const DeepCollectionEquality()
                .equals(other._validatorsRight, _validatorsRight) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.deletable, deletable) ||
                other.deletable == deletable) &&
            (identical(other.onDelete, onDelete) ||
                other.onDelete == onDelete));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      id2,
      labelLeft,
      labelRight,
      currentValueLeft,
      currentValueRight,
      const DeepCollectionEquality().hash(_optionsLeft),
      const DeepCollectionEquality().hash(_optionsRight),
      const DeepCollectionEquality().hash(_validatorsLeft),
      const DeepCollectionEquality().hash(_validatorsRight),
      sectionName,
      deletable,
      onDelete);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoTwoAutoCompleteFieldsImplCopyWith<
          _$FormInputFieldInfoTwoAutoCompleteFieldsImpl>
      get copyWith =>
          __$$FormInputFieldInfoTwoAutoCompleteFieldsImplCopyWithImpl<
              _$FormInputFieldInfoTwoAutoCompleteFieldsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return twoAutoCompleteFields(
        id,
        id2,
        labelLeft,
        labelRight,
        currentValueLeft,
        currentValueRight,
        optionsLeft,
        optionsRight,
        validatorsLeft,
        validatorsRight,
        sectionName,
        deletable,
        onDelete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return twoAutoCompleteFields?.call(
        id,
        id2,
        labelLeft,
        labelRight,
        currentValueLeft,
        currentValueRight,
        optionsLeft,
        optionsRight,
        validatorsLeft,
        validatorsRight,
        sectionName,
        deletable,
        onDelete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (twoAutoCompleteFields != null) {
      return twoAutoCompleteFields(
          id,
          id2,
          labelLeft,
          labelRight,
          currentValueLeft,
          currentValueRight,
          optionsLeft,
          optionsRight,
          validatorsLeft,
          validatorsRight,
          sectionName,
          deletable,
          onDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return twoAutoCompleteFields(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return twoAutoCompleteFields?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (twoAutoCompleteFields != null) {
      return twoAutoCompleteFields(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoTwoAutoCompleteFields
    implements FormInputFieldInfo {
  const factory FormInputFieldInfoTwoAutoCompleteFields(
          {required final String id,
          required final String id2,
          required final String labelLeft,
          required final String labelRight,
          required final String currentValueLeft,
          required final String currentValueRight,
          required final List<String> optionsLeft,
          required final Map<String, Set<String>> optionsRight,
          required final List<String? Function(String?)> validatorsLeft,
          required final List<String? Function(String?)> validatorsRight,
          required final String sectionName,
          final bool deletable,
          final void Function()? onDelete}) =
      _$FormInputFieldInfoTwoAutoCompleteFieldsImpl;

  String get id;
  String get id2;
  String get labelLeft;
  String get labelRight;
  String get currentValueLeft;
  String get currentValueRight;
  List<String> get optionsLeft;
  Map<String, Set<String>> get optionsRight;
  List<String? Function(String?)> get validatorsLeft;
  List<String? Function(String?)> get validatorsRight;
  @override
  String get sectionName;
  bool get deletable;
  void Function()? get onDelete;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoTwoAutoCompleteFieldsImplCopyWith<
          _$FormInputFieldInfoTwoAutoCompleteFieldsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoCustomButtonImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoCustomButtonImplCopyWith(
          _$FormInputFieldInfoCustomButtonImpl value,
          $Res Function(_$FormInputFieldInfoCustomButtonImpl) then) =
      __$$FormInputFieldInfoCustomButtonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String label, String sectionName, void Function() callback});
}

/// @nodoc
class __$$FormInputFieldInfoCustomButtonImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoCustomButtonImpl>
    implements _$$FormInputFieldInfoCustomButtonImplCopyWith<$Res> {
  __$$FormInputFieldInfoCustomButtonImplCopyWithImpl(
      _$FormInputFieldInfoCustomButtonImpl _value,
      $Res Function(_$FormInputFieldInfoCustomButtonImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? sectionName = null,
    Object? callback = null,
  }) {
    return _then(_$FormInputFieldInfoCustomButtonImpl(
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
      callback: null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as void Function(),
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoCustomButtonImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoCustomButton {
  const _$FormInputFieldInfoCustomButtonImpl(
      {required this.id,
      required this.label,
      required this.sectionName,
      required this.callback});

  @override
  final String id;
  @override
  final String label;
  @override
  final String sectionName;
  @override
  final void Function() callback;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.customButton(id: $id, label: $label, sectionName: $sectionName, callback: $callback)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.customButton'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('callback', callback));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoCustomButtonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, label, sectionName, callback);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoCustomButtonImplCopyWith<
          _$FormInputFieldInfoCustomButtonImpl>
      get copyWith => __$$FormInputFieldInfoCustomButtonImplCopyWithImpl<
          _$FormInputFieldInfoCustomButtonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return customButton(id, label, sectionName, callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return customButton?.call(id, label, sectionName, callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (customButton != null) {
      return customButton(id, label, sectionName, callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return customButton(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return customButton?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (customButton != null) {
      return customButton(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoCustomButton implements FormInputFieldInfo {
  const factory FormInputFieldInfoCustomButton(
          {required final String id,
          required final String label,
          required final String sectionName,
          required final void Function() callback}) =
      _$FormInputFieldInfoCustomButtonImpl;

  String get id;
  String get label;
  @override
  String get sectionName;
  void Function() get callback;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoCustomButtonImplCopyWith<
          _$FormInputFieldInfoCustomButtonImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoDateImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoDateImplCopyWith(
          _$FormInputFieldInfoDateImpl value,
          $Res Function(_$FormInputFieldInfoDateImpl) then) =
      __$$FormInputFieldInfoDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      DateTime currentValue,
      String sectionName,
      InputType inputType,
      FormFieldValidator<DateTime?>? validator,
      void Function(DateTime)? onChange,
      bool deletable,
      void Function()? onDelete});
}

/// @nodoc
class __$$FormInputFieldInfoDateImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res, _$FormInputFieldInfoDateImpl>
    implements _$$FormInputFieldInfoDateImplCopyWith<$Res> {
  __$$FormInputFieldInfoDateImplCopyWithImpl(
      _$FormInputFieldInfoDateImpl _value,
      $Res Function(_$FormInputFieldInfoDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? currentValue = null,
    Object? sectionName = null,
    Object? inputType = null,
    Object? validator = freezed,
    Object? onChange = freezed,
    Object? deletable = null,
    Object? onDelete = freezed,
  }) {
    return _then(_$FormInputFieldInfoDateImpl(
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
              as DateTime,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      inputType: null == inputType
          ? _value.inputType
          : inputType // ignore: cast_nullable_to_non_nullable
              as InputType,
      validator: freezed == validator
          ? _value.validator
          : validator // ignore: cast_nullable_to_non_nullable
              as FormFieldValidator<DateTime?>?,
      onChange: freezed == onChange
          ? _value.onChange
          : onChange // ignore: cast_nullable_to_non_nullable
              as void Function(DateTime)?,
      deletable: null == deletable
          ? _value.deletable
          : deletable // ignore: cast_nullable_to_non_nullable
              as bool,
      onDelete: freezed == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as void Function()?,
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoDateImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoDate {
  const _$FormInputFieldInfoDateImpl(
      {required this.id,
      required this.label,
      required this.currentValue,
      required this.sectionName,
      required this.inputType,
      this.validator = null,
      this.onChange = null,
      this.deletable = false,
      this.onDelete = null});

  @override
  final String id;
  @override
  final String label;
  @override
  final DateTime currentValue;
  @override
  final String sectionName;
  @override
  final InputType inputType;
  @override
  @JsonKey()
  final FormFieldValidator<DateTime?>? validator;
  @override
  @JsonKey()
  final void Function(DateTime)? onChange;
  @override
  @JsonKey()
  final bool deletable;
  @override
  @JsonKey()
  final void Function()? onDelete;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.date(id: $id, label: $label, currentValue: $currentValue, sectionName: $sectionName, inputType: $inputType, validator: $validator, onChange: $onChange, deletable: $deletable, onDelete: $onDelete)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.date'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('inputType', inputType))
      ..add(DiagnosticsProperty('validator', validator))
      ..add(DiagnosticsProperty('onChange', onChange))
      ..add(DiagnosticsProperty('deletable', deletable))
      ..add(DiagnosticsProperty('onDelete', onDelete));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoDateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.inputType, inputType) ||
                other.inputType == inputType) &&
            (identical(other.validator, validator) ||
                other.validator == validator) &&
            (identical(other.onChange, onChange) ||
                other.onChange == onChange) &&
            (identical(other.deletable, deletable) ||
                other.deletable == deletable) &&
            (identical(other.onDelete, onDelete) ||
                other.onDelete == onDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, currentValue,
      sectionName, inputType, validator, onChange, deletable, onDelete);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoDateImplCopyWith<_$FormInputFieldInfoDateImpl>
      get copyWith => __$$FormInputFieldInfoDateImplCopyWithImpl<
          _$FormInputFieldInfoDateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return date(id, label, currentValue, sectionName, inputType, validator,
        onChange, deletable, onDelete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return date?.call(id, label, currentValue, sectionName, inputType,
        validator, onChange, deletable, onDelete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (date != null) {
      return date(id, label, currentValue, sectionName, inputType, validator,
          onChange, deletable, onDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return date(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return date?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (date != null) {
      return date(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoDate implements FormInputFieldInfo {
  const factory FormInputFieldInfoDate(
      {required final String id,
      required final String label,
      required final DateTime currentValue,
      required final String sectionName,
      required final InputType inputType,
      final FormFieldValidator<DateTime?>? validator,
      final void Function(DateTime)? onChange,
      final bool deletable,
      final void Function()? onDelete}) = _$FormInputFieldInfoDateImpl;

  String get id;
  String get label;
  DateTime get currentValue;
  @override
  String get sectionName;
  InputType get inputType;
  FormFieldValidator<DateTime?>? get validator;
  void Function(DateTime)? get onChange;
  bool get deletable;
  void Function()? get onDelete;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoDateImplCopyWith<_$FormInputFieldInfoDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoMapImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoMapImplCopyWith(
          _$FormInputFieldInfoMapImpl value,
          $Res Function(_$FormInputFieldInfoMapImpl) then) =
      __$$FormInputFieldInfoMapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String label, String sectionName, GeocoderResult? value});

  $GeocoderResultCopyWith<$Res>? get value;
}

/// @nodoc
class __$$FormInputFieldInfoMapImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res, _$FormInputFieldInfoMapImpl>
    implements _$$FormInputFieldInfoMapImplCopyWith<$Res> {
  __$$FormInputFieldInfoMapImplCopyWithImpl(_$FormInputFieldInfoMapImpl _value,
      $Res Function(_$FormInputFieldInfoMapImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? sectionName = null,
    Object? value = freezed,
  }) {
    return _then(_$FormInputFieldInfoMapImpl(
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
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as GeocoderResult?,
    ));
  }

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeocoderResultCopyWith<$Res>? get value {
    if (_value.value == null) {
      return null;
    }

    return $GeocoderResultCopyWith<$Res>(_value.value!, (value) {
      return _then(_value.copyWith(value: value));
    });
  }
}

/// @nodoc

class _$FormInputFieldInfoMapImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoMap {
  const _$FormInputFieldInfoMapImpl(
      {required this.id,
      required this.label,
      required this.sectionName,
      this.value = null});

  @override
  final String id;
  @override
  final String label;
  @override
  final String sectionName;
  @override
  @JsonKey()
  final GeocoderResult? value;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.map(id: $id, label: $label, sectionName: $sectionName, value: $value)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.map'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('value', value));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoMapImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, label, sectionName, value);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoMapImplCopyWith<_$FormInputFieldInfoMapImpl>
      get copyWith => __$$FormInputFieldInfoMapImplCopyWithImpl<
          _$FormInputFieldInfoMapImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return map(id, label, sectionName, value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return map?.call(id, label, sectionName, value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (map != null) {
      return map(id, label, sectionName, value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return map(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return map?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (map != null) {
      return map(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoMap implements FormInputFieldInfo {
  const factory FormInputFieldInfoMap(
      {required final String id,
      required final String label,
      required final String sectionName,
      final GeocoderResult? value}) = _$FormInputFieldInfoMapImpl;

  String get id;
  String get label;
  @override
  String get sectionName;
  GeocoderResult? get value;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoMapImplCopyWith<_$FormInputFieldInfoMapImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoSliderImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoSliderImplCopyWith(
          _$FormInputFieldInfoSliderImpl value,
          $Res Function(_$FormInputFieldInfoSliderImpl) then) =
      __$$FormInputFieldInfoSliderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      (double, double) range,
      List<String? Function(bool?)> validators,
      String sectionName,
      double? currentValue,
      (double, double)? currentValues,
      bool rangeSlider,
      SliderType type});
}

/// @nodoc
class __$$FormInputFieldInfoSliderImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoSliderImpl>
    implements _$$FormInputFieldInfoSliderImplCopyWith<$Res> {
  __$$FormInputFieldInfoSliderImplCopyWithImpl(
      _$FormInputFieldInfoSliderImpl _value,
      $Res Function(_$FormInputFieldInfoSliderImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? range = null,
    Object? validators = null,
    Object? sectionName = null,
    Object? currentValue = freezed,
    Object? currentValues = freezed,
    Object? rangeSlider = null,
    Object? type = null,
  }) {
    return _then(_$FormInputFieldInfoSliderImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      range: null == range
          ? _value.range
          : range // ignore: cast_nullable_to_non_nullable
              as (double, double),
      validators: null == validators
          ? _value._validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<String? Function(bool?)>,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: freezed == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double?,
      currentValues: freezed == currentValues
          ? _value.currentValues
          : currentValues // ignore: cast_nullable_to_non_nullable
              as (double, double)?,
      rangeSlider: null == rangeSlider
          ? _value.rangeSlider
          : rangeSlider // ignore: cast_nullable_to_non_nullable
              as bool,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SliderType,
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoSliderImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoSlider {
  const _$FormInputFieldInfoSliderImpl(
      {required this.id,
      required this.label,
      required this.range,
      required final List<String? Function(bool?)> validators,
      required this.sectionName,
      this.currentValue = null,
      this.currentValues = null,
      this.rangeSlider = false,
      this.type = SliderType.numeric})
      : _validators = validators;

  @override
  final String id;
  @override
  final String label;
  @override
  final (double, double) range;
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
  @JsonKey()
  final double? currentValue;
  @override
  @JsonKey()
  final (double, double)? currentValues;
  @override
  @JsonKey()
  final bool rangeSlider;
  @override
  @JsonKey()
  final SliderType type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.slider(id: $id, label: $label, range: $range, validators: $validators, sectionName: $sectionName, currentValue: $currentValue, currentValues: $currentValues, rangeSlider: $rangeSlider, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.slider'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('range', range))
      ..add(DiagnosticsProperty('validators', validators))
      ..add(DiagnosticsProperty('sectionName', sectionName))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('currentValues', currentValues))
      ..add(DiagnosticsProperty('rangeSlider', rangeSlider))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoSliderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.range, range) || other.range == range) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.currentValues, currentValues) ||
                other.currentValues == currentValues) &&
            (identical(other.rangeSlider, rangeSlider) ||
                other.rangeSlider == rangeSlider) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      range,
      const DeepCollectionEquality().hash(_validators),
      sectionName,
      currentValue,
      currentValues,
      rangeSlider,
      type);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoSliderImplCopyWith<_$FormInputFieldInfoSliderImpl>
      get copyWith => __$$FormInputFieldInfoSliderImplCopyWithImpl<
          _$FormInputFieldInfoSliderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return slider(id, label, range, validators, sectionName, currentValue,
        currentValues, rangeSlider, type);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return slider?.call(id, label, range, validators, sectionName, currentValue,
        currentValues, rangeSlider, type);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (slider != null) {
      return slider(id, label, range, validators, sectionName, currentValue,
          currentValues, rangeSlider, type);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return slider(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return slider?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (slider != null) {
      return slider(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoSlider implements FormInputFieldInfo {
  const factory FormInputFieldInfoSlider(
      {required final String id,
      required final String label,
      required final (double, double) range,
      required final List<String? Function(bool?)> validators,
      required final String sectionName,
      final double? currentValue,
      final (double, double)? currentValues,
      final bool rangeSlider,
      final SliderType type}) = _$FormInputFieldInfoSliderImpl;

  String get id;
  String get label;
  (double, double) get range;
  List<String? Function(bool?)> get validators;
  @override
  String get sectionName;
  double? get currentValue;
  (double, double)? get currentValues;
  bool get rangeSlider;
  SliderType get type;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoSliderImplCopyWith<_$FormInputFieldInfoSliderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoChipsImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoChipsImplCopyWith(
          _$FormInputFieldInfoChipsImpl value,
          $Res Function(_$FormInputFieldInfoChipsImpl) then) =
      __$$FormInputFieldInfoChipsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String label,
      Iterable<String> values,
      Iterable<String> currentValue,
      List<String? Function(bool?)> validators,
      String sectionName});
}

/// @nodoc
class __$$FormInputFieldInfoChipsImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoChipsImpl>
    implements _$$FormInputFieldInfoChipsImplCopyWith<$Res> {
  __$$FormInputFieldInfoChipsImplCopyWithImpl(
      _$FormInputFieldInfoChipsImpl _value,
      $Res Function(_$FormInputFieldInfoChipsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? label = null,
    Object? values = null,
    Object? currentValue = null,
    Object? validators = null,
    Object? sectionName = null,
  }) {
    return _then(_$FormInputFieldInfoChipsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      values: null == values
          ? _value.values
          : values // ignore: cast_nullable_to_non_nullable
              as Iterable<String>,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as Iterable<String>,
      validators: null == validators
          ? _value._validators
          : validators // ignore: cast_nullable_to_non_nullable
              as List<String? Function(bool?)>,
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoChipsImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoChips {
  const _$FormInputFieldInfoChipsImpl(
      {required this.id,
      required this.label,
      required this.values,
      required this.currentValue,
      required final List<String? Function(bool?)> validators,
      required this.sectionName})
      : _validators = validators;

  @override
  final String id;
  @override
  final String label;
  @override
  final Iterable<String> values;
  @override
  final Iterable<String> currentValue;
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.chips(id: $id, label: $label, values: $values, currentValue: $currentValue, validators: $validators, sectionName: $sectionName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.chips'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('label', label))
      ..add(DiagnosticsProperty('values', values))
      ..add(DiagnosticsProperty('currentValue', currentValue))
      ..add(DiagnosticsProperty('validators', validators))
      ..add(DiagnosticsProperty('sectionName', sectionName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoChipsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.label, label) || other.label == label) &&
            const DeepCollectionEquality().equals(other.values, values) &&
            const DeepCollectionEquality()
                .equals(other.currentValue, currentValue) &&
            const DeepCollectionEquality()
                .equals(other._validators, _validators) &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      label,
      const DeepCollectionEquality().hash(values),
      const DeepCollectionEquality().hash(currentValue),
      const DeepCollectionEquality().hash(_validators),
      sectionName);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoChipsImplCopyWith<_$FormInputFieldInfoChipsImpl>
      get copyWith => __$$FormInputFieldInfoChipsImplCopyWithImpl<
          _$FormInputFieldInfoChipsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return chips(id, label, values, currentValue, validators, sectionName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return chips?.call(
        id, label, values, currentValue, validators, sectionName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (chips != null) {
      return chips(id, label, values, currentValue, validators, sectionName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return chips(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return chips?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (chips != null) {
      return chips(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoChips implements FormInputFieldInfo {
  const factory FormInputFieldInfoChips(
      {required final String id,
      required final String label,
      required final Iterable<String> values,
      required final Iterable<String> currentValue,
      required final List<String? Function(bool?)> validators,
      required final String sectionName}) = _$FormInputFieldInfoChipsImpl;

  String get id;
  String get label;
  Iterable<String> get values;
  Iterable<String> get currentValue;
  List<String? Function(bool?)> get validators;
  @override
  String get sectionName;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoChipsImplCopyWith<_$FormInputFieldInfoChipsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FormInputFieldInfoShimmerImplCopyWith<$Res>
    implements $FormInputFieldInfoCopyWith<$Res> {
  factory _$$FormInputFieldInfoShimmerImplCopyWith(
          _$FormInputFieldInfoShimmerImpl value,
          $Res Function(_$FormInputFieldInfoShimmerImpl) then) =
      __$$FormInputFieldInfoShimmerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String sectionName});
}

/// @nodoc
class __$$FormInputFieldInfoShimmerImplCopyWithImpl<$Res>
    extends _$FormInputFieldInfoCopyWithImpl<$Res,
        _$FormInputFieldInfoShimmerImpl>
    implements _$$FormInputFieldInfoShimmerImplCopyWith<$Res> {
  __$$FormInputFieldInfoShimmerImplCopyWithImpl(
      _$FormInputFieldInfoShimmerImpl _value,
      $Res Function(_$FormInputFieldInfoShimmerImpl) _then)
      : super(_value, _then);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sectionName = null,
  }) {
    return _then(_$FormInputFieldInfoShimmerImpl(
      sectionName: null == sectionName
          ? _value.sectionName
          : sectionName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FormInputFieldInfoShimmerImpl
    with DiagnosticableTreeMixin
    implements FormInputFieldInfoShimmer {
  const _$FormInputFieldInfoShimmerImpl({required this.sectionName});

  @override
  final String sectionName;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FormInputFieldInfo.shimmer(sectionName: $sectionName)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FormInputFieldInfo.shimmer'))
      ..add(DiagnosticsProperty('sectionName', sectionName));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FormInputFieldInfoShimmerImpl &&
            (identical(other.sectionName, sectionName) ||
                other.sectionName == sectionName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sectionName);

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FormInputFieldInfoShimmerImplCopyWith<_$FormInputFieldInfoShimmerImpl>
      get copyWith => __$$FormInputFieldInfoShimmerImplCopyWithImpl<
          _$FormInputFieldInfoShimmerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)
        textArea,
    required TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)
        dropdown,
    required TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)
        checkbox,
    required TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)
        imagePicker,
    required TResult Function(
            String id, String label, String sectionName, void Function() cancel)
        cancelButton,
    required TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)
        submitButton,
    required TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)
        twoAutoCompleteFields,
    required TResult Function(String id, String label, String sectionName,
            void Function() callback)
        customButton,
    required TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)
        date,
    required TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)
        map,
    required TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)
        slider,
    required TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)
        chips,
    required TResult Function(String sectionName) shimmer,
  }) {
    return shimmer(sectionName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult? Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult? Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult? Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult? Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult? Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult? Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult? Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult? Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult? Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult? Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult? Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult? Function(String sectionName)? shimmer,
  }) {
    return shimmer?.call(sectionName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String label,
            List<String? Function(String?)> validators,
            String sectionName,
            String? currentValue,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete,
            TextEditingController? controller)?
        textArea,
    TResult Function(
            String id,
            String label,
            dynamic currentValue,
            List<dynamic> options,
            String Function(dynamic) optionToString,
            List<String? Function(String?)> validators,
            String sectionName,
            void Function(dynamic)? onChange,
            bool deletable,
            void Function()? onDelete)?
        dropdown,
    TResult Function(
            String id,
            String label,
            bool currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange,
            bool deletable,
            void Function()? onDelete)?
        checkbox,
    TResult Function(
            String id,
            String label,
            String? currentValue,
            List<String? Function(bool?)> validators,
            String sectionName,
            void Function(String)? onChange)?
        imagePicker,
    TResult Function(String id, String label, String sectionName,
            void Function() cancel)?
        cancelButton,
    TResult Function(String id, String label, String sectionName,
            void Function(Map<String, dynamic>?) save)?
        submitButton,
    TResult Function(
            String id,
            String id2,
            String labelLeft,
            String labelRight,
            String currentValueLeft,
            String currentValueRight,
            List<String> optionsLeft,
            Map<String, Set<String>> optionsRight,
            List<String? Function(String?)> validatorsLeft,
            List<String? Function(String?)> validatorsRight,
            String sectionName,
            bool deletable,
            void Function()? onDelete)?
        twoAutoCompleteFields,
    TResult Function(String id, String label, String sectionName,
            void Function() callback)?
        customButton,
    TResult Function(
            String id,
            String label,
            DateTime currentValue,
            String sectionName,
            InputType inputType,
            FormFieldValidator<DateTime?>? validator,
            void Function(DateTime)? onChange,
            bool deletable,
            void Function()? onDelete)?
        date,
    TResult Function(
            String id, String label, String sectionName, GeocoderResult? value)?
        map,
    TResult Function(
            String id,
            String label,
            (double, double) range,
            List<String? Function(bool?)> validators,
            String sectionName,
            double? currentValue,
            (double, double)? currentValues,
            bool rangeSlider,
            SliderType type)?
        slider,
    TResult Function(
            String id,
            String label,
            Iterable<String> values,
            Iterable<String> currentValue,
            List<String? Function(bool?)> validators,
            String sectionName)?
        chips,
    TResult Function(String sectionName)? shimmer,
    required TResult orElse(),
  }) {
    if (shimmer != null) {
      return shimmer(sectionName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FormInputFieldInfoTextArea value) textArea,
    required TResult Function(FormInputFieldInfoDropDown value) dropdown,
    required TResult Function(FormInputFieldInfoCheckbox value) checkbox,
    required TResult Function(FormInputFieldInfoImagePicker value) imagePicker,
    required TResult Function(FormInputFieldInfoCancelButton value)
        cancelButton,
    required TResult Function(FormInputFieldInfoSubmitButton value)
        submitButton,
    required TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)
        twoAutoCompleteFields,
    required TResult Function(FormInputFieldInfoCustomButton value)
        customButton,
    required TResult Function(FormInputFieldInfoDate value) date,
    required TResult Function(FormInputFieldInfoMap value) map,
    required TResult Function(FormInputFieldInfoSlider value) slider,
    required TResult Function(FormInputFieldInfoChips value) chips,
    required TResult Function(FormInputFieldInfoShimmer value) shimmer,
  }) {
    return shimmer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FormInputFieldInfoTextArea value)? textArea,
    TResult? Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult? Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult? Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult? Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult? Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult? Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult? Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult? Function(FormInputFieldInfoDate value)? date,
    TResult? Function(FormInputFieldInfoMap value)? map,
    TResult? Function(FormInputFieldInfoSlider value)? slider,
    TResult? Function(FormInputFieldInfoChips value)? chips,
    TResult? Function(FormInputFieldInfoShimmer value)? shimmer,
  }) {
    return shimmer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FormInputFieldInfoTextArea value)? textArea,
    TResult Function(FormInputFieldInfoDropDown value)? dropdown,
    TResult Function(FormInputFieldInfoCheckbox value)? checkbox,
    TResult Function(FormInputFieldInfoImagePicker value)? imagePicker,
    TResult Function(FormInputFieldInfoCancelButton value)? cancelButton,
    TResult Function(FormInputFieldInfoSubmitButton value)? submitButton,
    TResult Function(FormInputFieldInfoTwoAutoCompleteFields value)?
        twoAutoCompleteFields,
    TResult Function(FormInputFieldInfoCustomButton value)? customButton,
    TResult Function(FormInputFieldInfoDate value)? date,
    TResult Function(FormInputFieldInfoMap value)? map,
    TResult Function(FormInputFieldInfoSlider value)? slider,
    TResult Function(FormInputFieldInfoChips value)? chips,
    TResult Function(FormInputFieldInfoShimmer value)? shimmer,
    required TResult orElse(),
  }) {
    if (shimmer != null) {
      return shimmer(this);
    }
    return orElse();
  }
}

abstract class FormInputFieldInfoShimmer implements FormInputFieldInfo {
  const factory FormInputFieldInfoShimmer({required final String sectionName}) =
      _$FormInputFieldInfoShimmerImpl;

  @override
  String get sectionName;

  /// Create a copy of FormInputFieldInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FormInputFieldInfoShimmerImplCopyWith<_$FormInputFieldInfoShimmerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
