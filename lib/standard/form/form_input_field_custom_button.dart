import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

class FormInputFieldCustomButton extends StatelessWidget {
  const FormInputFieldCustomButton({
    required this.formKey,
    required this.field,
    super.key,
  });
  final FormInputFieldInfoCustomButton field;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        field.callback();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        child: Text(
          field.label,
        ),
      ),
    );
  }
}
