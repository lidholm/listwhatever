import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

class FormInputFieldSubmitButton extends StatelessWidget {
  const FormInputFieldSubmitButton({
    required this.formKey,
    required this.field,
    super.key,
  });
  final FormInputFieldInfoSubmitButton field;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (formKey.currentState?.saveAndValidate() ?? false) {
          logger.d(formKey.currentState?.value.toString());
          field.save(formKey.currentState?.value);
        } else {
          logger
            ..d(formKey.currentState?.value.toString())
            ..d('validation failed');
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Text(
          field.label,
        ),
      ),
    );
  }
}
