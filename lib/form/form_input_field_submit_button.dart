import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/form/form_input_field_info.dart';

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
      key: Key(field.id),
      onPressed: () {
        if (formKey.currentState?.saveAndValidate() ?? false) {
          field.save(formKey.currentState?.value);
        } else {}
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
