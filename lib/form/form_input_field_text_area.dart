import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:listwhatever/form/form_input_field_info.dart';

const String className = 'FormInputFieldTextArea';

class FormInputFieldTextArea extends StatelessWidget {
  const FormInputFieldTextArea({required this.field, super.key});

  final FormInputFieldInfoTextArea field;

  @override
  Widget build(BuildContext context) {
    final textField = FormBuilderTextField(
      decoration: InputDecoration(labelText: field.label),
      key: Key(field.id),
      autovalidateMode: AutovalidateMode.always,
      name: field.id,
      initialValue: field.currentValue,
      controller: field.controller,
      validator: FormBuilderValidators.compose(field.validators),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );

    if (field.deletable) {
      return Row(
        children: [
          Expanded(child: textField),
          IconButton(
            onPressed: field.onDelete,
            icon: const Icon(Icons.delete),
            padding: const EdgeInsets.only(bottom: 25),
          ),
        ],
      );
    }
    return textField;
  }
}
