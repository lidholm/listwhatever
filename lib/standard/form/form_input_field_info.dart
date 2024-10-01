import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_input_field_info.freezed.dart';

@freezed
sealed class FormInputFieldInfo with _$FormInputFieldInfo {
  const factory FormInputFieldInfo.textArea({
    required String id,
    required String label,
    required String currentValue,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(String)? onChange,
    @Default(false) bool deletable,
    @Default(null) void Function()? onDelete,
  }) = FormInputFieldInfoTextArea;

  const factory FormInputFieldInfo.dropdown({
    required String id,
    required String label,
    required String currentValue,
    required List<String> options,
    required String Function(String) optionToString,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(String?)? onChange,
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
    required String labelLeft,
    required String labelRight,
    required String currentValueLeft,
    required String currentValueRight,
    required List<String> optionsLeft,
    required List<String> Function(String value) optionsRight,
    required List<FormFieldValidator<String>> validatorsLeft,
    required List<FormFieldValidator<String>> validatorsRight,
    required String sectionName,
    required bool hasErrorleft,
    required bool hasErrorRight,
    @Default(null) void Function(String value)? onChangeLeft,
    @Default(null) void Function(String value)? onChangeRight,
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
}
