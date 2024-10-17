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

class FormInputFieldImagePicker extends StatefulWidget {
  const FormInputFieldImagePicker({required this.field, super.key});

  final FormInputFieldInfoImagePicker field;

  @override
  State<FormInputFieldImagePicker> createState() =>
      _FormInputFieldImagePickerState();
}

class _FormInputFieldImagePickerState extends State<FormInputFieldImagePicker> {
  final String className = 'FormInputFieldImagePicker';

  @override
  void initState() {
    super.initState();
    if (widget.field.currentValue != null) {
      BlocProvider.of<FirebaseStorageBloc>(context)
          .add(FirebaseStorageEvent.loadFiles([widget.field.currentValue!]));
    }
  }

  @override
  Widget build(BuildContext context) {
    final firebaseStorageState = context.watch<FirebaseStorageBloc>().state;
    logger.i('$className: firebaseStorageState: $firebaseStorageState');

    return switch (firebaseStorageState) {
      Initial() => showImagePicker(null),
      Loading() => const CircularProgressIndicator(),
      FilesLoaded(:final imageUrls) => showImagePickerForList(imageUrls),
    };
  }

  Widget showImagePickerForList(List<String?> imageUrls) {
    logger.i('$className: imageUrls: $imageUrls');

    if (imageUrls.isEmpty || imageUrls.first == null) {
      return const CircularProgressIndicator();
    }
    return showImagePicker(imageUrls.first);
  }

  Widget showImagePicker(String? imageUrl) {
    final initialValue = imageUrl == null ? null : [imageUrl];
    logger.i('$className: initialValue: $initialValue');
    return FormBuilderImagePicker(
      key: Key(widget.field.id),
      name: widget.field.id,
      displayCustomType: (obj) => obj is ApiImage ? obj.imageUrl : obj,
      decoration: const InputDecoration(
        labelText: 'Pick list image',
      ),
      maxImages: 1,
      initialValue: initialValue,
    );
  }
}
