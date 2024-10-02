import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

class FormInputFieldCancelButton extends StatelessWidget {
  const FormInputFieldCancelButton({
    required this.formKey,
    required this.field,
    super.key,
  });
  final FormInputFieldInfoCancelButton field;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      key: Key(field.id),
      onPressed: () {
        // formKey.currentState?.reset();
        field.cancel();
      },
      // color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
        child: Text(
          'Reset',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
