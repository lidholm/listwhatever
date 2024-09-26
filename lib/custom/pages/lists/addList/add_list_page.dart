import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_event.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/firebase/firestore/firebase_storage.dart';
import 'package:listwhatever/standard/form/form_generator.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

import '/custom/pages/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/list_load_events/list_load_bloc.dart';
import '/custom/pages/lists/list_load_events/list_load_event.dart';
import '/custom/pages/lists/list_load_events/list_load_state.dart';
import '/custom/pages/lists/models/list_of_things.dart';
import '/custom/pages/lists/models/list_type.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/x_stack.dart' as x_stack;

const String className = 'AddListPage';

enum SectionName {
  basic._('Basic information'),
  options._('Options'),
  shared._('Share information'),
  submit._('Submit');

  const SectionName._(this.value);

  final String value;
}

enum FieldId {
  name._('name'),
  listType._('listType'),
  listTypeImage._('listTypeImage'),
  withMap._('withMap'),
  withDates._('withDates'),
  withTimes._('withTimes'),
  cancel._('cancel'),
  submit._('submit');

  const FieldId._(this.value);

  final String value;
}

class AddListPage extends StatefulWidget {
  const AddListPage({super.key, this.listId});
  final String? listId;

  @override
  State<AddListPage> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  // ignore: strict_raw_type
  late List<FormInputFieldInfo> fields;

  late ListOfThings? list;
  ListType? selectedListType;
  bool? showImage = false;
  bool imageUploaded = false;

  @override
  void initState() {
    if (widget.listId != null) {
      BlocProvider.of<ListLoadBloc>(context).add(LoadList(widget.listId!));
    }
    super.initState();
    list = null;
  }

  @override
  Widget build(BuildContext context) {
    logger.i('$className: list: $list');

    if (widget.listId != null) {
      final listState = context.watch<ListLoadBloc>().state;

      final listStateView =
          ListOrListItemNotLoadedHandler.handleListState(listState);
      if (listStateView != null) {
        return listStateView;
      }
      setState(() {
        list = (listState as ListLoadLoaded).list;
      });
    }

    fields = [
      FormInputFieldInfo.textArea(
        id: FieldId.name.value,
        label: 'Name',
        currentValue: list?.name ?? '',
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.basic.value,
        hasError: false,
      ),
      FormInputFieldInfo<ListType>.dropdown(
        id: FieldId.listType.value,
        label: 'List type',
        currentValue: list?.listType ?? ListType.generic,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        options: ListType.values,
        optionToString: (listType) => (listType as ListType).name,
        sectionName: SectionName.basic.value,
        hasError: false,
        onChange: (listType) => setState(() {
          logger.i('$className: onChange ListType: $listType');
          showImage = listType == ListType.other;
        }),
      ),
      if (showImage ?? list?.listType == ListType.other)
        FormInputFieldInfo<String>.imagePicker(
          id: FieldId.listTypeImage.value,
          label: 'Image',
          currentValue: null,
          validators: [
            FormBuilderValidators.required(),
            FormBuilderValidators.maxLength(70),
          ],
          sectionName: SectionName.basic.value,
          hasError: false,
        ),
      FormInputFieldInfo<bool>.checkbox(
        id: FieldId.withMap.value,
        label: 'Use a map',
        currentValue: list?.withMap ?? false,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.options.value,
        hasError: false,
      ),
      FormInputFieldInfo<bool>.checkbox(
        id: FieldId.withDates.value,
        label: 'Use dates',
        currentValue: list?.withDates ?? false,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.options.value,
        hasError: false,
      ),
      FormInputFieldInfo<bool>.checkbox(
        id: FieldId.withTimes.value,
        label: 'Use time',
        currentValue: list?.withTimes ?? false,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.options.value,
        hasError: false,
      ),
      FormInputFieldInfo<ListType>.cancelButton(
        id: FieldId.cancel.value,
        label: 'Cancel',
        sectionName: SectionName.submit.value,
        cancel: () {
          print('cancelled');
        },
      ),
      FormInputFieldInfo<ListType>.submitButton(
        id: FieldId.submit.value,
        label: 'Submit',
        sectionName: SectionName.submit.value,
        save: (Map<String, dynamic>? values) {
          print('save');
          if (values == null) {
            print('No values to save');
            return;
          }
          save(values);
        },
      ),
    ];

    final sections = {
      SectionName.basic.value: x_stack.AxisDirection.vertical,
      SectionName.options.value: x_stack.AxisDirection.vertical,
      SectionName.submit.value: x_stack.AxisDirection.horizontal,
    };

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: fields,
    );

    return Scaffold(
      appBar: const CommonAppBar(title: 'Add list'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: formGenerator,
        ),
      ),
    );
  }

  Future<void> save(Map<String, dynamic> values) async {
    final listCrudBloc = BlocProvider.of<ListCrudBloc>(context);
    final goRouter = GoRouter.of(context);

    final listTypeName = values[FieldId.listType.value] as String;
    final listType = ListType.values
        .where((l) => l.name == listTypeName.split('.').last)
        .first;

    String? imageFilename;
    if (values.containsKey(FieldId.listTypeImage.value)) {
      imageFilename =
          await uploadImage(values[FieldId.listTypeImage.value] as List);
      logger.i('$className: imageFilename: $imageFilename');
    }

    logger.d('values: $values');
    final newList = ListOfThings(
      id: widget.listId,
      name: values[FieldId.name.value]! as String,
      listType: listType,
      imageFilename: imageFilename,
      withMap: values[FieldId.withMap.value] as bool,
      withDates: values[FieldId.withDates.value] as bool,
      withTimes: values[FieldId.withTimes.value] as bool,
      shared: false, //values[AddListValues.share.toString()] as bool,
      // shareCodeForViewer: null,
      // shareCodeForEditor: null,
      sharedWith: {},
      ownerId: list?.ownerId, // initialValue[list] as String?,
    );
    if (widget.listId == null) {
      listCrudBloc.add(AddList(newList));
    } else {
      listCrudBloc.add(UpdateList(newList));
    }
    logger.i('$className -> popping once');
    goRouter.pop();
  }

  Future<String?> uploadImage(
    List<dynamic> images,
  ) async {
    if (images.isEmpty) {
      logger.w('No image');
    }
    final image = images[0] as XFile;
    final storage = await getFirebaseStorage();
    try {
      // Create a unique file name for the upload
      final fileName = '${getRandomString(6)}.png';

      // Create a reference to the location you want to upload to in Firebase Storage
      final ref = storage.ref().child('images').child('/$fileName');

      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': image.path},
      );

      UploadTask uploadTask;
      if (kIsWeb) {
        final bytes = await image.readAsBytes();
        uploadTask = ref.putData(bytes, metadata);
      } else {
        uploadTask = ref.putFile(File(image.path), metadata);
      }

      await uploadTask.whenComplete(() {
        // Check if the upload is completed
        if (uploadTask.snapshot.bytesTransferred ==
            uploadTask.snapshot.totalBytes) {
          imageUploaded = true;
        } else {
          imageUploaded = false;
        }
      });

      return imageUploaded ? fileName : null;
    } on FirebaseException catch (e) {
      logger.e(e);
      rethrow;
    } on Exception catch (e) {
      logger.e(e);
      rethrow;
    }
  }
}
