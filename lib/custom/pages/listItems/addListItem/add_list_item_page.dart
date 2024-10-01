import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/lists/categories_for_list/categories_for_list_bloc.dart';
import 'package:listwhatever/custom/pages/lists/categories_for_list/categories_for_list_event.dart';
import 'package:listwhatever/custom/pages/lists/categories_for_list/categories_for_list_state.dart';
import 'package:listwhatever/standard/form/form_generator.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_section.dart';

import '/custom/navigation/routes.dart';
import '/custom/pages/listItems/list_item_crud_bloc/list_item_crud_bloc.dart';
import '/custom/pages/listItems/list_item_crud_bloc/list_item_crud_event.dart';
import '/custom/pages/listItems/list_item_crud_bloc/list_item_crud_state.dart';
import '/custom/pages/listItems/list_item_load_bloc/list_item_load_bloc.dart';
import '/custom/pages/listItems/list_item_load_bloc/list_item_load_event.dart';
import '/custom/pages/listItems/list_item_load_bloc/list_item_load_state.dart';
import '/custom/pages/listItems/models/list_item.dart';
import '/custom/pages/listItems/route/list_items_page_route.dart';
import '/custom/pages/list_or_list_item_not_loaded_handler.dart';
import '/custom/pages/lists/list_load_events/list_load_bloc.dart';
import '/custom/pages/lists/list_load_events/list_load_event.dart';
import '/custom/pages/lists/list_load_events/list_load_state.dart';
import '/custom/pages/lists/models/list_of_things.dart';
import '/l10n/l10n.dart';
import '/standard/constants.dart';
import '/standard/navigation/redirect_cubit.dart';
import '/standard/widgets/appBar/app_bar_action.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/x_stack.dart' as x_stack;

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

class AddListItemPage extends StatefulWidget {
  const AddListItemPage({
    required this.actualListId,
    this.listItemId,
    super.key,
  });
  final String actualListId;
  final String? listItemId;

  @override
  State<AddListItemPage> createState() => _AddListItemPageState();

  // Map<String, List<String>> getCategories(Map<String, dynamic> values) {
  //   final categoriesZip = IterableZip([
  //     values.entries
  //         .where(
  //           (element) => element.key
  //               .startsWith(AddListItemValues.categoryKeys.toString()),
  //         )
  //         .toList(),
  //     values.entries
  //         .where(
  //           (element) => element.key
  //               .startsWith(AddListItemValues.categoryValues.toString()),
  //         )
  //         .toList(),
  //   ]);
  //   final categories = <String, List<String>>{};
  //   for (final e in categoriesZip) {
  //     final category = e[0].value as String;
  //     final values =
  //         (e[1].value as String).split(',').map((t) => t.trim()).toList();
  //     categories[category] = values;
  //   }
  //   return categories;
  // }
}

class _AddListItemPageState extends State<AddListItemPage> {
  String? listItemId;
  final _formKey = GlobalKey<FormBuilderState>();

  ListOfThings? list;
  ListItem? listItem;
  Map<String, Set<String>> categoriesForList = {};

  // ignore: strict_raw_type
  late List<FormInputFieldInfo> fields;
  List<String> valuesForCategory = [];

  List<String>? urls;
  List<MapEntry<String, String>>? categories;

  @override
  void initState() {
    BlocProvider.of<ListLoadBloc>(context).add(LoadList(widget.actualListId));
    BlocProvider.of<CategoriesForListBloc>(context)
        .add(LoadCategoriesForList(widget.actualListId));
    listItemId = widget.listItemId;
    if (listItemId != null) {
      BlocProvider.of<ListItemLoadBloc>(context)
          .add(LoadListItem(widget.actualListId, listItemId!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    logger.d('$className: in AddListItemPage');

    final listState = context.watch<ListLoadBloc>().state;
    final listItemState = context.watch<ListItemLoadBloc>().state;
    final categoriesForListState = context.watch<CategoriesForListBloc>().state;
    listItem = getMaybeListItem(listItemState);

    final notLoadedView = getNotLoadedView(
      listState,
      listItemState,
      categoriesForListState,
    );
    if (notLoadedView != null) {
      return notLoadedView;
    }

    list = (listState as ListLoadLoaded).list;
    categoriesForList =
        (categoriesForListState as CategoriesForListLoaded).categoriesForList;

    fields = [
      nameInputField(),
      extraInfoField(),
      ...categoryFields(),
      addCategoryButton(),
      ...urlFields(),
      addUrlButton(),
      dateInputField(),
      searchLocationButton(),
      addressField(),
      latLongField(),
      cancelButton(),
      submitButton(),
    ];

    final sections = getSections();

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: fields,
    );

    return BlocListener<ListItemCrudBloc, ListItemCrudState>(
      listener: (context, state) {
        final goRouter = GoRouter.of(context);
        return listItemChangedListener(goRouter, state);
      },
      child: Scaffold(
        appBar: getAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: formGenerator,
          ),
        ),
      ),
    );
  }

