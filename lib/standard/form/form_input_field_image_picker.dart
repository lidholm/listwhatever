import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

const imageSize = 80.0;

class FormInputFieldImagePicker<T> extends StatefulWidget {
  const FormInputFieldImagePicker({required this.field, super.key});

  final FormInputFieldInfoImagePicker<T> field;

  @override
  State<FormInputFieldImagePicker<T>> createState() =>
      _FormInputFieldImagePickerState<T>();
}

class _FormInputFieldImagePickerState<T>
    extends State<FormInputFieldImagePicker<T>> {
  final String className = 'FormInputFieldImagePicker';

  @override
  Widget build(BuildContext context) {
    return FormBuilderImagePicker(
      name: widget.field.id,
      initialValue: [widget.field.currentValue],
      decoration: const InputDecoration(labelText: 'Pick Image'),
      maxImages: 1,
    );
  }
}
