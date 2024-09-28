import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_input_field_info.freezed.dart';

@freezed
sealed class FormInputFieldInfo<T, S> with _$FormInputFieldInfo<T, S> {
  const factory FormInputFieldInfo.textArea({
    required String id,
    required String label,
    required T currentValue,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(T)? onChange,
  }) = FormInputFieldInfoTextArea<T, S>;

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
  }) = FormInputFieldInfoDropDown<T, S>;

  const factory FormInputFieldInfo.checkbox({
    required String id,
    required String label,
    required bool currentValue,
    required List<FormFieldValidator<bool>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(T)? onChange,
  }) = FormInputFieldInfoCheckbox<T, S>;

  const factory FormInputFieldInfo.imagePicker({
    required String id,
    required String label,
    required String? currentValue,
    required List<FormFieldValidator<bool>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(T)? onChange,
  }) = FormInputFieldInfoImagePicker<T, S>;

  const factory FormInputFieldInfo.cancelButton({
    required String id,
    required String label,
    required String sectionName,
    required void Function() cancel,
  }) = FormInputFieldInfoCancelButton<T, S>;

  const factory FormInputFieldInfo.submitButton({
    required String id,
    required String label,
    required String sectionName,
    required void Function(Map<String, dynamic>?) save,
  }) = FormInputFieldInfoSubmitButton<T, S>;

  const factory FormInputFieldInfo.twoFreeTextDropdown({
    required String id,
    required String labelLeft,
    required String labelRight,
    required T currentValueLeft,
    required S currentValueRight,
    required List<T> optionsLeft,
    required List<S> optionsRight,
    required String Function(T) optionLeftToString,
    required String Function(S) optionRightToString,
    required List<FormFieldValidator<String>> validatorsLeft,
    required List<FormFieldValidator<String>> validatorsRight,
    required String sectionName,
    required bool hasErrorleft,
    required bool hasErrorRight,
    @Default(null) void Function(dynamic)? onChange,
  }) = FormInputFieldInfoTwoFreeTextDropdown<T, S>;

  const factory FormInputFieldInfo.customButton({
    required String id,
    required String label,
    required String sectionName,
    required void Function() callback,
  }) = FormInputFieldInfoCustomButton<T, S>;

  const factory FormInputFieldInfo.date({
    required String id,
    required String label,
    required T currentValue,
    required List<FormFieldValidator<String>> validators,
    required String sectionName,
    required bool hasError,
    @Default(null) void Function(T)? onChange,
  }) = FormInputFieldInfoDate<T, S>;
}
