import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listwhatever/custom/pages/lists/addList/upload_task_tile.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/firebase/firestore/firebase_storage.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

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
  String? _selectedImageFilename;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 16),
        if (_uploadTask == null)
          const Center(child: Text("Press the '+' button to add a new file."))
        else
          Expanded(
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
          ),
        ElevatedButton(
          onPressed: () async {
            final picker = ImagePicker();
            final pickedFile =
                await picker.pickImage(source: ImageSource.gallery);

            if (pickedFile != null) {
              final tmp = await uploadImage(pickedFile);
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
        ),
      ],
    );
  }

  // FutureBuilder(
  //   future: getFirebaseStorage(),
  //   builder: (context, snapshot) {
  //     final firebaseStorage = snapshot.data;
  //     if (firebaseStorage == null) {
  //       return Container();
  //     }
  //     final imageFilename = getImageFilename();
  //     logger.i('$className => imageFilename: $imageFilename');
  //     final imageUrlFuture = firebaseStorage
  //         .ref()
  //         .child('images')
  //         .child(imageFilename)
  //         .getDownloadURL();
  //     return FutureBuilder(
  //       future: imageUrlFuture,
  //       builder: (context, snapshot) {
  //         final imageUrl = snapshot.data;
  //         logger.i('$className => imageUrl: $imageUrl');
  //         return SizedBox(
  //           width: imageSize,
  //           height: imageSize,
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(8),
  //             child: imageUrl != null
  //                 ? Image.network(imageUrl, fit: BoxFit.cover)
  //                 : Container(),
  //           ),
  //         );
  //       },
  //     );
  //   },
  // ),
  //
  // String getImageFilename() {
  //   return _selectedImageFilename ??
  //       ((selectedListType != null && selectedListType != ListType.other)
  //           ? selectedListType!.getImagePath()
  //           : 'generic.jpg');
  // }

  Future<UploadTask> uploadImage(XFile pickedFile) async {
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
      // logger
      //   ..i('fullPath: ${uploadTask.snapshot.ref.fullPath}')
      //   ..i(uploadTask.snapshot.state)
      //   ..i(uploadTask.snapshot.bytesTransferred)
      //   ..i(uploadTask.snapshot.metadata)
      //   ..i(uploadTask.snapshot.totalBytes)
      //   ..i(uploadTask.snapshot.ref);

      uploadTask.snapshotEvents.listen((event) {}).onData((data) {
        logger.i('$className => ${data.bytesTransferred} - ${data.totalBytes}');

        if (data.bytesTransferred >= data.totalBytes) {
          logger.i('$className => upload is done!');
          setState(() {
            _selectedImageFilename = fileName;
          });
          logger.i(
            '$className => _selectedImageFilename: $_selectedImageFilename',
          );
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
