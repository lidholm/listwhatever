import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/form/form_axis_direction.dart';
import 'package:listwhatever/form/form_generator.dart';
import 'package:listwhatever/form/form_input_field_info.dart';
import 'package:listwhatever/form/form_input_section.dart';
import 'package:listwhatever/helpers/constants.dart';
import 'package:listwhatever/pages/list/bloc/list_bloc.dart';
import 'package:listwhatever/pages/list/bloc/list_event.dart';
import 'package:listwhatever/pages/list/models/list_item.dart';
import 'package:listwhatever/pages/lists/models/list_of_things.dart';

const String className = 'AddListItemPage';

enum SectionName {
  mainInfo._('Main info'),
  categories._('Categories'),
  urls._('Urls'),
  date._('Date'),
  location._('Location'),
  submit._('Submit');

  const SectionName._(this.value);

  final String value;
}

enum FieldId {
  name._('name'),
  info._('info'),
  categories._('categories'),
  addCategory._('addCategory'),
  date._('date'),
  urls._('urls'),
  addUrl._('addUrl'),
  address._('address'),
  latlong._('latlong'),
  searchPhrase._('searchPhrase'),
  cancel._('cancel'),
  submit._('submit');

  const FieldId._(this.value);

  final String value;
}

class AddListItemForm extends StatelessWidget {
  AddListItemForm({
    required this.list,
    super.key,
  });
  final ListOfThings? list;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    const isLoading = false;

    final fields = [
      nameInputField(isLoading: isLoading),
      extraInfoField(isLoading: isLoading),
      ...categoryFields(isLoading: isLoading),
      addCategoryButton(isLoading: isLoading),
      ...urlFields(isLoading: isLoading),
      addUrlButton(isLoading: isLoading),
      if (list?.withDates ?? false) dateInputField(isLoading: isLoading),
      if (list?.withMap ?? false) ...[
        searchLocationButton(isLoading: isLoading),
        addressField(isLoading: isLoading),
        latLongField(isLoading: isLoading),
      ],
      cancelButton(isLoading: isLoading),
      submitButton(isLoading: isLoading),
    ];

