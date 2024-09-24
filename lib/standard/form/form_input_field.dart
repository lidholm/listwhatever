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
    required String Function(T) optionToString,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
  }) = FormInputFieldDropDown<T>;
}
