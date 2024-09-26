import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

class FormInputFieldTextArea<T> extends StatelessWidget {
  const FormInputFieldTextArea({required this.field, super.key});

  final FormInputFieldInfoTextArea<T> field;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: field.id,
      initialValue: field.currentValue.toString(),
      decoration: InputDecoration(
        labelText: field.label,
        suffixIcon: field.hasError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (value) {
        print('value: $value');
      },
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose(field.validators),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }
}
