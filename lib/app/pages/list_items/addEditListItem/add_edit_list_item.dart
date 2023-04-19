import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/geocoder/geocoderresult.dart';
import 'package:listanything/app/geocoder/latlong.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/navigation/routes/routes.dart';
import 'package:listanything/app/navigation/routes/search_location_for_edit_page_route.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_item_provider.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/lists_provider.dart';
import 'package:listanything/app/pages/map/searchLocation/selected_address_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';
import 'package:listanything/app/widgets/standardWidgets/double_async_value_widget.dart';
import 'package:tuple/tuple.dart';

class AddEditListItem extends ConsumerWidget {
  const AddEditListItem({super.key, required this.publicListId, required this.listItemId});
  final String publicListId;
  final String? listItemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAddress = ref.watch(selectedAddressProvider);
    if (listItemId == null) {
      return AsyncValueWidget<ListOfThings?>(
        value: ref.watch(listProvider(publicListId)),
        data: (list) => AddEditListItemInner(listItem: null, list: list, selectedAddress: selectedAddress),
      );
    }
    return DoubleAsyncValueWidget<ListItem?, ListOfThings?>(
      firstValue: ref.watch(listItemProvider(Tuple2(publicListId, listItemId!))),
      secondValue: ref.watch(listProvider(publicListId)),
      data: (listItem, list) => AddEditListItemInner(listItem: listItem, list: list, selectedAddress: selectedAddress),
    );
  }
}

class AddEditListItemInner extends ConsumerStatefulWidget {
  const AddEditListItemInner({Key? key, required this.listItem, required this.list, this.selectedAddress})
      : super(key: key);
  final ListItem? listItem;
  final ListOfThings? list;
  final GeocoderResult? selectedAddress;

  @override
  ConsumerState<AddEditListItemInner> createState() {
    return _AddEditListItemInnerState();
  }
}

const nameFieldName = 'name';
const urlsFieldName = 'urls';
const infoFieldName = 'info';
const dateTimeField = 'date';
const addressFieldName = 'address';
const latFieldName = 'lat';
const longFieldName = 'long';