    final sections = getSections();

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: fields,
      isLoading: false, // TODO: Update
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: formGenerator,
      ),
    );
  }

  FormInputFieldInfo nameInputField({required bool isLoading}) {
    return FormInputFieldInfo.textArea(
      id: FieldId.name.value,
      label: 'Item name',
      currentValue: /*listItem?.name ??*/ '',
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      sectionName: SectionName.mainInfo.value,
      isLoading: isLoading,
    );
  }

  FormInputFieldInfo extraInfoField({required bool isLoading}) {
    return FormInputFieldInfo.textArea(
      // TODO: Multiline field
      // minLines: 3,
      // maxLines: 6,
      // keyboardType: TextInputType.multiline,
      // textInputAction: TextInputAction.newline,
      id: FieldId.info.value,
      label: 'Extra info',
      currentValue: /*listItem?.info ?? */ '',
      validators: [
        FormBuilderValidators.maxLength(1200, checkNullOrEmpty: false),
      ],
      sectionName: SectionName.mainInfo.value, isLoading: isLoading,
    );
  }

  List<FormInputFieldInfo> categoryFields({required bool isLoading}) {
    // if (categories == null) {
    //   setState(() {
    //     categories = {};
    //     final keys = listItem?.categories.keys ?? [];
    //     for (final key in keys) {
    //       final indexKey = getRandomString(3);
    //       categories![indexKey] =
    //           (key, listItem?.categories[key]?.join(',') ?? '');
    //     }
    //   });
    // }

    // return [
    //   for (final ik in categories!.entries)
    //     categoryField(ik.key, ik.value.$1, ik.value.$2, isLoading: isLoading),
    // ];
    return [];
  }

  FormInputFieldInfo categoryField(
    String indexKey,
    String left,
    String right, {
    required bool isLoading,
  }) {
    return FormInputFieldInfo.twoAutoCompleteFields(
      id: getCategoryId(Side.left, indexKey),
      id2: getCategoryId(Side.right, indexKey),
      sectionName: SectionName.categories.value,
      labelLeft: 'Left',
      labelRight: 'Right',
      currentValueLeft: left,
      currentValueRight: right,
      optionsLeft: [], // categoriesForList.keys.toList(),
      optionsRight: {}, // categoriesForList,
      validatorsLeft: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(40, checkNullOrEmpty: false),
      ],
      validatorsRight: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(200, checkNullOrEmpty: false),
      ],
      deletable: true,
      onDelete: () {
        // setState(() {
        //   categories!.remove(indexKey);
        // });
        _formKey.currentState?.value[getCategoryId(Side.left, indexKey)] = null;
        _formKey.currentState?.value[getCategoryId(Side.right, indexKey)] =
            null;
      },
      isLoading: isLoading,
    );
  }

  String getCategoryId(Side side, String indexKey) {
    return '${FieldId.categories.value}-${side.name}-$indexKey';
  }

  FormInputFieldInfo addCategoryButton({required bool isLoading}) {
    return FormInputFieldInfo.customButton(
      id: FieldId.addCategory.value,
      label: 'Add category',
      sectionName: SectionName.categories.value,
      callback: () {
        // setState(() {
        //   final indexKey = getRandomString(3);
        //   categories![indexKey] = ('', '');
        // });
      },
      isLoading: isLoading,
    );
  }

  List<FormInputFieldInfo> urlFields({required bool isLoading}) {
    // if (urls == null) {
    //   setState(() {
    //     urls = {};
    //     for (final url in listItem?.urls ?? <String>[]) {
    //       final indexKey = getRandomString(3);
    //       urls![indexKey] = url;
    //     }
    //   });
    // }

    // return [
    //   for (final ik in urls!.entries) urlField(ik.key, ik.value),
    // ];
    return [];
  }

  FormInputFieldInfo urlField(
    String indexKey,
    String url, {
    required bool isLoading,
  }) {
    return FormInputFieldInfo.textArea(
      id: getUrlId(indexKey),
      label: 'Url',
      currentValue: url,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(200, checkNullOrEmpty: false),
      ],
      sectionName: SectionName.urls.value,
      deletable: true,
      onDelete: () {
        // setState(() {
        //   urls!.remove(indexKey);
        // });
        _formKey.currentState?.value[getUrlId(indexKey)] = null;
      },
      isLoading: isLoading,
    );
  }

  String getUrlId(String indexKey) {
    return '${FieldId.urls.value}-$indexKey';
  }

  FormInputFieldInfo addUrlButton({required bool isLoading}) {
    return FormInputFieldInfo.customButton(
      id: FieldId.addUrl.value,
      label: 'Add url',
      sectionName: SectionName.urls.value,
      callback: () {
        // setState(() {
        //   final indexKey = getRandomString(3);
        //   urls![indexKey] = '';
        // });
      },
      isLoading: isLoading,
    );
  }

  FormInputFieldInfo dateInputField({required bool isLoading}) {
    return FormInputFieldInfo.date(
      id: FieldId.date.value,
      label: 'Date',
      currentValue: /*listItem?.datetime ??*/ DateTime.now(),
      inputType: (list?.withTimes ?? false) ? InputType.both : InputType.date,
      sectionName: SectionName.date.value,
      isLoading: isLoading,
    );
  }

  FormInputFieldInfo searchLocationButton({required bool isLoading}) {
    return FormInputFieldInfo.customButton(
      id: 'searchButton',
      label: 'Search for a location',
      sectionName: SectionName.location.value,
      callback: () async {
        // final locationResponse = await const SearchLocationPageRoute()
        //     .push<SearchLocationResponse>(context);

        // final latlong =
        //     (locationResponse?.lat != null && locationResponse?.long != null)
        //         ? '${locationResponse?.lat}, ${locationResponse?.long}'
        //         : '0.0, 0.0';

        // _formKey.currentState?.patchValue({
        //   FieldId.address.name: locationResponse?.address ?? '',
        //   FieldId.latlong.name: latlong,
        //   FieldId.searchPhrase.name: locationResponse?.searchPhrase ?? '',
        // });
      },
      isLoading: isLoading,
    );
  }

  FormInputFieldInfo addressField({required bool isLoading}) {
    return FormInputFieldInfo.textArea(
      id: FieldId.address.value,
      label: 'Address',
      currentValue: /*listItem?.address ?? */ '', // TODO
      validators: [
        FormBuilderValidators.maxLength(150, checkNullOrEmpty: false),
      ],
      sectionName: SectionName.location.value, isLoading: isLoading,
    );
  }

  FormInputFieldInfo latLongField({required bool isLoading}) {
    return FormInputFieldInfo.textArea(
      id: FieldId.latlong.value,
      label: 'LatLong',
      currentValue: /*listItem?.latLong != null
          ? '${listItem?.latLong?.lat}, ${listItem?.latLong?.lng}'
          : */
          '',
      validators: [
        FormBuilderValidators.maxLength(70, checkNullOrEmpty: false),
        validLatLong,
      ],
      sectionName: SectionName.location.value,
      isLoading: isLoading,
    );
  }

  String? validLatLong(String? text) {
    if (text == null || text.isEmpty) {
      return null;
    }
    const latLongPattern =
        r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$';
    final regex = RegExp(latLongPattern);
    return regex.hasMatch(text) ? null : 'Not a valid LatLong';
  }

  FormInputFieldInfo cancelButton({required bool isLoading}) {
    return FormInputFieldInfo.cancelButton(
      id: FieldId.cancel.value,
      label: 'Cancel',
      sectionName: SectionName.submit.value,
      cancel: () {
        print('cancelled. THIS SHOULD DO SOMETHING');
      },
      isLoading: isLoading,
    );
  }

  FormInputFieldInfo submitButton({required bool isLoading}) {
    return FormInputFieldInfo.submitButton(
      id: FieldId.submit.value,
      label: 'Submit',
      sectionName: SectionName.submit.value,
      save: (Map<String, dynamic>? values) {
        if (values == null) {
          return;
        }
        // save(values);
      },
      isLoading: isLoading,
    );
  }

  List<FormInputSection> getSections() {
    return [
      FormInputSection(
        name: SectionName.mainInfo.value,
        direction: FormAxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.categories.value,
        direction: FormAxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.urls.value,
        direction: FormAxisDirection.vertical,
        showBorder: true,
      ),
      if (list?.withDates ?? false)
        FormInputSection(
          name: SectionName.date.value,
          direction: FormAxisDirection.vertical,
          showBorder: true,
        ),
      if (list?.withMap ?? false)
        FormInputSection(
          name: SectionName.location.value,
          direction: FormAxisDirection.vertical,
          showBorder: true,
        ),
      FormInputSection(
        name: SectionName.submit.value,
        direction: FormAxisDirection.horizontal,
        showBorder: false,
      ),
    ];
  }

  List<String> getValuesForCategory(String t) {
    // final values = categoriesForList[t]?.toList() ?? [];
    // return values;
    return [];
  }

  Future<void> save(
    BuildContext context,
    ListOfThings? list,
    Map<String, dynamic> values,
  ) async {
    final listBloc = BlocProvider.of<ListBloc>(context);
    final goRouter = GoRouter.of(context);

    final newItem = ListItem(id: 'idItem', name: 'Hello');

    // LoggerHelper.logger.d('newList: $newList');
    // if (widget.listId == null) {
    listBloc.add(AddListItem(list!.id!, newItem));
    // } else {
    //   listCrudBloc.add(UpdateList(newList));
    // }
    // LoggerHelper.logger.i('$className -> popping once');
    goRouter.pop();
  }
}
