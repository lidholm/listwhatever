import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:listwhatever/custom/pages/lists/addList/upload_task_tile.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_event.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_state.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/standard/appUi/theme/app_theme.dart';
import 'package:listwhatever/standard/firebase/firestore/firebase_storage.dart';

import '/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import '/standard/constants.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/v_stack.dart';
import '../list_load_events/list_load_bloc.dart';
import '../list_load_events/list_load_event.dart';
import '../list_load_events/list_load_state.dart';
import '../models/list_type.dart';

const imageSize = 80.0;

enum AddListValues {
  id,
  name,
  type,
  withMap,
  withDates,
  withTimes,
  ownerId,
  // share
}

class AddListPage extends StatefulWidget {
  const AddListPage({super.key, this.listId});
  final String? listId;

  @override
  State<AddListPage> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;
  bool _typeHasError = false;

  final _typeOptions = ListType.values;
  late Map<String, dynamic> initialValue;
  ListOfThings? list;
  ListType? selectedListType;
  String? _selectedImageFilename;

  UploadTask? _uploadTask;

  void _onChanged(dynamic val) => logger.d(val.toString());

  @override
  void initState() {
    if (widget.listId != null) {
      BlocProvider.of<ListLoadBloc>(context).add(LoadList(widget.listId!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.listId != null) {
      final listState = context.watch<ListLoadBloc>().state;

      final listStateView = ListOrListItemNotLoadedHandler.handleListState(listState);
      if (listStateView != null) {
        return listStateView;
      }
      list = (listState as ListLoadLoaded).list;
    }

    initialValue = {
      AddListValues.id.toString(): list?.id,
      AddListValues.name.toString(): list?.name,
      AddListValues.type.toString(): list?.listType ?? ListType.other,
      AddListValues.withMap.toString(): list?.withMap ?? false,
      AddListValues.withDates.toString(): list?.withDates ?? false,
      AddListValues.withTimes.toString(): list?.withTimes ?? false,
      AddListValues.ownerId.toString(): list?.ownerId,
      // AddListValues.share.toString(): list?.shared ?? false,
    };
    return BlocListener<ListCrudBloc, ListCrudState>(
      listener: (context, state) {
        logger.i('$this => state: $state');
        if (state is ListCrudAdded) {
          GoRouter.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: const CommonAppBar(title: 'Add list'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
                // logger.d(_formKey.currentState!.value.toString());
              },
              autovalidateMode: AutovalidateMode.disabled,
              initialValue: initialValue,
              skipDisabled: true,
              child: VStack(
                children: <Widget>[
                  const SizedBox(height: 15),
                  getListNameField(),
                  getListTypeField(),
                  getWithMapCheckbox(),
                  getWithDatesCheckbox(),
                  getWithTimesCheckbox(),
                  Row(
                    children: <Widget>[
                      getCancelButton(),
                      const SizedBox(width: 20),
                      getSubmitButton(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  FormBuilderTextField getListNameField() {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: AddListValues.name.toString(),
      decoration: InputDecoration(
        labelText: 'List name',
        suffixIcon:
            _nameHasError ? const Icon(Icons.error, color: Colors.red) : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        setState(() {
          _nameHasError = !(_formKey.currentState?.fields[AddListValues.name.toString()]?.validate() ?? false);
        });
      },
      // valueTransformer: (text) => num.tryParse(text),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.max(70),
      ]),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  Widget getListTypeField() {
    return Row(
      children: [
        Expanded(
          child: FormBuilderDropdown<ListType>(
            name: AddListValues.type.toString(),
            decoration: InputDecoration(
              labelText: 'Type',
              suffix: _typeHasError ? const Icon(Icons.error) : const Icon(Icons.check),
              hintText: 'Select Type',
            ),
            validator: FormBuilderValidators.compose(
              [FormBuilderValidators.required()],
            ),
            items: _typeOptions
                .map(
                  (type) => DropdownMenuItem(
                    alignment: AlignmentDirectional.center,
                    value: type,
                    child: Text(type.readable()),
                  ),
                )
                .toList(),
            onChanged: (val) {
              setState(() {
                _typeHasError = !(_formKey.currentState?.fields[AddListValues.type.toString()]?.validate() ?? false);
                selectedListType = val;
              });
            },
            valueTransformer: (val) => val?.toString(),
          ),
        ),
        const SizedBox(width: 16),
        FutureBuilder(
          future: getFirebaseStorage(),
          builder: (context, snapshot) {
            final firebaseStorage = snapshot.data;
            if (firebaseStorage == null) {
              return Container();
            }
            final imageFilename = getImageFilename();
            logger.i('$this => imageFilename: $imageFilename');
            final imageUrlFuture = firebaseStorage.ref().child('images').child(imageFilename).getDownloadURL();
            return FutureBuilder(
              future: imageUrlFuture,
              builder: (context, snapshot) {
                final imageUrl = snapshot.data;
                logger.i('$this => imageUrl: $imageUrl');
                return SizedBox(
                  width: imageSize,
                  height: imageSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: imageUrl != null ? Image.network(imageUrl, fit: BoxFit.cover) : Container(),
                  ),
                );
              },
            );
          },
        ),
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
            final pickedFile = await picker.pickImage(source: ImageSource.gallery);

            if (pickedFile != null) {
              final tmp = await uploadImage(pickedFile);
              setState(() {
                logger.i('$this => pickedFile.path: ${pickedFile.path}');
                _uploadTask = tmp;
                logger.i('$this => _uploadTask: $_uploadTask');
              });
            } else {
              logger.i('$this => No image selected.');
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

  String getImageFilename() {
    return _selectedImageFilename ??
        ((selectedListType != null && selectedListType != ListType.other)
            ? selectedListType!.getImagePath()
            : 'generic.jpg');
  }

  Widget getWithMapCheckbox() {
    return AppTheme.getCheckbox(AddListValues.withMap.toString(), 'With Map', _onChanged);
  }

  Widget getWithDatesCheckbox() {
    return AppTheme.getCheckbox(AddListValues.withDates.toString(), 'With Dates', _onChanged);
  }

  Widget getWithTimesCheckbox() {
    return AppTheme.getCheckbox(AddListValues.withTimes.toString(), 'With Times', _onChanged);
  }

  Widget getCancelButton() {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          _formKey.currentState?.reset();
        },
        // color: Theme.of(context).colorScheme.secondary,
        child: Text(
          'Reset',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }

  Widget getSubmitButton() {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            // logger.d(_formKey.currentState?.value.toString());
            save(_formKey.currentState);
          } else {
            logger
              ..d(_formKey.currentState?.value.toString())
              ..d('validation failed');
          }
        },
        child: const Text(
          'Save',
        ),
      ),
    );
  }

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
      logger
        ..i('fullPath: ${uploadTask.snapshot.ref.fullPath}')
        ..i(uploadTask.snapshot.state)
        ..i(uploadTask.snapshot.bytesTransferred)
        ..i(uploadTask.snapshot.metadata)
        ..i(uploadTask.snapshot.totalBytes)
        ..i(uploadTask.snapshot.ref);

      uploadTask.snapshotEvents.listen((event) {}).onData((data) {
        logger.i('$this => ${data.bytesTransferred} - ${data.totalBytes}');

        if (data.bytesTransferred >= data.totalBytes) {
          logger.i('$this => upload is done!');
          setState(() {
            _selectedImageFilename = fileName;
          });
          logger.i('$this => _selectedImageFilename: $_selectedImageFilename');
        }
      });

      return Future.value(uploadTask);
    } on FirebaseException catch (e) {
      logger.i(e);
      rethrow;
    } on Exception catch (e) {
      logger.i(e);
      rethrow;
    }
  }

  void save(FormBuilderState? currentState) {
    final values = <String, dynamic>{};
    for (final entry in currentState!.fields.entries) {
      values[entry.key] = entry.value.value;
    }
    final listType = values[AddListValues.type.toString()] as ListType;
    // logger.d('values: $values');
    final list = ListOfThings(
      id: initialValue[AddListValues.id.toString()] as String?,
      name: values[AddListValues.name.toString()]! as String,
      listType: listType,
      imageFilename: getImageFilename(),
      withMap: values[AddListValues.withMap.toString()] as bool,
      withDates: values[AddListValues.withDates.toString()] as bool,
      withTimes: values[AddListValues.withTimes.toString()] as bool,
      shared: false, //values[AddListValues.share.toString()] as bool,
      shareCodeForViewer: null,
      shareCodeForEditor: null,
      sharedWith: {},
      ownerId: initialValue[AddListValues.ownerId.toString()] as String?,
    );
    if (widget.listId == null) {
      BlocProvider.of<ListCrudBloc>(context).add(AddList(list));
    } else {
      BlocProvider.of<ListCrudBloc>(context).add(UpdateList(list));
    }
    GoRouter.of(context).pop();
  }
}
