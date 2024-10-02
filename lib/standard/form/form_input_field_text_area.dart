import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
// ignore: unused_import
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

const String className = 'FormInputFieldTextArea';

class FormInputFieldTextArea extends StatelessWidget {
  const FormInputFieldTextArea({required this.field, super.key});

  final FormInputFieldInfoTextArea field;

  @override
  Widget build(BuildContext context) {
    final textField = FormBuilderTextField(
      key: Key(field.id),
      autovalidateMode: AutovalidateMode.always,
      name: field.id,
      initialValue: field.currentValue,
      decoration: InputDecoration(
        labelText: field.label,
        suffixIcon: field.hasError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check, color: Colors.green),
      ),
      // valueTransformer: (text) => num.tryParse(text),
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
