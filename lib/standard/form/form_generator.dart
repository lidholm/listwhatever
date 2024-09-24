import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:listwhatever/standard/form/form_input_field.dart';
import 'package:listwhatever/standard/widgets/vStack/v_stack.dart';

class FormGenerator {
  const FormGenerator({
    required this.formKey,
    required this.sectionNames,
    required this.formInputFields,
  });

  final Key formKey;
  final List<String> sectionNames;
  // ignore: strict_raw_type
  final List<FormInputField> formInputFields;

  FormBuilder generateForm() {
    return FormBuilder(key: formKey, child: generateSections());
  }

  Widget generateSections() {
    return VStack(
      children: sectionNames
          .map(generateSection)
          .expand((innerList) => innerList)
          .toList(),
    );
  }

  List<Widget> generateSection(String sectionName) {
    final sectionFields =
        formInputFields.where((f) => f.sectionName == sectionName);
    final fields = sectionFields.map(generateField).toList();

    return [
      Text(sectionName),
      ...fields,
    ];
  }

  Widget generateField<T>(FormInputField<T> field) {
    return switch (field) {
      FormInputFieldTextArea() => generateTextAreaField(field),
      FormInputFieldDropDown() => throw UnimplementedError(),
    };
  }

  Widget generateTextAreaField<T>(FormInputFieldTextArea<T> field) {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: field.id,
      decoration: InputDecoration(
        labelText: field.label,
        suffixIcon: field.hasError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        // setState(() {
        //   _nameHasError = !(_formKey
        //           .currentState?.fields[AddListValues.name.toString()]
        //           ?.validate() ??
        //       false);
        // });
      },
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose(field.validators),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }
}
