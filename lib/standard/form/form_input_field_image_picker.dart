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
    final firebaseStorage = context.watch(getFirebaseStorage());

// Create a Bloc for reading images from Firebase storage.
// One LoadImage event, and a ImageLoaded status
// And then listen to that

    return FutureBuilder(
      future: getFirebaseStorage(),
      builder: (context, snapshot) {
        final firebaseStorage = snapshot.data;
        if (firebaseStorage == null) {
          return Container();
        }
        final imageUrlFuture = firebaseStorage
            .ref()
            .child('images')
            .child(widget.field.currentValue ?? defaultImageFilename)
            .getDownloadURL();

        return FutureBuilder(
            future: imageUrlFuture,
            builder: (context, imageSnapshot) {
              final imageUrl = imageSnapshot.data;
              logger.i('$className: imageUrl: $imageUrl');
              final initialValue =
                  // imageUrl != null
                  //     ?
                  [
                //         imageUrl
                'https://images.pexels.com/photos/7078045/pexels-photo-7078045.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
              ]
                  // : <String>[]
                  ;
              logger.i('$className: initialValue: $initialValue');

              return FormBuilderImagePicker(
                name: 'singlePhotoWithDecoration',
                displayCustomType: (obj) =>
                    obj is ApiImage ? obj.imageUrl : obj,
                decoration: const InputDecoration(
                  labelText: 'Pick Single Photo With Decoration Visible',
                ),
                showDecoration: true,
                maxImages: 1,
                previewAutoSizeWidth: true,
                initialValue: initialValue,
              );
            });
      },
    );
  }
}
