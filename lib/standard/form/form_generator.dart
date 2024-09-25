import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/form/form_input_field_cancel_button.dart';
import 'package:listwhatever/standard/form/form_input_field_checkbox.dart';
import 'package:listwhatever/standard/form/form_input_field_drop_down.dart';
import 'package:listwhatever/standard/form/form_input_field_image_picker.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_field_submit_button.dart';
import 'package:listwhatever/standard/form/form_input_field_text_area.dart';
import 'package:listwhatever/standard/widgets/border_with_header.dart';
import 'package:listwhatever/standard/widgets/vStack/v_stack.dart';

enum SectionDirection {
  horizontal,
  vertical,
}

class FormGenerator extends StatefulWidget {
  const FormGenerator({
    required this.formKey,
    required this.sections,
    required this.fields,
    super.key,
  });

  final GlobalKey<FormBuilderState> formKey;
  final Map<String, SectionDirection> sections;
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
        children: widget.sections.entries.map(generateSection).toList(),
      ),
    );
  }

  Widget generateSection(
    MapEntry<String, SectionDirection> section,
  ) {
    final sectionFields =
        formInputFields.where((f) => f.sectionName == section.key);
    final fields = sectionFields.map(generateField).toList();

    final child = section.value == SectionDirection.horizontal
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...fields,
            ],
          )
        : Column(
            children: [
              SizedBox(
                height: 10,
              ),
              ...fields,
            ],
          );
    return BorderWithHeader(title: section.key, child: child);
  }

  Widget generateField<T>(
    FormInputFieldInfo<T> field,
  ) {
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
