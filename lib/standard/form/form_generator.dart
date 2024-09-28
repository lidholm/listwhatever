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

  Widget generateField<T, S>(
    FormInputFieldInfo<T, S>? field,
  ) {
    // logger.i('$className: generateField ${field.label}.');
    if (field == null) {
      return const CircularProgressIndicator();
    }

    final response = switch (field) {
      FormInputFieldInfoTextArea() =>
        FormInputFieldTextArea<T, S>(field: field),
      FormInputFieldInfoDropDown() =>
        FormInputFieldDropDown<T, S>(field: field),
      FormInputFieldInfoCheckbox<T, S>() =>
        FormInputFieldCheckbox<T, S>(field: field),
      FormInputFieldInfoImagePicker<T, S>() =>
        FormInputFieldImagePicker<T, S>(field: field),
      FormInputFieldInfoCancelButton<T, S>() =>
        FormInputFieldCancelButton<T, S>(formKey: widget.formKey, field: field),
      FormInputFieldInfoSubmitButton<T, S>() =>
        FormInputFieldSubmitButton<T, S>(formKey: widget.formKey, field: field),
      FormInputFieldInfoTwoFreeTextDropdown<T, S>() =>
        const Text('TwoFreeTextDropdown'),
      FormInputFieldInfoCustomButton<T, S>() =>
        FormInputFieldCustomButton<T, S>(formKey: widget.formKey, field: field),
      FormInputFieldInfoDate<T, S>() => FormInputFieldDate<T, S>(field: field),
    };
    return response;
  }
}
