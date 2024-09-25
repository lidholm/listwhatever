import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:listwhatever/standard/form/form_generator.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

import '/custom/pages/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/list_load_events/list_load_bloc.dart';
import '/custom/pages/lists/list_load_events/list_load_event.dart';
import '/custom/pages/lists/list_load_events/list_load_state.dart';
import '/custom/pages/lists/models/list_of_things.dart';
import '/custom/pages/lists/models/list_type.dart';
import '/standard/widgets/appBar/common_app_bar.dart';

enum SectionName {
  basic._('Basic information'),
  options._('Options'),
  shared._('Share information'),
  submit._('Submit');

  const SectionName._(this.value);

  final String value;
}

class AddListPage extends StatefulWidget {
  const AddListPage({super.key, this.listId});
  final String? listId;

  @override
  State<AddListPage> createState() => _AddListPageState();
}

class _AddListPageState extends State<AddListPage> {
  // static String className = 'AddListPage';

  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();

  // ignore: strict_raw_type
  late List<FormInputFieldInfo> fields;

  ListOfThings? list;
  ListType? selectedListType;

  // void _onChanged(dynamic val) => logger.d(val.toString());

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

      final listStateView =
          ListOrListItemNotLoadedHandler.handleListState(listState);
      if (listStateView != null) {
        return listStateView;
      }
      list = (listState as ListLoadLoaded).list;
    }

    fields = [
      FormInputFieldInfo.textArea(
        id: 'name',
        label: 'Name',
        currentValue: list?.name,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.basic.value,
        hasError: false,
      ),
      FormInputFieldInfo<ListType>.dropdown(
        id: 'listType',
        label: 'List type',
        currentValue: list?.listType ?? ListType.other,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        options: ListType.values,
        optionToString: (listType) => (listType as ListType).name,
        sectionName: SectionName.basic.value,
        hasError: false,
      ),
      FormInputFieldInfo<String>.imagePicker(
        id: 'listTypeImage',
        label: 'Image',
        currentValue: null,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.basic.value,
        hasError: false,
      ),
      FormInputFieldInfo<ListType>.checkbox(
        id: 'withMap',
        label: 'Use a map',
        currentValue: false,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.options.value,
        hasError: false,
      ),
      FormInputFieldInfo<ListType>.checkbox(
        id: 'withDate',
        label: 'Use dates',
        currentValue: false,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.options.value,
        hasError: false,
      ),
      FormInputFieldInfo<ListType>.checkbox(
        id: 'withTime',
        label: 'Use time',
        currentValue: false,
        validators: [
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ],
        sectionName: SectionName.options.value,
        hasError: false,
      ),
      // FormInputFieldInfo<ListType>.cancelButton(
      //   id: 'cancel',
      //   label: 'Cancel',
      //   sectionName: SectionName.submit.value,
      // ),
      FormInputFieldInfo<ListType>.submitButton(
        id: 'submit',
        label: 'Submit',
        sectionName: SectionName.submit.value,
      ),
    ];

    final sectionNames = [
      SectionName.basic.value,
      SectionName.options.value,
      SectionName.shared.value,
      SectionName.submit.value,
    ];

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sectionNames: sectionNames,
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

  // Widget getCancelButton() {
  //   return Expanded(
  //     child: OutlinedButton(
  //       onPressed: () {
  //         _formKey.currentState?.reset();
  //       },
  //       // color: Theme.of(context).colorScheme.secondary,
  //       child: Text(
  //         'Reset',
  //         style: TextStyle(
  //           color: Theme.of(context).colorScheme.secondary,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  void save(FormBuilderState? currentState) {
    final values = <String, dynamic>{};
    for (final entry in currentState!.fields.entries) {
      values[entry.key] = entry.value.value;
    }
    // final listType = values[AddListValues.type.toString()] as ListType;
    // logger.d('values: $values');
    // final list = ListOfThings(
    //   id: initialValue[AddListValues.id.toString()] as String?,
    //   name: values[AddListValues.name.toString()]! as String,
    //   listType: listType,
    //   // imageFilename: getImageFilename(),
    //   withMap: values[AddListValues.withMap.toString()] as bool,
    //   withDates: values[AddListValues.withDates.toString()] as bool,
    //   withTimes: values[AddListValues.withTimes.toString()] as bool,
    //   shared: false, //values[AddListValues.share.toString()] as bool,
    //   shareCodeForViewer: null,
    //   shareCodeForEditor: null,
    //   sharedWith: {},
    //   ownerId: initialValue[AddListValues.ownerId.toString()] as String?,
    // );
    // if (widget.listId == null) {
    //   BlocProvider.of<ListCrudBloc>(context).add(AddList(list));
    // } else {
    //   BlocProvider.of<ListCrudBloc>(context).add(UpdateList(list));
    // }
    // logger.i('$className -> popping once');
    // GoRouter.of(context).pop();
  }
}
