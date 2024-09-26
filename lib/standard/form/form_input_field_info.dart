import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_input_field_info.freezed.dart';

@freezed
sealed class FormInputFieldInfo<T> with _$FormInputFieldInfo<T> {
  const factory FormInputFieldInfo.textArea({
    required String id,
    required String label,
    required T currentValue,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(T)? onChange,
  }) = FormInputFieldInfoTextArea<T>;

  const factory FormInputFieldInfo.dropdown({
    required String id,
    required String label,
    required T currentValue,
    required List<T> options,
    required String Function(dynamic) optionToString,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(dynamic)? onChange,
  }) = FormInputFieldInfoDropDown<T>;

  const factory FormInputFieldInfo.checkbox({
    required String id,
    required String label,
    required bool currentValue,
    required List<FormFieldValidator<bool>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(T)? onChange,
  }) = FormInputFieldInfoCheckbox<T>;

  const factory FormInputFieldInfo.imagePicker({
    required String id,
    required String label,
    required String? currentValue,
    required List<FormFieldValidator<bool>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(T)? onChange,
  }) = FormInputFieldInfoImagePicker<T>;

  const factory FormInputFieldInfo.cancelButton({
    required String id,
    required String label,
    required String sectionName,
    required Function cancel,
  }) = FormInputFieldInfoCancelButton<T>;

  const factory FormInputFieldInfo.submitButton({
    required String id,
    required String label,
    required String sectionName,
    required void Function(Map<String, dynamic>?) save,
  }) = FormInputFieldInfoSubmitButton<T>;
}
