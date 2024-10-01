import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// ignore: unused_import
import 'package:listwhatever/standard/constants.dart';

import 'package:listwhatever/standard/form/form_input_field_cancel_button.dart';
import 'package:listwhatever/standard/form/form_input_field_checkbox.dart';
import 'package:listwhatever/standard/form/form_input_field_custom_button.dart';
import 'package:listwhatever/standard/form/form_input_field_date.dart';
import 'package:listwhatever/standard/form/form_input_field_drop_down.dart';
import 'package:listwhatever/standard/form/form_input_field_image_picker.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_field_submit_button.dart';
import 'package:listwhatever/standard/form/form_input_field_text_area.dart';
import 'package:listwhatever/standard/form/form_input_field_two_auto_complete_fields.dart';
import 'package:listwhatever/standard/form/form_input_section.dart';
import 'package:listwhatever/standard/widgets/border_with_header.dart';
import 'package:listwhatever/standard/widgets/vStack/v_stack.dart';
import 'package:listwhatever/standard/widgets/vStack/x_stack.dart';

import '/standard/widgets/vStack/x_stack.dart' as x_stack;

const String className = 'FormGenerator';

class FormGenerator extends StatefulWidget {
  const FormGenerator({
    required this.formKey,
    required this.sections,
    required this.fields,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final List<FormInputSection> sections;
  // ignore: strict_raw_type
  final List<FormInputFieldInfo?> fields;

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
    // logger.i('$className: building.');
    // logger.i('$className: fields: ${widget.fields.length}.');
    return FormBuilder(
      key: widget.formKey,
      skipDisabled: true,
      child: VStack(
        spacing: 25,
        children: widget.sections.map(generateSection).toList(),
      ),
    );
  }

  Widget generateSection(
    FormInputSection section,
  ) {
    // logger.d('widget.fields: ${widget.fields}');
    final sectionFields =
        widget.fields.where((f) => f?.sectionName == section.name);
    final fields = sectionFields.map(generateField).toList();

    // logger.i(
    //     '$className: generateSection ${section.key}: fields: ${fields.length}.',
    //     );

    final child = XStack(
      axisDirection: section.direction,
      mainAxisAlignment: section.direction == x_stack.AxisDirection.horizontal
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.center,
      spacing: section.direction == x_stack.AxisDirection.horizontal ? 0 : 10,
      spacingPosition: section.direction == x_stack.AxisDirection.horizontal
          ? SpacingPosition.none
          : SpacingPosition.beforeAndBetween,
      children: [
        ...fields,
      ],
    );

    if (section.showBorder) {
      return BorderWithHeader(title: section.name, child: child);
    } else {
      // ignore: use_colored_box
      return Row(
        children: [
          Expanded(
            child: child,
          ),
        ],
      );
    }
  }

  Widget generateField(
    FormInputFieldInfo? field,
  ) {
    // logger.i('$className: generateField ${field.label}.');
    if (field == null) {
      return const CircularProgressIndicator();
    }

    final response = switch (field) {
      FormInputFieldInfoTextArea() => FormInputFieldTextArea(field: field),
      FormInputFieldInfoDropDown() => FormInputFieldDropDown(field: field),
      FormInputFieldInfoCheckbox() => FormInputFieldCheckbox(field: field),
      FormInputFieldInfoImagePicker() =>
        FormInputFieldImagePicker(field: field),
      FormInputFieldInfoCancelButton() =>
        FormInputFieldCancelButton(formKey: widget.formKey, field: field),
      FormInputFieldInfoSubmitButton() =>
        FormInputFieldSubmitButton(formKey: widget.formKey, field: field),
      FormInputFieldInfoTwoAutoCompleteFields() =>
        FormInputFieldTwoAutoCompleteFields(
          field: field,
        ),
      FormInputFieldInfoCustomButton() =>
        FormInputFieldCustomButton(formKey: widget.formKey, field: field),
      FormInputFieldInfoDate() => FormInputFieldDate(field: field),
    };
    return response;
  }
}
