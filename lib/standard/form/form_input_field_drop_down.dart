import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

class FormInputFieldDropDown<T> extends StatelessWidget {
  const FormInputFieldDropDown({required this.field, super.key});

  final FormInputFieldInfoDropDown<T> field;

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown<T>(
      name: field.id,
      decoration: InputDecoration(
        labelText: 'Type',
        suffix:
            field.hasError ? const Icon(Icons.error) : const Icon(Icons.check),
        hintText: 'Select Type',
      ),
      validator: FormBuilderValidators.compose(
        [FormBuilderValidators.required()],
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
      valueTransformer: (val) => val?.toString(),
    );
  }
}
