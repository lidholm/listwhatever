import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/form/form_input_field_cancel_button.dart';
import 'package:listwhatever/standard/form/form_input_field_checkbox.dart';
import 'package:listwhatever/standard/form/form_input_field_drop_down.dart';
import 'package:listwhatever/standard/form/form_input_field_image_picker.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_field_submit_button.dart';
import 'package:listwhatever/standard/form/form_input_field_text_area.dart';
import 'package:listwhatever/standard/widgets/border_with_header.dart';
import 'package:listwhatever/standard/widgets/vStack/v_stack.dart';
import 'package:listwhatever/standard/widgets/vStack/x_stack.dart';

import '/standard/widgets/vStack/x_stack.dart' as x_stack;

class FormGenerator extends StatefulWidget {
  const FormGenerator({
    required this.formKey,
    required this.sections,
    required this.fields,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final Map<String, x_stack.AxisDirection> sections;
  // ignore: strict_raw_type
  final List<FormInputFieldInfo> fields;

  @override
  State<StatefulWidget> createState() {
    return _FormGeneratorState();
  }
}

class _FormGeneratorState extends State<FormGenerator> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.i('$className: building.');
    logger.i('$className: fields: ${widget.fields.length}.');
    return FormBuilder(
      key: widget.formKey,
      // enabled: false,
      onChanged: () {
        // widget.formKey.currentState!.save();
        debugPrint('form values: ${widget.formKey.currentState!.value}');
      },
      // autovalidateMode: AutovalidateMode.disabled,
      // initialValue: const {
      //   'movie_rating': 5,
      //   'best_language': 'Dart',
      //   'age': '13',
      //   'gender': 'Male',
      //   'languages_filter': ['Dart']
      // },
      skipDisabled: true,
      child: VStack(
        spacing: 25,
        children: widget.sections.entries.map(generateSection).toList(),
      ),
    );
  }

  Widget generateSection(
    MapEntry<String, x_stack.AxisDirection> section,
  ) {
    final sectionFields =
        widget.fields.where((f) => f.sectionName == section.key);
    final fields = sectionFields.map(generateField).toList();

    logger.i(
      '$className: generateSection ${section.key}: fields: ${fields.length}.',
    );

    final child = XStack(
      axisDirection: section.value,
      mainAxisAlignment: section.value == x_stack.AxisDirection.horizontal
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.center,
      spacing: section.value == x_stack.AxisDirection.horizontal ? 0 : 10,
      spacingPosition: section.value == x_stack.AxisDirection.horizontal
          ? SpacingPosition.none
          : SpacingPosition.beforeAndBetween,
      children: [
        ...fields,
      ],
    );

    return BorderWithHeader(title: section.key, child: child);
  }

  Widget generateField<T>(
    FormInputFieldInfo<T> field,
  ) {
    logger.i('$className: generateField ${field.label}.');

    return switch (field) {
      FormInputFieldInfoTextArea() => FormInputFieldTextArea(field: field),
      FormInputFieldInfoDropDown() => FormInputFieldDropDown(field: field),
      FormInputFieldInfoCheckbox<T>() => FormInputFieldCheckbox(field: field),
      FormInputFieldInfoImagePicker<T>() =>
        FormInputFieldImagePicker(field: field),
      FormInputFieldInfoCancelButton<T>() =>
        FormInputFieldCancelButton(formKey: widget.formKey, field: field),
      FormInputFieldInfoSubmitButton<T>() =>
        FormInputFieldSubmitButton(formKey: widget.formKey, field: field),
    };
  }
}
