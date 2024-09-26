import 'package:flutter/material.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:listwhatever/custom/pages/lists/addList/add_list_page.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/firebase/firebase_storage.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

const imageSize = 80.0;

class ApiImage {
  final String imageUrl;
  final String id;

  ApiImage({
    required this.imageUrl,
    required this.id,
  });
}

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
    final initialValue = [
      'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260'
    ];
    logger.i('$className: initialValue: $initialValue');

    return FormBuilderImagePicker(
      name: 'singlePhotoWithDecoration',
      displayCustomType: (obj) => obj is ApiImage ? obj.imageUrl : obj,
      decoration: const InputDecoration(
        labelText: 'Pick Single Photo With Decoration Visible',
      ),
      showDecoration: true,
      maxImages: 1,
      previewAutoSizeWidth: true,
      initialValue: initialValue,
    );
  }
}
