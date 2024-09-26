import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/firebase/firebaseStorageBloc/bloc/firebase_storage_bloc.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

const imageSize = 80.0;
const String className = 'FormInputFieldImagePicker';

class ApiImage {
  ApiImage({
    required this.imageUrl,
    required this.id,
  });

  final String imageUrl;
  final String id;
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
  void initState() {
    super.initState();
    if (widget.field.currentValue != null) {
      BlocProvider.of<FirebaseStorageBloc>(context)
          .add(FirebaseStorageEvent.loadFile(widget.field.currentValue!));
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseStorageState = context.watch<FirebaseStorageBloc>().state;

    return switch (firebaseStorageState) {
      Initial() => showImagePicker(null),
      Loading() => const CircularProgressIndicator(),
      FileLoaded(:final imageUrl) => showImagePicker(imageUrl),
    };
  }

  Widget showImagePicker(String? imageUrl) {
    final initialValue = imageUrl == null ? null : [imageUrl];
    return FormBuilderImagePicker(
      name: widget.field.id,
      displayCustomType: (obj) => obj is ApiImage ? obj.imageUrl : obj,
      decoration: const InputDecoration(
        labelText: 'Pick list image',
      ),
      showDecoration: true,
      maxImages: 1,
      previewAutoSizeWidth: true,
      initialValue: initialValue,
    );
  }
}
