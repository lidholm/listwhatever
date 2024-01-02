import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import '/custom/firestore/listItems/list_item.dart';
import '/custom/firestore/listItems/list_item_events/list_item_bloc.dart';
import '/custom/firestore/listItems/list_item_events/list_item_event.dart';
import '/custom/firestore/listItems/list_item_events/list_item_state.dart';
import '/custom/firestore/listItems/list_items.dart';
import '/custom/firestore/listItems/list_or_list_item_not_loaded_handler.dart';
import '/custom/firestore/lists/lists.dart';
import '/custom/navigation/routes.dart';
import '/custom/pages/listItems/list_items.dart';
import '/custom/pages/listItems/searchLocation/geocoder/latlong.dart';
import '/custom/pages/listItems/searchLocation/search_location_page_route.dart';
import '/custom/pages/listItems/searchLocation/search_location_response.dart';
import '/l10n/l10n.dart';
import '/standard/constants.dart';
import '/standard/navigation/redirect_cubit.dart';
import '/standard/widgets/appBar/app_bar_action.dart';
import '/standard/widgets/appBar/app_bar_action_icon.dart';
import '/standard/widgets/appBar/common_app_bar.dart';
import '/standard/widgets/vStack/v_stack.dart';

enum AddListItemValues {
  name,
  info,
  categoryKeys,
  categoryValues,
  date,
  urls,
  address,
  latlong,
  searchPhrase,
}

class AddListItemPage extends StatefulWidget {
  const AddListItemPage({required this.listId, this.listItemId, super.key});
  final String listId;
  final String? listItemId;

  @override
  State<AddListItemPage> createState() => _AddListItemPageState();

  Map<String, List<String>> getCategories(Map<String, dynamic> values) {
    final categoriesZip = IterableZip([
      values.entries.where((element) => element.key.startsWith(AddListItemValues.categoryKeys.toString())).toList(),
      values.entries.where((element) => element.key.startsWith(AddListItemValues.categoryValues.toString())).toList(),
    ]);
    final categories = <String, List<String>>{};
    for (final e in categoriesZip) {
      final category = e[0].value as String;
      final values = (e[1].value as String).split(',').map((t) => t.trim()).toList();
      categories[category] = values;
    }
    return categories;
  }
}

