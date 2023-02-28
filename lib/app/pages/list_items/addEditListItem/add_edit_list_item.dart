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
import 'package:listanything/app/navigation/routes/search_location_page_route.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';
import 'package:listanything/app/pages/list_items/selected_list_item_provider.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/pages/lists/selected_list_provider.dart';
import 'package:listanything/app/pages/map/searchLocation/selected_address_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/app_bar_action.dart';
import 'package:listanything/app/widgets/standardWidgets/common_app_bar.dart';
import 'package:listanything/app/widgets/standardWidgets/double_async_value_widget.dart';

class AddEditListItem extends ConsumerWidget {
  const AddEditListItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAddress = ref.watch(selectedAddressProvider);
    return DoubleAsyncValueWidget<ListItem?, ListOfThings?>(
      firstValue: ref.watch(selectedListItemProvider),
      secondValue: ref.watch(selectedListProvider),
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
            addressFieldName: widget.selectedAddress?.formattedAddress ?? widget.listItem!.address,
            latFieldName: '${widget.selectedAddress?.geometry.location.lat ?? widget.listItem!.latLong?.lat ?? ''}',
            longFieldName: '${widget.selectedAddress?.geometry.location.lng ?? widget.listItem!.latLong?.lng ?? ''}',
          }
        : <String, dynamic>{
            nameFieldName: '',
            urlsFieldName: '',
            infoFieldName: '',
            addressFieldName: widget.selectedAddress?.formattedAddress ?? '',
            latFieldName: '${widget.selectedAddress?.geometry.location.lat ?? ''}',
            longFieldName: '${widget.selectedAddress?.geometry.location.lng ?? '0.0'}',
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
    print('list: ${widget.list}');

    final urlIndices = List.generate(max(widget.listItem?.urls.length ?? 0, _urlHasError.length), (i) => i);
    final categoryIndices =
        List.generate(max(widget.listItem?.categories.length ?? 0, _categoryNameHasError.length), (i) => i);
    return Scaffold(
      appBar: CommonAppBar(
        title: widget.listItem?.id != null ? 'Edit List Item' : 'Add List Item',
        actions: [
          if (widget.list?.id != null)
            AppBarAction(
              title: 'Delete list',
              icon: Icons.delete,
              callback: () => deleteListItem(ref, GoRouter.of(context), widget.listItem!.id!),
              overflow: false,
            ),
        ],
      ),
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
                        suffixIcon: _nameHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _nameHasError = !(_formKey.currentState?.fields[nameFieldName]?.validate() ?? false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.maxLength(16),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: infoFieldName,
                      minLines: 3, maxLines: 6,
                      decoration: InputDecoration(
                        labelText: 'Extra info',
                        suffixIcon: _infoHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _infoHasError = !(_formKey.currentState?.fields[infoFieldName]?.validate() ?? false);
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.maxLength(1000),
                      ]),
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.newline,
                    ),
                    const SizedBox(height: 32),
                    const Text('URLs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ...urlIndices.map(
                      (urlIndex) {
                        print('url-$urlIndex');
                        return FormBuilderTextField(
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
                        );
                      },
                    ).toList(),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _urlHasError = [..._urlHasError, true];
                        });
                      },
                      child: const Text('Add new category'),
                    ),
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
                                onPressed: () => editSearchLocation(context, widget.listItem?.searchPhrase),
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
                                FormBuilderValidators.required(),
                                FormBuilderValidators.maxLength(30),
                                FormBuilderValidators.numeric(),
                              ]),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
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
                                FormBuilderValidators.required(),
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
                    const Text('Categories and values', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ...categoryIndices.map(
                      (categoryIndex) {
                        print('categoryName-$categoryIndex');
                        return Flex(
                          direction: Axis.horizontal,
                          children: [
                            Flexible(
                              flex: 2,
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
                                    _categoryNameHasError[categoryIndex] =
                                        !(_formKey.currentState?.fields['categoryName-$categoryIndex']?.validate() ??
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
                            const SizedBox(width: 16),
                            Flexible(
                              flex: 3,
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
                                    _categoryValuesHasError[categoryIndex] =
                                        !(_formKey.currentState?.fields['categoryValues-$categoryIndex']?.validate() ??
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
                          ],
                        );
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
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          debugPrint(_formKey.currentState?.value.toString());
                          saveListItem(GoRouter.of(context), widget.listItem);
                        } else {
                          debugPrint(_formKey.currentState?.value.toString());
                          debugPrint('validation failed');
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _formKey.currentState?.reset();
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: Text(
                        'Reset',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
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

  Future<void> saveListItem(GoRouter router, ListItem? listItem) async {
    final fields = _formKey.currentState!.fields;
    final repo = await ref.read(listItemsRepositoryProvider.future);
    final name = fields[nameFieldName]!.value as String;
    final info = fields[infoFieldName]!.value as String;
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
    final lat = fields[latFieldName]?.value as String?;
    final long = fields[longFieldName]?.value as String?;
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
        address: address,
        latLong: latLong,
        searchPhrase: searchPhrase,
      );
      final refId = await repo.updateItem(itemId: newListItem.id!, item: newListItem);
      print('Updated $refId');
      ref.read(selectedListItemIdProvider.notifier).state = null;
    }
    router.pop();
    if (ref.read(selectedAddressProvider) != null) {
      ref.read(selectedAddressProvider.notifier).state = null;
      router.pop();
    }
  }

  void editSearchLocation(BuildContext context, String? searchPhrase) {
    SearchLocationPageRoute(searchPhrase: searchPhrase).push(context);
  }

  Future<void> deleteListItem(WidgetRef ref, GoRouter router, String listItemId) async {
    print('delete');
    final repo = await ref.read(listItemsRepositoryProvider.future);
    await repo.deleteItem(itemId: listItemId);
    router.pop();
    if (ref.read(selectedAddressProvider) != null) {
      ref.read(selectedAddressProvider.notifier).state = null;
      router.pop();
    }
  }
}
