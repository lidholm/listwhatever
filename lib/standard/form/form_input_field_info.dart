import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/geocoder/geocoderresult.dart';

part 'form_input_field_info.freezed.dart';

@freezed
sealed class FormInputFieldInfo with _$FormInputFieldInfo {
  const factory FormInputFieldInfo.textArea({
    required String id,
    required String label,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
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
    required bool hasError,
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
    required bool hasError,
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
    required bool hasError,
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
    required bool hasErrorleft,
    required bool hasErrorRight,
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
    required String currentValue,
    required List<FormFieldValidator<DateTime?>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(String value)? onChange,
    @Default(false) bool deletable,
    @Default(null) void Function()? onDelete,
  }) = FormInputFieldInfoDate;

  const factory FormInputFieldInfo.map({
    required String id,
    required String label,
    required String sectionName,
    @Default(null) GeocoderResult? value,
  }) = FormInputFieldInfoMap;
}
