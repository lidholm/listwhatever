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

  // Widget uploadedImage(FormFieldState<String> field) {
  //   return FutureBuilder(
  //     future: getFirebaseStorage(),
  //     builder: (context, snapshot) {
  //       final firebaseStorage = snapshot.data;
  //       if (firebaseStorage == null) {
  //         return Container();
  //       }
  //       final imageFilename = getImageFilename(field);
  //       // logger.i('$className => imageFilename: $imageFilename');
  //       final imageUrlFuture = firebaseStorage
  //           .ref()
  //           .child('images')
  //           .child(imageFilename)
  //           .getDownloadURL();
  //       return FutureBuilder(
  //         future: imageUrlFuture,
  //         builder: (context, snapshot) {
  //           final imageUrl = snapshot.data;
  //           // logger.i('$className => imageUrl: $imageUrl');
  //           return SizedBox(
  //             width: imageSize,
  //             height: imageSize,
  //             child: ClipRRect(
  //               borderRadius: BorderRadius.circular(8),
  //               child: imageUrl != null
  //                   ? Image.network(imageUrl, fit: BoxFit.cover)
  //                   : Container(),
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }

  // String getImageFilename(FormFieldState<String> field) {
  //   return field.value ?? widget.field.currentValue ?? 'generic.jpg';
  // }

  // Future<UploadTask> uploadImage(
  //   XFile pickedFile,
  //   FormFieldState<String> field,
  // ) async {
  //   final storage = await getFirebaseStorage();
  //   try {
  //     // Create a unique file name for the upload
  //     final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';

  //     // Create a reference to the location you want to upload to in Firebase Storage
  //     final ref = storage.ref().child('images').child('/$fileName');

  //     final metadata = SettableMetadata(
  //       contentType: 'image/jpeg',
  //       customMetadata: {'picked-file-path': pickedFile.path},
  //     );

  //     UploadTask uploadTask;
  //     if (kIsWeb) {
  //       final bytes = await pickedFile.readAsBytes();
  //       uploadTask = ref.putData(bytes, metadata);
  //     } else {
  //       uploadTask = ref.putFile(File(pickedFile.path), metadata);
  //     }

  //     uploadTask.snapshotEvents.listen((event) {}).onData((data) {
  //       // logger.i('$className => ${data.bytesTransferred} - ${data.totalBytes}');

  //       if (data.bytesTransferred >= data.totalBytes) {
  //         // logger.i('$className => upload is done!');
  //         // logger.i('$className => fileName: $fileName');
  //         setState(() {
  //           field.didChange(fileName);
  //         });
  //       }
  //     });

  //     return Future.value(uploadTask);
  //   } on FirebaseException catch (e) {
  //     logger.e(e);
  //     rethrow;
  //   } on Exception catch (e) {
  //     logger.e(e);
  //     rethrow;
  //   }
  // }
}
