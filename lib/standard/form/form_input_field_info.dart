import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/geocoder/geocoderresult.dart';

part 'form_input_field_info.freezed.dart';

enum SliderType {
  numeric,
  date,
  timeOfDay,
}

@freezed
sealed class FormInputFieldInfo with _$FormInputFieldInfo {
  const factory FormInputFieldInfo.textArea({
    required String id,
    required String label,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    @Default(null) String? currentValue,
    @Default(null) void Function(String)? onChange,
    @Default(false) bool deletable,
    @Default(null) void Function()? onDelete,
    @Default(null) TextEditingController? controller,
  }) = FormInputFieldInfoTextArea;

  const factory FormInputFieldInfo.dropdown({
    required String id,
    required String label,
    required dynamic currentValue,
    required List<dynamic> options,
    required String Function(dynamic) optionToString,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    @Default(null) void Function(dynamic)? onChange,
    @Default(false) bool deletable,
    @Default(null) void Function()? onDelete,
  }) = FormInputFieldInfoDropDown;

  const factory FormInputFieldInfo.checkbox({
    required String id,
    required String label,
    required bool currentValue,
    required List<FormFieldValidator<bool>> validators,
    required String sectionName,
    @Default(null) void Function(String)? onChange,
    @Default(false) bool deletable,
    @Default(null) void Function()? onDelete,
  }) = FormInputFieldInfoCheckbox;

  const factory FormInputFieldInfo.imagePicker({
    required String id,
    required String label,
    required String? currentValue,
    required List<FormFieldValidator<bool>> validators,
    required String sectionName,
    @Default(null) void Function(String value)? onChange,
  }) = FormInputFieldInfoImagePicker;

  const factory FormInputFieldInfo.cancelButton({
    required String id,
    required String label,
    required String sectionName,
    required void Function() cancel,
  }) = FormInputFieldInfoCancelButton;

  const factory FormInputFieldInfo.submitButton({
    required String id,
    required String label,
    required String sectionName,
    required void Function(Map<String, dynamic>?) save,
  }) = FormInputFieldInfoSubmitButton;

  const factory FormInputFieldInfo.twoAutoCompleteFields({
    required String id,
    required String id2,
    required String labelLeft,
    required String labelRight,
    required String currentValueLeft,
    required String currentValueRight,
    required List<String> optionsLeft,
    required Map<String, Set<String>> optionsRight,
    required List<FormFieldValidator<String>> validatorsLeft,
    required List<FormFieldValidator<String>> validatorsRight,
    required String sectionName,
    @Default(false) bool deletable,
    @Default(null) void Function()? onDelete,
  }) = FormInputFieldInfoTwoAutoCompleteFields;

  const factory FormInputFieldInfo.customButton({
    required String id,
    required String label,
    required String sectionName,
    required void Function() callback,
  }) = FormInputFieldInfoCustomButton;

  const factory FormInputFieldInfo.date({
    required String id,
    required String label,
    required DateTime currentValue,
    required String sectionName,
    required InputType inputType,
    @Default(null) FormFieldValidator<DateTime?>? validator,
    @Default(null) void Function(DateTime value)? onChange,
    @Default(false) bool deletable,
    @Default(null) void Function()? onDelete,
  }) = FormInputFieldInfoDate;

  const factory FormInputFieldInfo.map({
    required String id,
    required String label,
    required String sectionName,
    @Default(null) GeocoderResult? value,
  }) = FormInputFieldInfoMap;

  const factory FormInputFieldInfo.slider({
    required String id,
    required String label,
    required (double, double) range,
    required List<FormFieldValidator<bool>> validators,
    required String sectionName,
    @Default(null) double? currentValue,
    @Default(null) (double, double)? currentValues,
    @Default(false) bool rangeSlider,
    @Default(SliderType.numeric) SliderType type,
  }) = FormInputFieldInfoSlider;

  const factory FormInputFieldInfo.chips({
    required String id,
    required String label,
    required Iterable<String> values,
    required Iterable<String> currentValue,
    required List<FormFieldValidator<bool>> validators,
    required String sectionName,
  }) = FormInputFieldInfoChips;
}
