import 'package:flutter/material.dart';
import 'package:allmylists/standard/appUi/colors/app_colors.dart';
import 'package:allmylists/standard/appUi/spacing/app_spacing.dart';
import 'package:allmylists/standard/appUi/widgets/app_text_field.dart';

/// {@template app_password_text_field}
/// An password text field component.
/// {@endtemplate}
class AppPasswordTextField extends StatelessWidget {
  /// {@macro app_password_text_field}
  const AppPasswordTextField({
    super.key,
    this.controller,
    this.hintText,
    this.suffix,
    this.readOnly,
    this.onChanged,
  });

  /// Controls the text being edited.
  final TextEditingController? controller;

  /// Text that suggests what sort of input the field accepts.
  final String? hintText;

  /// A widget that appears after the editable part of the text field.
  final Widget? suffix;

  /// Called when the user inserts or deletes texts in the text field.
  final ValueChanged<String>? onChanged;

  /// Whether the text field should be read-only.
  /// Defaults to false.
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: hintText,
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      autoFillHints: const [AutofillHints.password],
      autocorrect: false,
      prefix: const Padding(
        padding: EdgeInsets.only(
          left: AppSpacing.sm,
          right: AppSpacing.sm,
        ),
        child: Icon(
          Icons.lock,
          color: AppColors.mediumEmphasisSurface,
          size: 24,
        ),
      ),
      readOnly: readOnly ?? false,
      onChanged: onChanged,
      suffix: suffix,
    );
  }
}