class _AddEditListItemInnerState extends ConsumerState<AddEditListItemInner> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = false;
  bool _infoHasError = false;
  List<bool> _urlHasError = [];
  List<bool> _categoryNameHasError = [];
  List<bool> _categoryValuesHasError = [];
  bool _addressHasError = false;
  bool _latHasError = false;
  bool _longHasError = false;
  List<String> urlInitialValue = List.generate(100, (index) => 'http://');
  Map<String, dynamic> initialValue = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    _categoryNameHasError = List.generate(widget.listItem?.categories.length ?? 0, (index) => false);
    _categoryValuesHasError = List.generate(widget.listItem?.categories.length ?? 0, (index) => false);
    _nameHasError = widget.listItem == null;

    initialValue = widget.listItem != null
        ? <String, dynamic>{
            // TODO: Set name from selectedAddress if value is not already set
            nameFieldName: widget.listItem!.name,
            urlsFieldName: widget.listItem!.urls,
            infoFieldName: widget.listItem!.info,
            dateTimeField: widget.listItem!.datetime,
            addressFieldName: widget.selectedAddress?.formattedAddress ?? widget.listItem!.address,
            latFieldName: '${widget.selectedAddress?.geometry.location.lat ?? widget.listItem!.latLong?.lat ?? ''}',
            longFieldName: '${widget.selectedAddress?.geometry.location.lng ?? widget.listItem!.latLong?.lng ?? ''}',
          }
        : <String, dynamic>{
            nameFieldName: '',
            urlsFieldName: '',
            infoFieldName: '',
            dateTimeField: getCurrentDate(),
            addressFieldName: widget.selectedAddress?.formattedAddress ?? '',
            latFieldName: '${widget.selectedAddress?.geometry.location.lat ?? ''}',
            longFieldName: '${widget.selectedAddress?.geometry.location.lng ?? ''}',
          };

    if (widget.listItem != null) {
      mapIndexed(widget.listItem?.categories.entries ?? <MapEntry<String, List<String>>>[]).forEach((e) {
        final index = e.key;
        final key = e.value.key;
        final values = e.value.value;
        initialValue['categoryName-$index'] = key;
        initialValue['categoryValues-$index'] = values.join(', ');
      });
    }
    mapIndexed(widget.listItem?.urls ?? <String>[]).forEach((e) {
      final index = e.key;
      final url = e.value;
      urlInitialValue[index] = url;
    });

    _urlHasError = List<bool>.generate(widget.listItem?.urls.length ?? 0, (index) => true);
  }

  @override
  Widget build(BuildContext context) {
    final urlIndices = List.generate(max(widget.listItem?.urls.length ?? 0, _urlHasError.length), (i) => i);
    final categoryIndices =
        List.generate(max(widget.listItem?.categories.length ?? 0, _categoryNameHasError.length), (i) => i);

    return CommonScaffold(
      title: widget.listItem?.id != null ? 'Edit List Item' : 'Add List Item',
      actions: [
        if (widget.list?.id != null)
          AppBarAction(
            title: 'Delete list',
            icon: Icons.delete,
            callback: () => deleteListItem(ref, GoRouter.of(context), widget.list!.publicListId!, widget.listItem!.id!),
            overflow: false,
          ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                onChanged: () {
                  _formKey.currentState!.save();
                  debugPrint(_formKey.currentState!.value.toString());
                },
                autovalidateMode: AutovalidateMode.disabled,
                skipDisabled: true,
                initialValue: initialValue,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: nameFieldName,
                      decoration: InputDecoration(
                        labelText: 'Item name',
                        hintText: 'Required item name',
                        suffixIcon: _nameHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ).applyDefaults(Theme.of(context).inputDecorationTheme),
                      onChanged: (val) {
                        setState(() {
                          _nameHasError = !(_formKey.currentState?.fields[nameFieldName]?.validate() ?? false);
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(50),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 16),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: infoFieldName,
                      minLines: 3,
                      maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Extra info',
                        hintText: 'Optional extra info',
                        suffixIcon: _infoHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ).applyDefaults(Theme.of(context).inputDecorationTheme),
                      onChanged: (val) {
                        setState(() {
                          _infoHasError = !(_formKey.currentState?.fields[infoFieldName]?.validate() ?? false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.maxLength(1000),
                        ],
                      ),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.newline,
                    ),
                    const SizedBox(height: 32),
                    const Text('URLs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ...urlIndices.expand(
                      (urlIndex) {
                        return [
                          FormBuilderTextField(
                            autovalidateMode: AutovalidateMode.always,
                            name: 'url-$urlIndex',
                            initialValue: urlInitialValue[urlIndex],
                            decoration: InputDecoration(
                              labelText: 'URL',
                              suffixIcon: _urlHasError[urlIndex]
                                  ? const Icon(Icons.error, color: Colors.red)
                                  : const Icon(Icons.check, color: Colors.green),
                            ),
                            onChanged: (val) {
                              setState(() {
                                _urlHasError[urlIndex] =
                                    !(_formKey.currentState?.fields['url-$urlIndex']?.validate() ?? false);
                              });
                            },
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.maxLength(200),
                            ]),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                          const SizedBox(height: 16),
                        ];
                      },
                    ).toList(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _urlHasError = [..._urlHasError, true];
                        });
                      },
                      child: const Text('Add new URL'),
                    ),
                    if (widget.list?.withDates ?? false) ...[
                      const SizedBox(height: 32),
                      FormBuilderDateTimePicker(
                        name: dateTimeField,
                        inputType: widget.list!.withTimes ? InputType.both : InputType.date,
                        format: dateTimeFormatter,
                        decoration: InputDecoration(
                          labelText: widget.list!.withTimes ? 'Date and Time' : 'Date',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              _formKey.currentState!.fields[dateTimeField]?.didChange(null);
                            },
                          ),
                        ),
                      ),
                    ],
                    if (widget.list?.withMap ?? false) ...[
                      const SizedBox(height: 32),
                      SizedBox(
                        height: 48,
                        child: Stack(
                          children: [
                            const Center(
                              child: Text(
                                'Address information',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: ElevatedButton(
                                onPressed: () => editSearchLocation(
                                  context,
                                  widget.listItem?.searchPhrase,
                                  widget.list!.publicListId!,
                                  widget.listItem!.id!,
                                ),
                                child: const Text('Edit'),
                              ),
                            )
                          ],
                        ),
                      ),
                      FormBuilderTextField(
                        autovalidateMode: AutovalidateMode.always,
                        name: addressFieldName,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          suffixIcon: _addressHasError
                              ? const Icon(Icons.error, color: Colors.red)
                              : const Icon(Icons.check, color: Colors.green),
                        ),
                        onChanged: (val) {
                          setState(() {
                            _addressHasError = !(_formKey.currentState?.fields[addressFieldName]?.validate() ?? false);
                          });
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.maxLength(300),
                        ]),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 16),
                      Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            child: FormBuilderTextField(
                              autovalidateMode: AutovalidateMode.always,
                              name: latFieldName,
                              decoration: InputDecoration(
                                labelText: 'Latitude',
                                suffixIcon: _latHasError
                                    ? const Icon(Icons.error, color: Colors.red)
                                    : const Icon(Icons.check, color: Colors.green),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _latHasError = !(_formKey.currentState?.fields[latFieldName]?.validate() ?? false);
                                });
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.maxLength(30),
                                FormBuilderValidators.numeric(),
                              ]),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Flexible(
                            child: FormBuilderTextField(
                              autovalidateMode: AutovalidateMode.always,
                              name: longFieldName,
                              decoration: InputDecoration(
                                labelText: 'Longitude',
                                suffixIcon: _longHasError
                                    ? const Icon(Icons.error, color: Colors.red)
                                    : const Icon(Icons.check, color: Colors.green),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _longHasError = !(_formKey.currentState?.fields[latFieldName]?.validate() ?? false);
                                });
                              },
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.maxLength(30),
                                FormBuilderValidators.numeric(),
                              ]),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                        ],
                      )
                    ],
                    const SizedBox(height: 32),
                    const Text('Categories', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    ...categoryIndices.expand(
                      (categoryIndex) {
                        return [
                          Flex(
                            direction: Axis.horizontal,
                            children: [
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(0, _categoryNameHasError[categoryIndex] ? 15 : 0, 0, 0),
                                  child: FormBuilderTextField(
                                    autovalidateMode: AutovalidateMode.always,
                                    name: 'categoryName-$categoryIndex',
                                    decoration: InputDecoration(
                                      labelText: 'Category name',
                                      suffixIcon: _categoryNameHasError[categoryIndex]
                                          ? const Icon(Icons.error, color: Colors.red)
                                          : const Icon(Icons.check, color: Colors.green),
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        _categoryNameHasError[categoryIndex] = !(_formKey
                                                .currentState?.fields['categoryName-$categoryIndex']
                                                ?.validate() ??
                                            false);
                                      });
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.maxLength(32),
                                    ]),
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Flexible(
                                flex: 3,
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0, _categoryValuesHasError[categoryIndex] ? 15 : 0, 0, 0),
                                  child: FormBuilderTextField(
                                    autovalidateMode: AutovalidateMode.always,
                                    name: 'categoryValues-$categoryIndex',
                                    decoration: InputDecoration(
                                      labelText: 'Category values',
                                      suffixIcon: _categoryValuesHasError[categoryIndex]
                                          ? const Icon(Icons.error, color: Colors.red)
                                          : const Icon(Icons.check, color: Colors.green),
                                    ),
                                    onChanged: (val) {
                                      setState(() {
                                        _categoryValuesHasError[categoryIndex] = !(_formKey
                                                .currentState?.fields['categoryValues-$categoryIndex']
                                                ?.validate() ??
                                            false);
                                      });
                                    },
                                    validator: FormBuilderValidators.compose([
                                      FormBuilderValidators.required(),
                                      FormBuilderValidators.maxLength(32),
                                    ]),
                                    keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: _categoryValuesHasError[categoryIndex] ? 4 : 15),
                        ];
                      },
                    ).toList(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _categoryNameHasError = [..._categoryNameHasError, true];
                          _categoryValuesHasError = [..._categoryValuesHasError, true];
                        });
                      },
                      child: const Text('Add new category'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                        print('AddEditListItem: pop once');
                        GoRouter.of(context).pop();
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: const Text(
                        'Cancel',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint('values: ${_formKey.currentState?.value.toString()}');
                          saveListItem(GoRouter.of(context), widget.list!.publicListId!, widget.listItem);
                        } else {
                          debugPrint('values: ${_formKey.currentState?.value.toString()}');
                          debugPrint('validation failed');
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveListItem(GoRouter router, String publicListId, ListItem? listItem) async {
    final fields = _formKey.currentState!.fields;
    final repo = await ref.read(listItemsRepositoryProvider(publicListId).future);
    final name = fields[nameFieldName]!.value as String;
    final info = fields[infoFieldName]!.value as String;
    final datetime = fields[dateTimeField]?.value as DateTime?;

    final urls = fields.entries
        .where((e) => e.key.startsWith('url-'))
        .map((e) => e.value)
        .map((e) => e.value as String)
        .toList();
    final categoryNames = fields.entries
        .where((e) => e.key.startsWith('categoryName-'))
        .map((e) => e.value)
        .map((e) => e.value as String)
        .toList();
    print('categoryNames: $categoryNames');
    final categoryValues = fields.entries
        .where((e) => e.key.startsWith('categoryValues-'))
        .map((e) => e.value)
        .map((e) => (e.value as String).split(','))
        .toList();
    print('categoryValues: $categoryValues');
    final address = fields[addressFieldName]?.value as String?;
    final searchPhrase = widget.selectedAddress?.searchPhrase;
    final lat = nullIfEmpty(fields[latFieldName]?.value as String?);
    final long = nullIfEmpty(fields[longFieldName]?.value as String?);
    final latLong = lat != null ? LatLong(lat: double.parse(lat), lng: double.parse(long!)) : null;

    final categories = Map.fromEntries(
      [for (int i = 0; i < categoryNames.length; i += 1) MapEntry(categoryNames[i], categoryValues[i])],
    );
    print('categories: $categories');

    if (listItem == null) {
      print('adding');
      final listItem = ListItem(
        name: name,
        info: info,
        urls: urls,
        categories: categories,
        datetime: datetime,
        address: address,
        latLong: latLong,
        searchPhrase: searchPhrase,
      );
      final refId = await repo.createItem(item: listItem);
      print('Added $refId');
    } else {
      final newListItem = listItem.copyWith(
        name: name,
        info: info,
        urls: urls,
        categories: categories,
        datetime: datetime,
        address: address,
        latLong: latLong,
        searchPhrase: searchPhrase,
      );
      final refId = await repo.updateItem(itemId: newListItem.id!, item: newListItem);
      print('Updated $refId');
    }
    print('AddEditListItem: pop once');
    router.pop();
    if ((widget.list?.withMap ?? false) && widget.listItem == null) {
      ref.read(selectedAddressProvider.notifier).state = null;
      print('AddEditListItem: pop twice');
    }
  }

  String? nullIfEmpty(String? s) {
    if (s == null) return null;
    if (s.trim().isEmpty) return null;
    return s;
  }

  void editSearchLocation(BuildContext context, String? searchPhrase, String publicListId, String listItemId) {
    SearchLocationForEditPageRoute(searchPhrase: searchPhrase, publicListId: publicListId, listItemId: listItemId)
        .push(context);
  }

  Future<void> deleteListItem(WidgetRef ref, GoRouter router, String publicListId, String listItemId) async {
    print('delete');
    final repo = await ref.read(listItemsRepositoryProvider(publicListId).future);
    await repo.deleteItem(itemId: listItemId);
    print('AddEditListItem: pop once');
    router.pop();
    if (ref.read(selectedAddressProvider) != null) {
      ref.read(selectedAddressProvider.notifier).state = null;
      print('AddEditListItem: pop twice');
      router.pop();
    }
  }

  DateTime getCurrentDate() {
    var now = DateTime.now();
    // ignore: join_return_with_assignment
    now = now.subtract(
      Duration(
        hours: now.hour,
        minutes: now.minute,
        seconds: now.second,
        milliseconds: now.millisecond,
        microseconds: now.microsecond,
      ),
    );
    return now;
  }
}
