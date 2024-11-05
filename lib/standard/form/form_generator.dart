import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

// ignore: unused_import
import 'package:listwhatever/standard/constants.dart';

import 'package:listwhatever/standard/form/form_input_field_cancel_button.dart';
import 'package:listwhatever/standard/form/form_input_field_checkbox.dart';
import 'package:listwhatever/standard/form/form_input_field_chips.dart';
import 'package:listwhatever/standard/form/form_input_field_custom_button.dart';
import 'package:listwhatever/standard/form/form_input_field_date.dart';
import 'package:listwhatever/standard/form/form_input_field_double_slider.dart';
import 'package:listwhatever/standard/form/form_input_field_drop_down.dart';
import 'package:listwhatever/standard/form/form_input_field_image_picker.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_field_map.dart';
import 'package:listwhatever/standard/form/form_input_field_shimmer.dart';
import 'package:listwhatever/standard/form/form_input_field_single_slider.dart';
import 'package:listwhatever/standard/form/form_input_field_submit_button.dart';
import 'package:listwhatever/standard/form/form_input_field_text_area.dart';
import 'package:listwhatever/standard/form/form_input_field_two_auto_complete_fields.dart';
import 'package:listwhatever/standard/form/form_input_section.dart';
import 'package:listwhatever/standard/widgets/border_with_header.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer.dart';
import 'package:listwhatever/standard/widgets/shimmer/shimmer_loading.dart';
import 'package:listwhatever/standard/widgets/vStack/v_stack.dart';
import 'package:listwhatever/standard/widgets/vStack/x_stack.dart';

import '/standard/widgets/vStack/x_stack.dart' as x_stack;

const String className = 'FormGenerator';

class FormGenerator extends StatefulWidget {
  const FormGenerator({
    required this.formKey,
    required this.sections,
    required this.fields,
    required this.isLoading,
    this.focusFieldName,
    this.changeCallback,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final List<FormInputSection> sections;
  // ignore: strict_raw_type
  final List<FormInputFieldInfo?> fields;
  final String? focusFieldName;
  final void Function(Map<String, dynamic> values)? changeCallback;
  final bool isLoading;

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
    // LoggerHelper.logger.i('$className: building.');
    // LoggerHelper.logger.i('$className: fields: ${widget.fields.length}.');

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Shimmer(
          linearGradient: shimmerGradient,
          child: ShimmerLoading(
            isLoading: widget.isLoading,
            child: FormBuilder(
              key: widget.formKey,
              // IMPORTANT to remove all references from dynamic field when delete
              clearValueOnUnregister: true,
              skipDisabled: true,

              onChanged: () {
                if (widget.changeCallback != null) {
                  final fields = widget.formKey.currentState?.fields;
                  final mapEntriesValues = fields?.entries
                      .map((e) => MapEntry(e.key, e.value.value));

                  final values = (mapEntriesValues != null)
                      ? Map.fromEntries(mapEntriesValues)
                      : <String, dynamic>{};
                  widget.changeCallback?.call(values);
                }
              },
              child: VStack(
                spacing: 25,
                children: widget.isLoading
                    ? _buildShimmerItems()
                    : widget.sections.map(generateSection).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget generateSection(FormInputSection section) {
    // LoggerHelper.logger.d('widget.fields: ${widget.fields}');
    final sectionFields =
        widget.fields.where((f) => f?.sectionName == section.name);
    final actualFields = sectionFields.map(generateField).toList();

    // LoggerHelper.logger.i(
    //     '$className: generateSection ${section.key}: fields: ${fields.length}.',
    //     );

    final child = XStack(
      axisDirection: section.direction,
      mainAxisAlignment: section.direction == x_stack.AxisDirection.horizontal
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.center,
      spacing: section.direction == x_stack.AxisDirection.horizontal ? 10 : 10,
      spacingPosition: section.direction == x_stack.AxisDirection.horizontal
          ? SpacingPosition.beforeAndBetweenAndAfter
          : SpacingPosition.beforeAndBetween,
      children: [
        ...actualFields,
      ],
    );

    if (section.showBorder) {
      return BorderWithHeader(title: section.name, child: child);
    } else {
      // ignore: use_colored_box
      return child;
    }
  }

  Widget generateField(
    FormInputFieldInfo? field,
  ) {
    // LoggerHelper.logger.i('$className: generateField ${field.label}.');
    if (field == null) {
      return const CircularProgressIndicator();
    }

    final response = switch (field) {
      FormInputFieldInfoTextArea() => FormInputFieldTextArea(field: field),
      FormInputFieldInfoDropDown() => FormInputFieldDropDown(field: field),
      FormInputFieldInfoCheckbox() => FormInputFieldCheckbox(field: field),
      FormInputFieldInfoImagePicker() =>
        FormInputFieldImagePicker(field: field),
      FormInputFieldInfoCancelButton() => FormInputFieldCancelButton(
          formKey: widget.formKey,
          field: field,
        ),
      FormInputFieldInfoSubmitButton() =>
        FormInputFieldSubmitButton(formKey: widget.formKey, field: field),
      FormInputFieldInfoTwoAutoCompleteFields() =>
        FormInputFieldTwoAutoCompleteFields(
          field: field,
        ),
      FormInputFieldInfoCustomButton() =>
        FormInputFieldCustomButton(formKey: widget.formKey, field: field),
      FormInputFieldInfoDate() => FormInputFieldDate(field: field),
      FormInputFieldInfoMap() => FormInputFieldMap(field: field),
      FormInputFieldInfoSlider() => field.rangeSlider
          ? FormInputFieldDoubleSlider(field: field)
          : FormInputFieldSingleSlider(field: field),
      FormInputFieldInfoChips() => FormInputFieldChips(field: field),
      FormInputFieldInfoShimmer() => FormInputFieldShimmer(field: field),
    };
    return response;
  }

  List<Widget> _buildShimmerItems() {
    return List.generate(
      widget.fields.length,
      (i) => Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