  CommonAppBar getAppBar() {
    return CommonAppBar(
      title: listItem == null ? 'Add item' : 'Edit item',
      actions: [
        if (listItem != null)
          AppBarAction(
            type: AppBarActionType.icon,
            iconAction: AppBarActionIcon(
              title: context.l10n.deleteListItem,
              icon: Icons.delete,
              key: const Key('deleteListItemAction'),
              callback: () async {
                context
                    .read<ListItemCrudBloc>()
                    .add(DeleteListItem(widget.actualListId, listItem!.id!));
                context.read<RedirectCubit>().setRedirect(
                      ListItemsPageRoute(actualListId: widget.actualListId)
                          .location,
                    );
              },
            ),
          ),
      ],
    );
  }

  Widget? getNotLoadedView(
    ListLoadState listState,
    ListItemLoadState listItemState,
    CategoriesForListState categoriesForListState,
  ) {
    final listStateView =
        ListOrListItemNotLoadedHandler.handleListState(listState);
    if (listStateView != null) {
      return listStateView;
    }
    if (listItemId != null) {
      final listItemStateView =
          ListOrListItemNotLoadedHandler.handleListItemState(listItemState);
      if (listItemStateView != null) {
        return listItemStateView;
      }
    }
    if (categoriesForListState is! CategoriesForListLoaded) {
      return const CircularProgressIndicator();
    }
    return null;
  }

  // FormBuilder createForm(
  //   ListOfThings? list,
  //   ListItem? listItem,
  //   List<Widget> children,
  // ) {
  //   final initialValue = {
  //     AddListItemValues.name.toString(): listItem?.name,
  //     AddListItemValues.info.toString(): listItem?.info,
  //     AddListItemValues.date.toString(): listItem?.datetime ??
  //         DateTime.now().copyWith(
  //           hour: (list?.withTimes ?? false) ? 8 : 0,
  //           minute: 0,
  //           second: 0,
  //         ),
  //     AddListItemValues.address.toString(): listItem?.address,
  //     AddListItemValues.latlong.toString():
  //         (listItem != null && listItem.latLong != null)
  //             ? '${listItem.latLong!.lat}, ${listItem.latLong!.lng}'
  //             : null,
  //     ...getCategoryKeysMap(listItem),
  //     ...getCategoryValuesMap(listItem),
  //     ...getUrlsMap(listItem),
  //   };
  //   return FormBuilder(
  //     key: _formKey,
  //     onChanged: () {
  //       _formKey.currentState!.save();
  //       // logger.d(_formKey.currentState!.value.toString());
  //     },
  //     autovalidateMode: AutovalidateMode.disabled,
  //     initialValue: initialValue,
  //     skipDisabled: true,
  //     child: VStack(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       children: children,
  //     ),
  //   );
  // }

  // Map<String, dynamic> getCategoryKeysMap(ListItem? listItem) {
  //   if (listItem == null) {
  //     return {};
  //   }
  //   final values = <String, dynamic>{};
  //   for (final entry in mapIndexed(listItem.categories.entries)) {
  //     final index = entry.$1;
  //     final key = '${AddListItemValues.categoryKeys}-$index';
  //     final value = entry.$2.key;
  //     values[key] = value;
  //   }
  //   return values;
  // }

  // Map<String, dynamic> getCategoryValuesMap(ListItem? listItem) {
  //   if (listItem == null) {
  //     return {};
  //   }
  //   final values = <String, dynamic>{};
  //   for (final entry in mapIndexed(listItem.categories.entries)) {
  //     final index = entry.$1;
  //     final key = '${AddListItemValues.categoryValues}-$index';
  //     final value = entry.$2.value.join(', ');
  //     values[key] = value;
  //   }
  //   return values;
  // }

