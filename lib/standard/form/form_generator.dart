import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/form/form_input_field_checkbox.dart';
import 'package:listwhatever/standard/form/form_input_field_drop_down.dart';
import 'package:listwhatever/standard/form/form_input_field_image_picker.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_field_text_area.dart';
import 'package:listwhatever/standard/widgets/vStack/v_stack.dart';

class FormGenerator extends StatefulWidget {
  const FormGenerator({
    required this.formKey,
    required this.sectionNames,
    required this.fields,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final List<String> sectionNames;
  // ignore: strict_raw_type
  final List<FormInputFieldInfo> fields;

  @override
  State<StatefulWidget> createState() {
    return _FormGeneratorState();
  }
}

class _FormGeneratorState extends State<FormGenerator> {
  // ignore: strict_raw_type
  late final List<FormInputFieldInfo> formInputFields;

  @override
  void initState() {
    super.initState();
    formInputFields = widget.fields;
  }

  @override
  Widget build(BuildContext context) {
    return VStack(
      children: widget.sectionNames
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

  Widget generateField<T>(FormInputFieldInfo<T> field) {
    return switch (field) {
      FormInputFieldInfoTextArea() => FormInputFieldTextArea(field: field),
      FormInputFieldInfoDropDown() => FormInputFieldDropDown(field: field),
      FormInputFieldInfoCheckbox<T>() => FormInputFieldCheckbox(field: field),
      FormInputFieldInfoImagePicker<T>() =>
        FormInputFieldImagePicker(field: field),
    };
  }
}
