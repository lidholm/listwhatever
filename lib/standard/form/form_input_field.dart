import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_input_field.freezed.dart';

@freezed
sealed class FormInputField<T> with _$FormInputField<T> {
  const factory FormInputField.textArea({
    required String id,
    required String label,
    required T currentValue,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
  }) = FormInputFieldTextArea<T>;

  const factory FormInputField.dropdown({
    required String id,
    required String label,
    required T currentValue,
    required List<T> options,
    required String Function(dynamic) optionToString,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
  }) = FormInputFieldDropDown<T>;

  const factory FormInputField.checkbox({
    required String id,
    required String label,
    required bool currentValue,
    required List<FormFieldValidator<bool>> validators,
    required String sectionName,
    required bool hasError,
  }) = FormInputFieldCheckbox<T>;
}
