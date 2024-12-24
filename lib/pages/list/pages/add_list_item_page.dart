import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

final addListItemFormKey = GlobalKey<FormBuilderState>();

class AddListItemPage extends HookWidget {
  const AddListItemPage({required this.listId, super.key});
  final String listId;

  @override
  Widget build(BuildContext context) {
    final categories = useState(<String, (String, String)>{});
    final urls = useState(<String, String>{});

    final fields = [
      nameInputField(isLoading: false),
      extraInfoField(isLoading: false),
      ...categoryFields(isLoading: false, categories: categories),
      addCategoryButton(isLoading: false, categories: categories),
      ...urlFields(isLoading: false, urls: urls),
      addUrlButton(isLoading: false, urls: urls),
      // if (list!.withDates) dateInputField(isLoading: false),
      // if (list!.withMap) ...[
      //   searchLocationButton(isLoading: false),
      //   addressField(isLoading: false),
      //   latLongField(isLoading: false),
      // ],
      cancelButton(isLoading: false),
      submitButton(context: context, isLoading: false),
    ];

    final sections = getSections();

    final formGenerator = FormGenerator(
      formKey: addListItemFormKey,
      sections: sections,
      fields: fields,
      isLoading: false, // TODO: Update
    );

    return Scaffold(
      appBar: getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: formGenerator,
        ),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: const Text(/*listItem == null ?*/ 'Add item' /* : 'Edit item'*/),
      actions: const [
        // if (listItem != null)
        //   AppBarAction(
        //     type: AppBarActionType.icon,
        //     iconAction: AppBarActionIcon(
        //       title: AppLocalizations.of(context).deleteListItem,
        //       icon: Icons.delete,
        //       key: const Key('deleteListItemAction'),
        //       callback: () async {
        //         context
        //             .read<ListItemCrudBloc>()
        //             .add(DeleteListItem(widget.actualListId, listItem!.id!));
        //         context.read<RedirectCubit>().setRedirect(
        //               ListItemsPageRoute(actualListId: widget.actualListId)
        //                   .location,
        //             );
        //       },
        //     ),
        //   ),
      ],
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
      // if (list!.withDates)
      //   FormInputSection(
      //     name: SectionName.date.value,
      //     direction: FormAxisDirection.vertical,
      //     showBorder: true,
      //   ),
      // if (list!.withMap)
      //   FormInputSection(
      //     name: SectionName.location.value,
      //     direction: FormAxisDirection.vertical,
      //     showBorder: true,
      //   ),
      FormInputSection(
        name: SectionName.submit.value,
        direction: FormAxisDirection.horizontal,
        showBorder: false,
      ),
    ];
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
      currentValue: /*listItem?.info ??*/ '',
      validators: [
        FormBuilderValidators.maxLength(1200, checkNullOrEmpty: false),
      ],
      sectionName: SectionName.mainInfo.value, isLoading: isLoading,
    );
  }

  List<FormInputFieldInfo> categoryFields({
    required bool isLoading,
    required ValueNotifier<Map<String, (String, String)>> categories,
  }) {
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
    print('here: $categories');

    return [
      for (final ik in categories.value.entries)
        categoryField(
          ik.key,
          ik.value.$1,
          ik.value.$2,
          isLoading: isLoading,
          categories: categories,
        ),
    ];
  }

  FormInputFieldInfo categoryField(
    String indexKey,
    String left,
    String right, {
    required bool isLoading,
    required ValueNotifier<Map<String, (String, String)>> categories,
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
      optionsRight: {}, //categoriesForList,
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
        final tmp = categories.value..remove(indexKey);
        categories.value = {...tmp};
        addListItemFormKey
            .currentState?.value[getCategoryId(Side.left, indexKey)] = null;
        addListItemFormKey
            .currentState?.value[getCategoryId(Side.right, indexKey)] = null;
      },
      isLoading: isLoading,
    );
  }

  String getCategoryId(Side side, String indexKey) {
    return '${FieldId.categories.value}-${side.name}-$indexKey';
  }

  FormInputFieldInfo addCategoryButton({
    required bool isLoading,
    required ValueNotifier<Map<String, (String, String)>> categories,
  }) {
    return FormInputFieldInfo.customButton(
      id: FieldId.addCategory.value,
      label: 'Add category',
      sectionName: SectionName.categories.value,
      callback: () {
        final indexKey = getRandomString(3);
        final tmp = categories.value;
        tmp[indexKey] = ('', '');
        categories.value = {...tmp};
        print('categories: $categories');
      },
      isLoading: isLoading,
    );
  }

  List<FormInputFieldInfo> urlFields({
    required bool isLoading,
    required ValueNotifier<Map<String, String>> urls,
  }) {
    // if (urls.value == null) {
    //   urls = {};
    //   for (final url in listItem?.urls ?? <String>[]) {
    //     final indexKey = getRandomString(3);
    //     urls![indexKey] = url;
    //   }
    // }

    return [
      for (final ik in urls.value.entries)
        urlField(ik.key, ik.value, urls: urls, isLoading: isLoading),
    ];
  }

  FormInputFieldInfo urlField(
    String indexKey,
    String url, {
    required ValueNotifier<Map<String, String>> urls,
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
        final tmp = urls.value..remove(indexKey);
        urls.value = {...tmp};
        addListItemFormKey.currentState?.value[getUrlId(indexKey)] = null;
      },
      isLoading: isLoading,
    );
  }

  String getUrlId(String indexKey) {
    return '${FieldId.urls.value}-$indexKey';
  }

  FormInputFieldInfo addUrlButton({
    required bool isLoading,
    required ValueNotifier<Map<String, String>> urls,
  }) {
    return FormInputFieldInfo.customButton(
      id: FieldId.addUrl.value,
      label: 'Add url',
      sectionName: SectionName.urls.value,
      callback: () {
        final indexKey = getRandomString(3);
        final tmp = urls.value;
        tmp[indexKey] = '';
        urls.value = {...tmp};
      },
      isLoading: isLoading,
    );
  }

  // FormInputFieldInfo dateInputField() {
  //   return FormInputFieldInfo.date(
  //     id: FieldId.date.value,
  //     label: 'Date',
  //     currentValue: listItem?.datetime ?? DateTime.now(),
  //     inputType: (list?.withTimes ?? false) ? InputType.both : InputType.date,
  //     sectionName: SectionName.date.value,
  //   );
  // }

  // FormInputFieldInfo searchLocationButton() {
  //   return FormInputFieldInfo.customButton(
  //     id: 'searchButton',
  //     label: 'Search for a location',
  //     sectionName: SectionName.location.value,
  //     callback: () async {
  //       final locationResponse = await const SearchLocationPageRoute()
  //           .push<SearchLocationResponse>(context);
  //       final latlong =
  //           (locationResponse?.lat != null && locationResponse?.long != null)
  //               ? '${locationResponse?.lat}, ${locationResponse?.long}'
  //               : '0.0, 0.0';
  //       _formKey.currentState?.patchValue({
  //         FieldId.address.name: locationResponse?.address ?? '',
  //         FieldId.latlong.name: latlong,
  //         FieldId.searchPhrase.name: locationResponse?.searchPhrase ?? '',
  //       });
  //     },
  //   );
  // }

  // FormInputFieldInfo addressField() {
  //   return FormInputFieldInfo.textArea(
  //     id: FieldId.address.value,
  //     label: 'Address',
  //     currentValue: listItem?.address ?? '', // TODO
  //     validators: [
  //       FormBuilderValidators.maxLength(150, checkNullOrEmpty: false),
  //     ],
  //     sectionName: SectionName.location.value,
  //   );
  // }

  // FormInputFieldInfo latLongField() {
  //   return FormInputFieldInfo.textArea(
  //     id: FieldId.latlong.value,
  //     label: 'LatLong',
  //     currentValue: listItem?.latLong != null
  //         ? '${listItem?.latLong?.lat}, ${listItem?.latLong?.lng}'
  //         : '',
  //     validators: [
  //       FormBuilderValidators.maxLength(70, checkNullOrEmpty: false),
  //       validLatLong,
  //     ],
  //     sectionName: SectionName.location.value,
  //   );
  // }

  // String? validLatLong(String? text) {
  //   if (text == null || text.isEmpty) {
  //     return null;
  //   }
  //   const latLongPattern =
  //       r'^[-+]?([1-8]?\d(\.\d+)?|90(\.0+)?),\s*[-+]?(180(\.0+)?|((1[0-7]\d)|([1-9]?\d))(\.\d+)?)$';
  //   final regex = RegExp(latLongPattern);
  //   return regex.hasMatch(text) ? null : 'Not a valid LatLong';
  // }

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

  FormInputFieldInfo submitButton(
      {required BuildContext context, required bool isLoading}) {
    return FormInputFieldInfo.submitButton(
      id: FieldId.submit.value,
      label: 'Submit',
      sectionName: SectionName.submit.value,
      save: (Map<String, dynamic>? values) {
        if (values == null) {
          return;
        }
        save(values, context);
      },
      isLoading: isLoading,
    );
  }

  void save(Map<String, dynamic> values, BuildContext context) {
    // final latLongString = values[FieldId.latlong.name] as String?;
    // final latLongParts =
    //     (latLongString?.isEmpty ?? true) ? null : latLongString?.split(',');
    // final lat =
    //     latLongParts == null ? null : double.parse(latLongParts.first.trim());
    // final lng =
    //     latLongParts == null ? null : double.parse(latLongParts.last.trim());
    // final categories = widget.getCategories(values);

    final listItem = ListItem(
      id: null, // listItemId,
      name: values[FieldId.name.name]! as String,
      info: values[FieldId.info.name] as String?,
      urls: values.entries
          .where(
            (element) => element.key.startsWith(FieldId.urls.name),
          )
          .map((entry) => entry.value as String)
          .toList(),
      datetime: values[FieldId.date.name] as DateTime?,
      // latLong: lat != null ? LatLong(lat: lat, lng: lng!) : null,
      address: values[FieldId.address.name] as String?,
      // categories: categories,
    );

    // if (listItemId == null) {
    BlocProvider.of<ListBloc>(context).add(AddListItem(listId, listItem));
    // } else {
    //   BlocProvider.of<ListItemCrudBloc>(context)
    //       .add(UpdateListItem(list!.id!, listItem));
    // }
    GoRouter.of(context).pop();
  }
}
