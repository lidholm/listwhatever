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
    if (urls == null) {
      setState(() {
        urls = listItem?.urls ?? [];
      });
    }
    final tmp = mapIndexed(urls!).toList();

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
