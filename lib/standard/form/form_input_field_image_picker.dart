import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listwhatever/custom/pages/lists/addList/upload_task_tile.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/firebase/firestore/firebase_storage.dart';
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

  UploadTask? _uploadTask;
  // String? _selectedImageFilename;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: widget.field.id,
      // validator: FormBuilderValidators.compose(widget.field.validators),
      builder: (FormFieldState<String> field) {
        logger.i('field: $field');
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            uploadedImage(field),
            Row(
              children: [
                // if (_uploadTask == null)
                //   const Center(
                //       child: Text("Press the '+' button to add a new file."))
                // else
                //   uploadedStatus(),
                uploadButton(field),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget uploadedImage(FormFieldState<String> field) {
    return FutureBuilder(
      future: getFirebaseStorage(),
      builder: (context, snapshot) {
        final firebaseStorage = snapshot.data;
        if (firebaseStorage == null) {
          return Container();
        }
        final imageFilename = getImageFilename(field);
        logger.i('$className => imageFilename: $imageFilename');
        final imageUrlFuture = firebaseStorage
            .ref()
            .child('images')
            .child(imageFilename)
            .getDownloadURL();
        return FutureBuilder(
          future: imageUrlFuture,
          builder: (context, snapshot) {
            final imageUrl = snapshot.data;
            logger.i('$className => imageUrl: $imageUrl');
            return SizedBox(
              width: imageSize,
              height: imageSize,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: imageUrl != null
                    ? Image.network(imageUrl, fit: BoxFit.cover)
                    : Container(),
              ),
            );
          },
        );
      },
    );
  }

  String getImageFilename(FormFieldState<String> field) {
    return field.value ?? widget.field.currentValue ?? 'generic.jpg';
  }

  Widget uploadedStatus() {
    return Expanded(
      child: UploadTaskListTile(
        task: _uploadTask!,
        onDismissed: () {}, // => _removeTaskAtIndex(index),
        onDownloadLink: () async {
          // return _downloadLink(_uploadTasks[index].snapshot.ref);
        },
        onDownload: () async {
          // if (kIsWeb) {
          //   return _downloadBytes(_uploadTasks[index].snapshot.ref);
          // } else {
          //   return _downloadFile(_uploadTasks[index].snapshot.ref);
          // }
        },
        onDelete: () async {
          // return _delete(_uploadTasks[index].snapshot.ref);
        },
      ),
    );
  }

  Widget uploadButton(FormFieldState<String> field) {
    return ElevatedButton(
      onPressed: () async {
        final picker = ImagePicker();
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);

        if (pickedFile != null) {
          final tmp = await uploadImage(pickedFile, field);
          setState(() {
            logger.i('$className => pickedFile.path: ${pickedFile.path}');
            _uploadTask = tmp;
            logger.i('$className => _uploadTask: $_uploadTask');
          });
        } else {
          logger.i('$className => No image selected.');
        }
      },
      child: const Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Text('Upload image'),
      ),
    );
  }

  Future<UploadTask> uploadImage(
    XFile pickedFile,
    FormFieldState<String> field,
  ) async {
    final storage = await getFirebaseStorage();
    try {
      // Create a unique file name for the upload
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.png';

      // Create a reference to the location you want to upload to in Firebase Storage
      final ref = storage.ref().child('images').child('/$fileName');

      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': pickedFile.path},
      );

      UploadTask uploadTask;
      if (kIsWeb) {
        final bytes = await pickedFile.readAsBytes();
        uploadTask = ref.putData(bytes, metadata);
      } else {
        uploadTask = ref.putFile(File(pickedFile.path), metadata);
      }

      uploadTask.snapshotEvents.listen((event) {}).onData((data) {
        logger.i('$className => ${data.bytesTransferred} - ${data.totalBytes}');

        if (data.bytesTransferred >= data.totalBytes) {
          logger.i('$className => upload is done!');
          logger.i('$className => fileName: $fileName');
          setState(() {
            field.didChange(fileName);
            // _selectedImageFilename = fileName;
          });
          // logger.i(
          //   '$className => _selectedImageFilename: $_selectedImageFilename',
          // );
        }
      });

      return Future.value(uploadTask);
    } on FirebaseException catch (e) {
      logger.e(e);
      rethrow;
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