  // Map<String, dynamic> getUrlsMap(ListItem? listItem) {
  //   if (listItem == null) {
  //     return {};
  //   }
  //   final values = <String, dynamic>{};
  //   for (final entry in mapIndexed(listItem.urls)) {
  //     final index = entry.$1;
  //     final key = '${AddListItemValues.urls}-$index';
  //     final value = entry.$2;
  //     values[key] = value;
  //   }
  //   return values;
  // }

  // Expanded createSaveButton(String userListId, ListOfThings? list) {
  //   return Expanded(
  //     child: ElevatedButton(
  //       onPressed: () {
  //         if (_formKey.currentState?.saveAndValidate() ?? false) {
  //           // logger.d(_formKey.currentState?.value.toString());
  //           save(userListId, _formKey.currentState);
  //         } else {
  //           logger
  //             ..d(_formKey.currentState?.value.toString())
  //             ..d('validation failed');
  //         }
  //       },
  //       child: const Text(
  //         'Save',
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     ),
  //   );
  // }

  // Expanded createResetButton(BuildContext context) {
  //   return Expanded(
  //     child: OutlinedButton(
  //       onPressed: () {
  //         _formKey.currentState?.reset();
  //       },
  //       child: Text(
  //         'Reset',
  //         style: TextStyle(
  //           color: Theme.of(context).colorScheme.secondary,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  // FormBuilderTextField createLatLongFields() {
  //   return FormBuilderTextField(
  //     autovalidateMode: AutovalidateMode.always,
  //     name: AddListItemValues.latlong.toString(),
  //     decoration: InputDecoration(
  //       labelText: 'LatLong (e.g. 12.3, -23.4)',
  //       suffixIcon: _latLongHasError
  //           ? const Icon(Icons.error, color: Colors.red)
  //           : const Icon(Icons.check, color: Colors.green),
  //     ),
  //     onChanged: (val) {
  //       setState(() {
  //         _latLongHasError = !(_formKey
  //                 .currentState?.fields[AddListItemValues.latlong.toString()]
  //                 ?.validate() ??
  //             false);
  //       });
  //     },
  //     validator: FormBuilderValidators.compose([
  //       FormBuilderValidators.maxLength(40),
  //       FormBuilderValidators.match(
  //         RegExp(r'\d*(\.\d*)?,\s*-?\d*(\.\d*)'),
  //         errorText: "Doesn't match 12.3, 3.45",
  //       ),
  //     ]),
  //     keyboardType: TextInputType.text,
  //     textInputAction: TextInputAction.next,
  //   );
  // }

  // FormBuilderTextField createAddressField() {
  //   return FormBuilderTextField(
  //     autovalidateMode: AutovalidateMode.always,
  //     name: AddListItemValues.address.toString(),
  //     minLines: 1,
  //     maxLines: 3,
  //     decoration: InputDecoration(
  //       labelText: 'Address',
  //       suffixIcon: _addressHasError
  //           ? const Icon(Icons.error, color: Colors.red)
  //           : const Icon(Icons.check, color: Colors.green),
  //     ),
  //     onChanged: (val) {
  //       setState(() {
  //         _addressHasError = !(_formKey
  //                 .currentState?.fields[AddListItemValues.address.toString()]
  //                 ?.validate() ??
  //             false);
  //       });
  //     },
  //     validator: FormBuilderValidators.compose([
  //       FormBuilderValidators.maxLength(200),
  //     ]),
  //     keyboardType: TextInputType.multiline,
  //     textInputAction: TextInputAction.newline,
  //   );
  // }

  // ElevatedButton createSearchLocationButton(BuildContext context) {
  //   return ElevatedButton(
  //     onPressed: () async {
  //       final response = await const SearchLocationPageRoute()
  //           .push<SearchLocationResponse>(context);
  //       if (response == null) {
  //         return;
  //       }
  //       _formKey.currentState?.patchValue({
  //         AddListItemValues.address.toString(): response.address,
  //         AddListItemValues.latlong.toString():
  //             '${response.lat}, ${response.long}',
  //       });
  //     },
  //     child: Padding(
  //       padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
  //       child: Text(context.l10n.searchForLocationButton),
  //     ),
  //   );
  // }

  // FormBuilderDateTimePicker createDateField(ListOfThings? list) {
  //   return FormBuilderDateTimePicker(
  //     name: AddListItemValues.date.toString(),
  //     inputType: list!.withTimes ? InputType.both : InputType.date,
  //     decoration: InputDecoration(
  //       labelText: list.withTimes ? 'Date and time' : 'Date',
  //       suffixIcon: IconButton(
  //         icon: const Icon(Icons.close),
  //         onPressed: () {
  //           _formKey.currentState!.fields['date']?.didChange(null);
  //         },
  //       ),
  //     ),
  //   );
  // }

  // Widget addUrlButton() {
  //   return addButton(() {
  //     setState(() {
  //       urls = [...urls, ''];
  //       _urlHasError = [..._urlHasError, false];
  //     });
  //   });
  // }

  // List<Widget> createUrlFields() {
  //   return [
  //     for (final urlMap in mapIndexed(urls))
  //       padLeft(
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               child: FormBuilderTextField(
  //                 autovalidateMode: AutovalidateMode.always,
  //                 name: '${AddListItemValues.urls}-${[urlMap.$1]}',
  //                 decoration: InputDecoration(
  //                   labelText: 'URL',
  //                   suffixIcon: _urlHasError[urlMap.$1]
  //                       ? const Icon(Icons.error, color: Colors.red)
  //                       : const Icon(Icons.check, color: Colors.green),
  //                 ),
  //                 onChanged: (val) {
  //                   setState(() {
  //                     _urlHasError[urlMap.$1] = !(_formKey.currentState
  //                             ?.fields[AddListItemValues.info.toString()]
  //                             ?.validate() ??
  //                         false);
  //                   });
  //                 },
  //                 validator: FormBuilderValidators.compose([
  //                   FormBuilderValidators.max(1200),
  //                 ]),
  //                 keyboardType: TextInputType.url,
  //                 textInputAction: TextInputAction.next,
  //               ),
  //             ),
  //             padLeft(
  //               circleButton(
  //                 Icons.delete,
  //                 () {
  //                   setState(() {
  //                     logger.i('$className => not doing anything yet');
  //                   });
  //                 },
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //   ];
  // }

  // Widget addButton(void Function() onPressed) {
  //   return circleButton(Icons.add, onPressed);
  // }

  // Widget circleButton(IconData icon, void Function() onPressed) {
  //   return CircleAvatar(
  //     radius: 16,
  //     backgroundColor: AppColors.darkPurple,
  //     child: IconButton(
  //       onPressed: onPressed,
  //       iconSize: 16,
  //       icon: Icon(icon),
  //     ),
  //   );
  // }

  // List<Widget> createCategoryFields() {
  //   return [
  //     for (final categoryMap in mapIndexed(categoryKeys))
  //       Row(
  //         children: [
  //           Expanded(
  //             child: padLeft(
  //               FormBuilderTextField(
  //                 autovalidateMode: AutovalidateMode.always,
  //                 name: '${AddListItemValues.categoryKeys}-${categoryMap.$1}',
  //                 decoration: InputDecoration(
  //                   labelText: 'Category',
  //                   suffixIcon: _nameHasError
  //                       ? const Icon(Icons.error, color: Colors.red)
  //                       : const Icon(Icons.check, color: Colors.green),
  //                 ),
  //                 onChanged: (val) {
  //                   setState(() {
  //                     _categoryHasError[categoryMap.$1] = !(_formKey
  //                             .currentState
  //                             ?.fields[
  //                                 AddListItemValues.categoryKeys.toString()]
  //                             ?.validate() ??
  //                         false);
  //                   });
  //                 },
  //                 validator: FormBuilderValidators.compose([
  //                   FormBuilderValidators.required(),
  //                   FormBuilderValidators.maxLength(70),
  //                 ]),
  //                 keyboardType: TextInputType.name,
  //                 textInputAction: TextInputAction.next,
  //               ),
  //             ),
  //           ),
  //           const SizedBox(width: 8),
  //           Expanded(
  //             child: padLeft(
  //               FormBuilderTextField(
  //                 autovalidateMode: AutovalidateMode.always,
  //                 name: '${AddListItemValues.categoryValues}-${categoryMap.$1}',
  //                 decoration: InputDecoration(
  //                   labelText: 'Value(s):',
  //                   suffixIcon: _nameHasError
  //                       ? const Icon(Icons.error, color: Colors.red)
  //                       : const Icon(Icons.check, color: Colors.green),
  //                 ),
  //                 onChanged: (val) {
  //                   setState(() {
  //                     _categoryValueHasError[categoryMap.$1] = !(_formKey
  //                             .currentState
  //                             ?.fields[
  //                                 AddListItemValues.categoryValues.toString()]
  //                             ?.validate() ??
  //                         false);
  //                   });
  //                 },
  //                 validator: FormBuilderValidators.compose([
  //                   FormBuilderValidators.required(),
  //                   FormBuilderValidators.max(150),
  //                 ]),
  //                 keyboardType: TextInputType.name,
  //                 textInputAction: TextInputAction.next,
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //   ];
  // }

  void save(String actualListId, Map<String, dynamic> values) {
    // final values = <String, dynamic>{};
    // for (final entry in currentState!.fields.entries) {
    //   values[entry.key] = entry.value.value;
    // }

    // final latLongString =
    //     values[AddListItemValues.latlong.toString()] as String?;
    // final latLongParts = latLongString?.split(',');
    // final lat =
    //     latLongParts == null ? null : double.parse(latLongParts.first.trim());
    // final lng =
    //     latLongParts == null ? null : double.parse(latLongParts.last.trim());

    // final categories = widget.getCategories(values);

    // // logger.d('values: $values');
    // final listItem = ListItem(
    //   id: listItemId,
    //   name: values[AddListItemValues.name.toString()]! as String,
    //   info: values[AddListItemValues.info.toString()] as String?,
    //   urls: values.entries
    //       .where(
    //         (element) =>
    //             element.key.startsWith(AddListItemValues.urls.toString()),
    //       )
    //       .map((entry) => entry.value as String)
    //       .toList(),
    //   datetime: values[AddListItemValues.date.toString()] as DateTime?,
    //   latLong: lat != null ? LatLong(lat: lat, lng: lng!) : null,
    //   address: values[AddListItemValues.address.toString()] as String?,
    //   categories: categories,
    // );

    // if (listItemId == null) {
    //   BlocProvider.of<ListItemCrudBloc>(context)
    //       .add(AddListItem(actualListId, listItem));
    // } else {
    //   BlocProvider.of<ListItemCrudBloc>(context)
    //       .add(UpdateListItem(actualListId, listItem));
    // }
  }

  ListItem? getMaybeListItem(ListItemLoadState listItemState) {
    if (listItemId != null) {
      if (listItemState is ListItemLoadLoaded) {
        return listItemState.listItem;
      }
    }
    return null;
  }

  void listItemChangedListener(GoRouter goRouter, ListItemCrudState state) {
    logger.i('$className => state: $state');
    if (state is ListItemCrudDeleted) {
      setState(() {
        listItemId = null;
      });
      logger.i('$className -> popping twice');
      goRouter
        ..pop()
        ..pop();
    } else if (state is ListItemCrudUpdated) {
      logger
        ..i('$className => popping GoRouter after updated')
        ..i('$className -> popping twice');
      goRouter
        ..pop()
        ..pop();
    } else if (state is ListItemCrudAdded) {
      logger
        ..i('$className => popping GoRouter after added')
        ..i('$className -> popping once');
      goRouter.pop();
    }
  }

  FormInputFieldInfo nameInputField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.name.value,
      label: 'Item name',
      currentValue: listItem?.name ?? '',
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      sectionName: SectionName.mainInfo.value,
      hasError: false,
    );
  }

  FormInputFieldInfo extraInfoField() {
    return FormInputFieldInfo.textArea(
      // TODO: Multiline field
      // minLines: 3,
      // maxLines: 6,
      // keyboardType: TextInputType.multiline,
      // textInputAction: TextInputAction.newline,
      id: FieldId.info.value,
      label: 'Extra info',
      currentValue: listItem?.info ?? '',
      validators: [
        FormBuilderValidators.maxLength(1200, checkNullOrEmpty: false),
      ],
      sectionName: SectionName.mainInfo.value,
      hasError: false,
    );
  }

  List<FormInputFieldInfo> categoryFields() {
    if (categories == null) {
      setState(() {
        categories = [];
        final keys = listItem?.categories.keys ?? [];
        for (final key in keys) {
          categories!
              .add(MapEntry(key, listItem?.categories[key]?.join(',') ?? ''));
        }
      });
    }

    return [
      for (final ik in mapIndexed(categories!))
        categoryField(ik.$1, ik.$2.key, ik.$2.value),
    ];
  }

  FormInputFieldInfo categoryField(int index, String left, String right) {
    return FormInputFieldInfo.twoAutoCompleteFields(
      idLeft: '${FieldId.categories.value}-left-$index',
      idRight: '${FieldId.categories.value}-right-$index',
      sectionName: SectionName.categories.value,
      labelLeft: 'Left',
      labelRight: 'Right',
      currentValueLeft: left,
      currentValueRight: right,
      optionsLeft: categoriesForList.keys.toList(),
      optionsRight: categoriesForList,
      validatorsLeft: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(40, checkNullOrEmpty: false),
      ],
      validatorsRight: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(200, checkNullOrEmpty: false),
      ],
      hasErrorleft: false,
      hasErrorRight: false,
      deletable: true,
      onDelete: () {
        print('deleted category');
      },
    );
  }

  FormInputFieldInfo addCategoryButton() {
    return FormInputFieldInfo.customButton(
      id: FieldId.addCategory.value,
      label: 'Add category',
      sectionName: SectionName.categories.value,
      callback: () {
        print('adding category');
        setState(() {
          final cs = List<MapEntry<String, String>>.from(categories!);
          categories = cs..add(const MapEntry('', ''));
        });
      },
    );
  }

  List<FormInputFieldInfo> urlFields() {
    final keys = urls ?? listItem?.urls ?? [];
    final tmp = mapIndexed(keys).toList();

    return [
      for (final ik in tmp) urlField(ik.$1, ik.$2),
    ];
  }

  FormInputFieldInfo urlField(int index, String url) {
    return FormInputFieldInfo.textArea(
      id: '${FieldId.urls.value}-$index',
      label: 'Url',
      currentValue: url,
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(200, checkNullOrEmpty: false),
      ],
      sectionName: SectionName.urls.value,
      hasError: false,
      deletable: true,
      onDelete: () {
        print('deleted url');
      },
    );
  }

  FormInputFieldInfo addUrlButton() {
    return FormInputFieldInfo.customButton(
      id: FieldId.addUrl.value,
      label: 'Add url',
      sectionName: SectionName.urls.value,
      callback: () {
        print('adding url');
        setState(() {
          if (urls == null) {
            if (listItem?.urls != null) {
              urls = listItem!.urls;
            } else {
              urls = [];
            }
          }
          urls = List<String>.from(urls!)..add('');
        });
      },
    );
  }

  FormInputFieldInfo dateInputField() {
    return FormInputFieldInfo.date(
      id: FieldId.date.value,
      label: 'Date',
      currentValue: listItem?.datetime?.toIso8601String() ??
          DateTime.now().toIso8601String(),
      validators: [
        FormBuilderValidators.required(),
      ],
      sectionName: SectionName.date.value,
      hasError: false,
    );
  }

  FormInputFieldInfo searchLocationButton() {
    return FormInputFieldInfo.customButton(
      id: 'searchButton', // TODO: Handled this?
      label: 'Search for a location',
      sectionName: SectionName.location.value,
      callback: () {
        print('searching for a location');
      },
    );
  }

  FormInputFieldInfo addressField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.address.value,
      label: 'Address',
      currentValue: listItem?.address ?? '', // TODO
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      sectionName: SectionName.location.value,
      hasError: false,
    );
  }

  FormInputFieldInfo latLongField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.latlong.value,
      label: 'LatLong',
      currentValue: listItem?.latLong != null
          ? '${listItem?.latLong?.lat}, ${listItem?.latLong?.lng}'
          : '',
      validators: [
        FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(70),
      ],
      sectionName: SectionName.location.value,
      hasError: false,
    );
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

  FormInputFieldInfo submitButton() {
    return FormInputFieldInfo.submitButton(
      id: FieldId.submit.value,
      label: 'Submit',
      sectionName: SectionName.submit.value,
      save: (Map<String, dynamic>? values) {
        print('save');
        print(values);
        if (values == null) {
          print('No values to save');
          return;
        }
        save('asd', values); // TODO
      },
    );
  }

  List<FormInputSection> getSections() {
    return [
      FormInputSection(
        name: SectionName.mainInfo.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.categories.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.urls.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.date.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.location.value,
        direction: x_stack.AxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.submit.value,
        direction: x_stack.AxisDirection.horizontal,
        showBorder: false,
      ),
    ];
  }

  List<String> getValuesForCategory(String t) {
    print('getValuesForCategory($t)');
    final values = categoriesForList[t]?.toList() ?? [];
    print('values: $values');
    return values;
  }
}
