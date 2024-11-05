import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/listItems/filters/categories_helper.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import 'package:listwhatever/custom/pages/listItems/models/list_item.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_crud_events/list_crud_event.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/firebase/firebase_storage.dart';
import 'package:listwhatever/standard/form/form_generator.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_section.dart';

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
  categoryFilterSettings._('Category filter settings'),
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
  categoryFilter._('categoryFilter'),
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
  List<FormInputFieldInfo?> fields = [];

  ListType? selectedListType;
  bool? showImage;
  bool imageUploaded = false;

  @override
  void initState() {
    if (widget.listId != null) {
      BlocProvider.of<ListLoadBloc>(context).add(LoadList(widget.listId!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // logger.i('$className: list: $list');

    ListOfThings? list;
    var listItems = <ListItem>[];
    var isLoading = false;

    if (widget.listId != null) {
      isLoading = true;
      final listState = context.watch<ListLoadBloc>().state;
      final listItemsState = context.watch<ListItemsLoadBloc>().state;
      if (listState is ListLoadLoaded &&
          listItemsState is ListItemsLoadLoaded) {
        list = listState.list;
        listItems = listItemsState.listItems;
        isLoading = false;
      }
    }

    showImage ??= list?.listType == ListType.other;
    logger.i('$className: showImage: $showImage');

    fields = [
      nameField(list),
      listTypeField(list),
      imagePickerField(list),
      mapCheckboxField(list),
      dateCheckboxField(list),
      timeCheckboxField(list),
      ...categoryFilterSettings(list, listItems),
      cancelButton(),
      submitButton(list),
    ];

    final sections = [
      FormInputSection(
        name: SectionName.basic.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: !isLoading,
      ),
      FormInputSection(
        name: SectionName.options.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: !isLoading,
      ),
      FormInputSection(
        name: SectionName.categoryFilterSettings.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: !isLoading,
      ),
      FormInputSection(
        name: SectionName.submit.value,
        direction: x_stack.AxisDirection.horizontal,
        showBorder: false,
      ),
    ];

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: isLoading
          ? generateShimmerFormFields(5, SectionName.basic.name)
          : fields,
      isLoading: isLoading,
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

  Future<void> save(ListOfThings? list, Map<String, dynamic> values) async {
    final listCrudBloc = BlocProvider.of<ListCrudBloc>(context);
    final goRouter = GoRouter.of(context);

    final listType = values[FieldId.listType.value] as ListType;

    String? imageFilename;
    if (values.containsKey(FieldId.listTypeImage.value)) {
      imageFilename =
          await uploadImage(values[FieldId.listTypeImage.value] as List);
      // logger.i('$className: imageFilename: $imageFilename');
    }

    final filterTypes = getFilterTypes(values);
    // logger.d('values: $values');
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
      ownerId: list?.ownerId,
      filterTypes: filterTypes,
    );
    // logger.d('newList: $newList');
    if (widget.listId == null) {
      listCrudBloc.add(AddList(newList));
    } else {
      listCrudBloc.add(UpdateList(newList));
    }
    // logger.i('$className -> popping once');
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

  FormInputFieldInfo nameField(
    ListOfThings? list,
  ) {
    return FormInputFieldInfo.textArea(
      id: FieldId.name.value,
      label: 'Name',
      currentValue: list?.name ?? '',
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      sectionName: SectionName.basic.value,
    );
  }

  FormInputFieldInfo listTypeField(
    ListOfThings? list,
  ) {
    return FormInputFieldInfo.dropdown(
      id: FieldId.listType.value,
      label: 'List type',
      currentValue: list?.listType ?? ListType.generic,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      options: ListType.values.toList(),
      optionToString: (listType) => (listType as ListType?)?.name ?? '',
      sectionName: SectionName.basic.value,
      onChange: (listType) => setState(() {
        logger.i('$className: onChange ListType: $listType');
        setState(() {
          showImage = listType == ListType.other.name;
          logger.i('$className: showImage: $showImage');
        });
      }),
    );
  }

  FormInputFieldInfo? imagePickerField(
    ListOfThings? list,
  ) {
    if (showImage ?? list?.listType == ListType.other) {
      return FormInputFieldInfo.imagePicker(
        id: FieldId.listTypeImage.value,
        label: 'Image',
        currentValue: list?.imageFilename,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.basic.value,
      );
    }
    return null;
  }

  FormInputFieldInfo mapCheckboxField(
    ListOfThings? list,
  ) {
    return FormInputFieldInfo.checkbox(
      id: FieldId.withMap.value,
      label: 'Use a map',
      currentValue: list?.withMap ?? false,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      sectionName: SectionName.options.value,
    );
  }

  FormInputFieldInfo dateCheckboxField(
    ListOfThings? list,
  ) {
    return FormInputFieldInfo.checkbox(
      id: FieldId.withDates.value,
      label: 'Use dates',
      currentValue: list?.withDates ?? false,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      sectionName: SectionName.options.value,
    );
  }

  FormInputFieldInfo timeCheckboxField(
    ListOfThings? list,
  ) {
    return FormInputFieldInfo.checkbox(
      id: FieldId.withTimes.value,
      label: 'Use time',
      currentValue: list?.withTimes ?? false,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      sectionName: SectionName.options.value,
    );
  }

  List<FormInputFieldInfo> categoryFilterSettings(
    ListOfThings? list,
    List<ListItem>? listItems,
  ) {
    final categories =
        CategoriesHelper.getAllCategoriesAndValues(listItems ?? []);
    return categories.entries
        .map(
          (entry) => FormInputFieldInfo.dropdown(
            id: getCategoryFilterFieldKey(entry.key),
            label: entry.key,
            currentValue: list?.filterTypes[entry.key] ?? FilterType.regular,
            validators: [
              FormBuilderValidators.required(),
              FormBuilderValidators.maxLength(70),
            ],
            options: FilterType.values.toList(),
            optionToString: (filterType) =>
                (filterType as FilterType?)?.value ?? '',
            sectionName: SectionName.categoryFilterSettings.value,
          ),
        )
        .toList();
  }

  FormInputFieldInfo cancelButton() {
    return FormInputFieldInfo.cancelButton(
      id: FieldId.cancel.value,
      label: 'Cancel',
      sectionName: SectionName.submit.value,
      cancel: () {
        print('cancelled');
      },
    );
  }

  FormInputFieldInfo submitButton(
    ListOfThings? list,
  ) {
    return FormInputFieldInfo.submitButton(
      id: FieldId.submit.value,
      label: 'Submit',
      sectionName: SectionName.submit.value,
      save: (Map<String, dynamic>? values) {
        if (values == null) {
          return;
        }
        save(list, values);
      },
    );
  }

  Map<String, FilterType> getFilterTypes(Map<String, dynamic> values) {
    final response = <String, FilterType>{};

    for (final entry in values.entries) {
      if (!entry.key.startsWith(FieldId.categoryFilter.name)) {
        continue;
      }
      final parts = entry.key.split('-');
      final name = parts[1];
      final value = entry.value as FilterType;

      response[name] = value;
    }
    return response;
  }

  String getCategoryFilterFieldKey(String filterTypeName) {
    return '${FieldId.categoryFilter.value}-$filterTypeName';
  }
}
