import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/form/form_input_field_info.dart';

class FormInputFieldDate extends StatelessWidget {
  const FormInputFieldDate({required this.field, super.key});

  final FormInputFieldInfoDate field;

  @override
  Widget build(BuildContext context) {
    final dateField = FormBuilderDateTimePicker(
      decoration: InputDecoration(labelText: field.label),
      key: Key(field.id),
      name: field.id,
      initialValue: field.currentValue,
      validator: field.validator,
      textInputAction: TextInputAction.next,
      initialTime: const TimeOfDay(hour: 8, minute: 0),
      inputType: field.inputType,
    );

    if (field.deletable) {
      return Row(
        children: [
          Expanded(child: dateField),
          IconButton(
            onPressed: field.onDelete,
            icon: const Icon(Icons.delete),
            padding: const EdgeInsets.only(bottom: 25),
          ),
        ],
      );
    }
    return dateField;
  }
}
