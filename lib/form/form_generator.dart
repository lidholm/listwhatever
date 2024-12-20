import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/components/border_with_header.dart';
import 'package:listwhatever/components/shimmer/shimmer.dart';
import 'package:listwhatever/components/shimmer/shimmer_loading.dart';
import 'package:listwhatever/form/form_axis_direction.dart';
import 'package:listwhatever/form/form_input_field_cancel_button.dart';
import 'package:listwhatever/form/form_input_field_checkbox.dart';
import 'package:listwhatever/form/form_input_field_chips.dart';
import 'package:listwhatever/form/form_input_field_custom_button.dart';
import 'package:listwhatever/form/form_input_field_date.dart';
import 'package:listwhatever/form/form_input_field_double_slider.dart';
import 'package:listwhatever/form/form_input_field_drop_down.dart';
import 'package:listwhatever/form/form_input_field_info.dart';
import 'package:listwhatever/form/form_input_field_shimmer.dart';
import 'package:listwhatever/form/form_input_field_single_slider.dart';
import 'package:listwhatever/form/form_input_field_submit_button.dart';
import 'package:listwhatever/form/form_input_field_text_area.dart';
import 'package:listwhatever/form/form_input_field_two_auto_complete_fields.dart';
import 'package:listwhatever/form/form_input_section.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Shimmer(
          linearGradient: shimmerGradient,
          child: FormBuilder(
            key: widget.formKey,
            // IMPORTANT to remove all references from dynamic field when delete
            clearValueOnUnregister: true,
            skipDisabled: true,

            onChanged: () {
              if (widget.changeCallback != null) {
                final fields = widget.formKey.currentState?.fields;
                final mapEntriesValues =
                    fields?.entries.map((e) => MapEntry(e.key, e.value.value));

                final values = (mapEntriesValues != null)
                    ? Map.fromEntries(mapEntriesValues)
                    : <String, dynamic>{};
                widget.changeCallback?.call(values);
              }
            },
            child: Column(
              spacing: 25,
              children: widget.sections.map(generateSection).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget generateSection(FormInputSection section) {
    final sectionFields =
        widget.fields.where((f) => f?.sectionName == section.name);
    final actualFields = sectionFields.map(generateField).toList();

    final child = (section.direction == FormAxisDirection.horizontal)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            spacing: 10,
            children: actualFields,
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: actualFields,
          );

    if (section.showBorder) {
      return BorderWithHeader(title: section.name, child: child);
    } else {
      return child;
    }
  }

  Widget generateField(FormInputFieldInfo? field) {
    if (field == null) {
      return const CircularProgressIndicator();
    }

    final response = switch (field) {
      FormInputFieldInfoTextArea() => FormInputFieldTextArea(field: field),
      FormInputFieldInfoDropDown() => FormInputFieldDropDown(field: field),
      FormInputFieldInfoCheckbox() => FormInputFieldCheckbox(field: field),
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
      FormInputFieldInfoSlider() => field.rangeSlider
          ? FormInputFieldDoubleSlider(field: field)
          : FormInputFieldSingleSlider(field: field),
      FormInputFieldInfoChips() => FormInputFieldChips(field: field),
      FormInputFieldInfoShimmer() => FormInputFieldShimmer(field: field),
    };
    return response;
  }
}