class _AddListItemPageState extends State<AddListItemPage> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;
  bool _infoHasError = false;
  bool _addressHasError = false;
  bool _latLongHasError = false;
  List<String> urls = [];
  List<String> categoryKeys = [];
  List<String> categoryValues = [];
  List<bool> _categoryHasError = [];
  List<bool> _categoryValueHasError = [];

  ListOfThings? list;
  ListItem? listItem;

  @override
  void initState() {
    BlocProvider.of<ListBloc>(context).add(LoadList(widget.listId));
    if (widget.listItemId != null) {
      BlocProvider.of<ListItemBloc>(context).add(LoadListItem(widget.listId, widget.listItemId!));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listState = context.watch<ListBloc>().state;
    final listStateView = ListOrListItemNotLoadedHandler.handleListState(listState);
    if (listStateView != null) {
      return listStateView;
    }
    list = (listState as ListLoaded).list;

    final listItemState = context.watch<ListItemBloc>().state;
    final listItemStateView = ListOrListItemNotLoadedHandler.handleListItemState(listItemState);
    if (listItemStateView != null) {
      return listItemStateView;
    }
    listItem = (listItemState as ListItemLoaded).listItem;

    return Scaffold(
      appBar: CommonAppBar(
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
                  context.read<ListItemBloc>().add(DeleteListItem(widget.listId, listItem!.id!));
                  context.read<RedirectCubit>().setRedirect(ListItemsPageRoute(listId: widget.listId).location);
                },
              ),
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: createForm(
            list,
            listItem,
            [
              createNameField(),
              createInfoField(),
              ...createCategoryFields(),
              createDivider(),
              ...createUrlFields(),
              if (list?.withDates ?? false) createDateField(list),
              if (list?.withMap ?? false) ...[
                createDivider(),
                createSearchLocationButton(context),
                createAddressField(),
                createLatLongFields(),
              ],
              const SizedBox(height: 40),
              Row(
                children: <Widget>[
                  createResetButton(context),
                  const SizedBox(width: 20),
                  createSaveButton(list),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  FormBuilder createForm(ListOfThings? list, ListItem? listItem, List<Widget> children) {
    final initialValue = {
      AddListItemValues.name.toString(): listItem?.name,
      AddListItemValues.info.toString(): listItem?.info,
      AddListItemValues.date.toString():
          listItem?.datetime ?? DateTime.now().copyWith(hour: (list?.withTimes ?? false) ? 8 : 0, minute: 0, second: 0),
      AddListItemValues.address.toString(): listItem?.address,
      AddListItemValues.latlong.toString():
          (listItem != null && listItem.latLong != null) ? '${listItem.latLong!.lat}, ${listItem.latLong!.lng}' : null,
      ...getCategoryKeysMap(listItem),
      ...getCategoryValuesMap(listItem),
      ...getUrlsMap(listItem),
    };
    return FormBuilder(
      key: _formKey,
      onChanged: () {
        _formKey.currentState!.save();
        // logger.d(_formKey.currentState!.value.toString());
      },
      autovalidateMode: AutovalidateMode.disabled,
      initialValue: initialValue,
      skipDisabled: true,
      child: VStack(children: children),
    );
  }

  Map<String, dynamic> getCategoryKeysMap(ListItem? listItem) {
    if (listItem == null) {
      return {};
    }
    final values = <String, dynamic>{};
    for (final entry in mapIndexed(listItem.categories.entries)) {
      final index = entry.$1;
      final key = '${AddListItemValues.categoryKeys}-$index';
      final value = entry.$2.key;
      values[key] = value;
    }
    return values;
  }

  Map<String, dynamic> getCategoryValuesMap(ListItem? listItem) {
    if (listItem == null) {
      return {};
    }
    final values = <String, dynamic>{};
    for (final entry in mapIndexed(listItem.categories.entries)) {
      final index = entry.$1;
      final key = '${AddListItemValues.categoryValues}-$index';
      final value = entry.$2.value.join(', ');
      values[key] = value;
    }
    return values;
  }

  Map<String, dynamic> getUrlsMap(ListItem? listItem) {
    if (listItem == null) {
      return {};
    }
    final values = <String, dynamic>{};
    for (final entry in mapIndexed(listItem.urls)) {
      final index = entry.$1;
      final key = '${AddListItemValues.urls}-$index';
      final value = entry.$2;
      values[key] = value;
    }
    return values;
  }

  Expanded createSaveButton(ListOfThings? list) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.saveAndValidate() ?? false) {
            // logger.d(_formKey.currentState?.value.toString());
            save(list!.id!, _formKey.currentState);
          } else {
            logger
              ..d(_formKey.currentState?.value.toString())
              ..d('validation failed');
          }
        },
        child: const Text(
          'Save',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Expanded createResetButton(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          _formKey.currentState?.reset();
        },
        child: Text(
          'Reset',
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }

  FormBuilderTextField createLatLongFields() {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: AddListItemValues.latlong.toString(),
      decoration: InputDecoration(
        labelText: 'LatLong (e.g. 12.3, -23.4)',
        suffixIcon: _latLongHasError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        setState(() {
          _latLongHasError =
              !(_formKey.currentState?.fields[AddListItemValues.latlong.toString()]?.validate() ?? false);
        });
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.max(40),
        FormBuilderValidators.match(
          r'\d*(\.\d*)?,\s*-?\d*(\.\d*)',
          errorText: "Doesn't match 12.3, 3.45",
        ),
      ]),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
    );
  }

  FormBuilderTextField createAddressField() {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: AddListItemValues.address.toString(),
      minLines: 1,
      maxLines: 3,
      decoration: InputDecoration(
        labelText: 'Address',
        suffixIcon: _addressHasError
            ? const Icon(Icons.error, color: Colors.red)
            : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        setState(() {
          _addressHasError =
              !(_formKey.currentState?.fields[AddListItemValues.address.toString()]?.validate() ?? false);
        });
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.max(200),
      ]),
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
    );
  }

  ElevatedButton createSearchLocationButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final response = await const SearchLocationPageRoute().push<SearchLocationResponse>(context);
        if (response == null) {
          return;
        }
        _formKey.currentState?.patchValue({
          AddListItemValues.address.toString(): response.address,
          AddListItemValues.latlong.toString(): '${response.lat}, ${response.long}',
        });
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Text(context.l10n.searchForLocationButton),
      ),
    );
  }

  FormBuilderDateTimePicker createDateField(ListOfThings? list) {
    return FormBuilderDateTimePicker(
      name: AddListItemValues.date.toString(),
      inputType: list!.withTimes ? InputType.both : InputType.date,
      decoration: InputDecoration(
        labelText: list.withTimes ? 'Date and time' : 'Date',
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _formKey.currentState!.fields['date']?.didChange(null);
          },
        ),
      ),
    );
  }

  Divider createDivider() {
    return const Divider(
      height: 20,
      thickness: 5,
      indent: 20,
      endIndent: 0,
      color: Colors.black,
    );
  }

  List<Widget> createUrlFields() {
    return [
      for (final urlMap in mapIndexed(urls))
        FormBuilderTextField(
          autovalidateMode: AutovalidateMode.always,
          name: '${AddListItemValues.urls}-${[urlMap.$1]}',
          decoration: InputDecoration(
            labelText: 'URL',
            suffixIcon: _infoHasError
                ? const Icon(Icons.error, color: Colors.red)
                : const Icon(Icons.check, color: Colors.green),
          ),
          onChanged: (val) {
            setState(() {
              _infoHasError = !(_formKey.currentState?.fields[AddListItemValues.info.toString()]?.validate() ?? false);
            });
          },
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.max(1200),
          ]),
          keyboardType: TextInputType.url,
          textInputAction: TextInputAction.next,
        ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            urls = [...urls, ''];
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(context.l10n.addUrlButton),
        ),
      ),
    ];
  }

  List<Widget> createCategoryFields() {
    return [
      for (final categoryMap in mapIndexed(categoryKeys))
        Row(
          children: [
            Expanded(
              child: FormBuilderTextField(
                autovalidateMode: AutovalidateMode.always,
                name: '${AddListItemValues.categoryKeys}-${categoryMap.$1}',
                decoration: InputDecoration(
                  labelText: 'Category',
                  suffixIcon: _nameHasError
                      ? const Icon(Icons.error, color: Colors.red)
                      : const Icon(Icons.check, color: Colors.green),
                ),
                onChanged: (val) {
                  setState(() {
                    _categoryHasError[categoryMap.$1] =
                        !(_formKey.currentState?.fields[AddListItemValues.categoryKeys.toString()]?.validate() ??
                            false);
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.max(70),
                ]),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: FormBuilderTextField(
                autovalidateMode: AutovalidateMode.always,
                name: '${AddListItemValues.categoryValues}-${categoryMap.$1}',
                decoration: InputDecoration(
                  labelText: 'Value(s):',
                  suffixIcon: _nameHasError
                      ? const Icon(Icons.error, color: Colors.red)
                      : const Icon(Icons.check, color: Colors.green),
                ),
                onChanged: (val) {
                  setState(() {
                    _categoryValueHasError[categoryMap.$1] =
                        !(_formKey.currentState?.fields[AddListItemValues.categoryValues.toString()]?.validate() ??
                            false);
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.max(150),
                ]),
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
            ),
          ],
        ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            categoryKeys = [...categoryKeys, ''];
            categoryValues = [...categoryValues, ''];
            _categoryHasError = [..._categoryHasError, false];
            _categoryValueHasError = [..._categoryValueHasError, false];
          });
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(context.l10n.addCategoryButton),
        ),
      ),
    ];
  }

  FormBuilderTextField createInfoField() {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      minLines: 3,
      maxLines: 6,
      name: AddListItemValues.info.toString(),
      decoration: InputDecoration(
        labelText: 'Extra info',
        suffixIcon:
            _infoHasError ? const Icon(Icons.error, color: Colors.red) : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        setState(() {
          _infoHasError = !(_formKey.currentState?.fields[AddListItemValues.info.toString()]?.validate() ?? false);
        });
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.max(1200),
      ]),
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
    );
  }

  FormBuilderTextField createNameField() {
    return FormBuilderTextField(
      autovalidateMode: AutovalidateMode.always,
      name: AddListItemValues.name.toString(),
      decoration: InputDecoration(
        labelText: 'Item name',
        suffixIcon:
            _nameHasError ? const Icon(Icons.error, color: Colors.red) : const Icon(Icons.check, color: Colors.green),
      ),
      onChanged: (val) {
        setState(() {
          _nameHasError = !(_formKey.currentState?.fields[AddListItemValues.name.toString()]?.validate() ?? false);
        });
      },
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.max(70),
      ]),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  void save(String listId, FormBuilderState? currentState) {
    final values = <String, dynamic>{};
    for (final entry in currentState!.fields.entries) {
      values[entry.key] = entry.value.value;
    }

    final latLongString = values[AddListItemValues.latlong.toString()] as String?;
    final latLongParts = latLongString?.split(',');
    final lat = latLongParts == null ? null : double.parse(latLongParts.first.trim());
    final lng = latLongParts == null ? null : double.parse(latLongParts.last.trim());

    final categories = widget.getCategories(values);

    // logger.d('values: $values');
    final listItem = ListItem(
      id: widget.listItemId,
      name: values[AddListItemValues.name.toString()]! as String,
      info: values[AddListItemValues.info.toString()] as String?,
      urls: values.entries
          .where(
            (element) => element.key.startsWith(AddListItemValues.urls.toString()),
          )
          .map((entry) => entry.value as String)
          .toList(),
      datetime: values[AddListItemValues.date.toString()] as DateTime?,
      latLong: lat != null ? LatLong(lat: lat, lng: lng!) : null,
      address: values[AddListItemValues.address.toString()] as String?,
      categories: categories,
    );

    if (widget.listItemId == null) {
      BlocProvider.of<ListItemsBloc>(context).add(AddListItem(listId, listItem));
    } else {
      BlocProvider.of<ListItemBloc>(context).add(UpdateListItem(listId, listItem));
    }
    GoRouter.of(context).pop();
  }
}
