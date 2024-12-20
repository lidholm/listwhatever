import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:listwhatever/form/form_input_field_info.dart';

class FormInputFieldDropDown extends StatelessWidget {
  const FormInputFieldDropDown({required this.field, super.key});

  final FormInputFieldInfoDropDown field;

  @override
  Widget build(BuildContext context) {
    final dropdown = FormBuilderDropdown(
      decoration: InputDecoration(labelText: field.label),
      name: field.id,
      initialValue: field.currentValue,
      // decoration: InputDecoration(
      //   labelText: 'Type',
      //   suffix:
      //       field.hasError ? const Icon(Icons.error) : const Icon(Icons.check),
      //   hintText: 'Select Type',
      // ),
      validator: FormBuilderValidators.compose(
        [FormBuilderValidators.required<dynamic>()],
      ),
      items: field.options
          .map(
            (type) => DropdownMenuItem(
              alignment: AlignmentDirectional.center,
              value: type,
              child: Text(field.optionToString(type)),
            ),
          )
          .toList(),
      onChanged: (val) {
        field.onChange?.call(val);
      },
    );

    if (field.deletable) {
      return Row(
        children: [
          Expanded(child: dropdown),
          IconButton(
            onPressed: field.onDelete,
            icon: const Icon(Icons.delete),
            padding: const EdgeInsets.only(bottom: 25),
          ),
        ],
      );
    }
    return dropdown;
  }
}
