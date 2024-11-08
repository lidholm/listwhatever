import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/geocoder/latlong.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/search_location_page_route.dart';
import 'package:listwhatever/custom/pages/listItems/searchLocation/search_location_response.dart';
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

  Map<String, List<String>> getCategories(Map<String, dynamic> values) {
    final categoriesZip = IterableZip([
      values.entries
          .where(
            (element) =>
                element.key.startsWith('${FieldId.categories.name}-left-'),
          )
          .toList(),
      values.entries
          .where(
            (element) =>
                element.key.startsWith('${FieldId.categories.name}-right-'),
          )
          .toList(),
    ]);
    final categories = <String, List<String>>{};
    for (final e in categoriesZip) {
      final category = e[0].value as String;
      final values =
          (e[1].value as String).split(',').map((t) => t.trim()).toList();
      categories[category] = values;
    }
    return categories;
  }
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

  Map<String, String>? urls;
  Map<String, (String, String)>? categories;

  @override
  void initState() {
    BlocProvider.of<ListLoadBloc>(context).add(LoadList(widget.actualListId));
    BlocProvider.of<CategoriesForListBloc>(context)
        .add(LoadCategoriesForList(widget.actualListId));
    listItemId = widget.listItemId;
    if (listItemId != null) {
      BlocProvider.of<ListItemLoadBloc>(context)
          .add(LoadListItem(widget.actualListId, listItemId!));
      BlocProvider.of<CategoriesForListBloc>(context)
          .add(LoadCategoriesForList(widget.actualListId));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //

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
      if (list!.withDates) dateInputField(),
      if (list!.withMap) ...[
        searchLocationButton(),
        addressField(),
        latLongField(),
      ],
      cancelButton(),
      submitButton(),
    ];

    final sections = getSections();

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: fields,
      isLoading: false, // TODO: Update
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
              title: AppLocalizations.of(context).deleteListItem,
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
    if (categoriesForListState is CategoriesForListError) {
      return Text('Error: ${categoriesForListState.errorMessage}');
    }
    if (categoriesForListState is! CategoriesForListLoaded) {
      return Text(
        'categoriesForListState is! CategoriesForListLoaded: $categoriesForListState',
      );
    }
    return null;
  }

  void save(Map<String, dynamic> values) {
    final latLongString = values[FieldId.latlong.name] as String?;
    final latLongParts =
        (latLongString?.isEmpty ?? true) ? null : latLongString?.split(',');
    final lat =
        latLongParts == null ? null : double.parse(latLongParts.first.trim());
    final lng =
        latLongParts == null ? null : double.parse(latLongParts.last.trim());
    final categories = widget.getCategories(values);

    final listItem = ListItem(
      id: listItemId,
      name: values[FieldId.name.name]! as String,
      info: values[FieldId.info.name] as String?,
      urls: values.entries
          .where(
            (element) => element.key.startsWith(FieldId.urls.name),
          )
          .map((entry) => entry.value as String)
          .toList(),
      datetime: values[FieldId.date.name] as DateTime?,
      latLong: lat != null ? LatLong(lat: lat, lng: lng!) : null,
      address: values[FieldId.address.name] as String?,
      categories: categories,
    );

    if (listItemId == null) {
      BlocProvider.of<ListItemCrudBloc>(context)
          .add(AddListItem(list!.id!, listItem));
    } else {
      BlocProvider.of<ListItemCrudBloc>(context)
          .add(UpdateListItem(list!.id!, listItem));
    }
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
    if (state is ListItemCrudDeleted) {
      setState(() {
        listItemId = null;
      });

      goRouter
        ..pop()
        ..pop();
    } else if (state is ListItemCrudUpdated) {
      goRouter
        ..pop()
        ..pop();
    } else if (state is ListItemCrudAdded) {
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
    );
  }

  List<FormInputFieldInfo> categoryFields() {
    if (categories == null) {
      setState(() {
        categories = {};
        final keys = listItem?.categories.keys ?? [];
        for (final key in keys) {
          final indexKey = getRandomString(3);
          categories![indexKey] =
              (key, listItem?.categories[key]?.join(',') ?? '');
        }
      });
    }

    return [
      for (final ik in categories!.entries)
        categoryField(ik.key, ik.value.$1, ik.value.$2),
    ];
  }

  FormInputFieldInfo categoryField(String indexKey, String left, String right) {
    return FormInputFieldInfo.twoAutoCompleteFields(
      id: getCategoryId(Side.left, indexKey),
      id2: getCategoryId(Side.right, indexKey),
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
      deletable: true,
      onDelete: () {
        setState(() {
          categories!.remove(indexKey);
        });
        _formKey.currentState?.value[getCategoryId(Side.left, indexKey)] = null;
        _formKey.currentState?.value[getCategoryId(Side.right, indexKey)] =
            null;
      },
    );
  }

  String getCategoryId(Side side, String indexKey) {
    return '${FieldId.categories.value}-${side.name}-$indexKey';
  }

  FormInputFieldInfo addCategoryButton() {
    return FormInputFieldInfo.customButton(
      id: FieldId.addCategory.value,
      label: 'Add category',
      sectionName: SectionName.categories.value,
      callback: () {
        setState(() {
          final indexKey = getRandomString(3);
          categories![indexKey] = ('', '');
        });
      },
    );
  }

  List<FormInputFieldInfo> urlFields() {
    if (urls == null) {
      setState(() {
        urls = {};
        for (final url in listItem?.urls ?? <String>[]) {
          final indexKey = getRandomString(3);
          urls![indexKey] = url;
        }
      });
    }

    return [
      for (final ik in urls!.entries) urlField(ik.key, ik.value),
    ];
  }

  FormInputFieldInfo urlField(String indexKey, String url) {
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
        setState(() {
          urls!.remove(indexKey);
        });
        _formKey.currentState?.value[getUrlId(indexKey)] = null;
      },
    );
  }

  String getUrlId(String indexKey) {
    return '${FieldId.urls.value}-$indexKey';
  }

  FormInputFieldInfo addUrlButton() {
    return FormInputFieldInfo.customButton(
      id: FieldId.addUrl.value,
      label: 'Add url',
      sectionName: SectionName.urls.value,
      callback: () {
        setState(() {
          final indexKey = getRandomString(3);
          urls![indexKey] = '';
        });
      },
    );
  }

  FormInputFieldInfo dateInputField() {
    return FormInputFieldInfo.date(
      id: FieldId.date.value,
      label: 'Date',
      currentValue: listItem?.datetime ?? DateTime.now(),
      inputType: (list?.withTimes ?? false) ? InputType.both : InputType.date,
      sectionName: SectionName.date.value,
    );
  }

  FormInputFieldInfo searchLocationButton() {
    return FormInputFieldInfo.customButton(
      id: 'searchButton',
      label: 'Search for a location',
      sectionName: SectionName.location.value,
      callback: () async {
        final locationResponse = await const SearchLocationPageRoute()
            .push<SearchLocationResponse>(context);

        final latlong =
            (locationResponse?.lat != null && locationResponse?.long != null)
                ? '${locationResponse?.lat}, ${locationResponse?.long}'
                : '0.0, 0.0';

        _formKey.currentState?.patchValue({
          FieldId.address.name: locationResponse?.address ?? '',
          FieldId.latlong.name: latlong,
          FieldId.searchPhrase.name: locationResponse?.searchPhrase ?? '',
        });
      },
    );
  }

  FormInputFieldInfo addressField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.address.value,
      label: 'Address',
      currentValue: listItem?.address ?? '', // TODO
      validators: [
        FormBuilderValidators.maxLength(150, checkNullOrEmpty: false),
      ],
      sectionName: SectionName.location.value,
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
        FormBuilderValidators.maxLength(70, checkNullOrEmpty: false),
        validLatLong,
      ],
      sectionName: SectionName.location.value,
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

  FormInputFieldInfo cancelButton() {
    return FormInputFieldInfo.cancelButton(
      id: FieldId.cancel.value,
      label: 'Cancel',
      sectionName: SectionName.submit.value,
      cancel: () {
        print('cancelled. THIS SHOULD DO SOMETHING');
      },
    );
  }

  FormInputFieldInfo submitButton() {
    return FormInputFieldInfo.submitButton(
      id: FieldId.submit.value,
      label: 'Submit',
      sectionName: SectionName.submit.value,
      save: (Map<String, dynamic>? values) {
        if (values == null) {
          return;
        }
        save(values);
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
      if (list!.withDates)
        FormInputSection(
          name: SectionName.date.value,
          direction: x_stack.AxisDirection.vertical,
          showBorder: true,
        ),
      if (list!.withMap)
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
    final values = categoriesForList[t]?.toList() ?? [];
    return values;
  }
}
