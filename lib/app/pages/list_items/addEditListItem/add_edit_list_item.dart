import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_repository_provider.dart';
import 'package:listanything/app/pages/list_items/selected_list_item_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/async_value_widget.dart';

class AddEditListItem extends ConsumerWidget {
  const AddEditListItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<ListItem?>(
      value: ref.watch(selectedListItemProvider),
      data: (listItem) => AddEditListItemInner(listItem: listItem),
    );
  }
}

class AddEditListItemInner extends ConsumerStatefulWidget {
  const AddEditListItemInner({Key? key, required this.listItem}) : super(key: key);
  final ListItem? listItem;

  @override
  ConsumerState<AddEditListItemInner> createState() {
    return _AddEditListItemInnerState();
  }
}

class _AddEditListItemInnerState extends ConsumerState<AddEditListItemInner> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _nameHasError = true;
  List<bool> _categoryNameHasError = [];
  List<bool> _categoryValuesHasError = [];

  @override
  void initState() {
    super.initState();
    _categoryNameHasError = List.generate(widget.listItem?.categories.length ?? 0, (index) => false);
    _categoryValuesHasError = List.generate(widget.listItem?.categories.length ?? 0, (index) => false);
    _nameHasError = widget.listItem == null;
  }

  @override
  Widget build(BuildContext context) {
    final initialValue =
        widget.listItem != null ? <String, dynamic>{'name': widget.listItem!.name} : <String, dynamic>{'name': ''};
    if (widget.listItem != null) {
      mapIndexed(widget.listItem!.categories.entries).forEach((e) {
        final index = e.key;
        final key = e.value.key;
        final values = e.value.value;
        initialValue['categoryName-$index'] = key;
        initialValue['categoryValues-$index'] = values.join(', ');
      });
    }

    final categoryIndices =
        List.generate(max(widget.listItem?.categories.length ?? 0, _categoryNameHasError.length), (i) => i);
    return Scaffold(
      appBar: AppBar(title: const Text('Add List Item')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FormBuilder(
                key: _formKey,
                // enabled: false,
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
                      name: 'name',
                      decoration: InputDecoration(
                        labelText: 'Item name',
                        suffixIcon: _nameHasError
                            ? const Icon(Icons.error, color: Colors.red)
                            : const Icon(Icons.check, color: Colors.green),
                      ),
                      onChanged: (val) {
                        setState(() {
                          _nameHasError = !(_formKey.currentState?.fields['name']?.validate() ?? false);
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
    final name = fields['name']!.value as String;
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

    final categories = Map.fromEntries(
      [for (int i = 0; i < categoryNames.length; i += 1) MapEntry(categoryNames[i], categoryValues[i])],
    );
    print('categories: $categories');

    if (listItem == null) {
      print('adding');
      final listItem = ListItem(name: name, categories: categories);
      final refId = await repo.createListItem(listItem: listItem);
      print('Added $refId');
    } else {
      final newListItem = listItem.copyWith(name: name, categories: categories);
      final refId = await repo.updateListItem(listItem: newListItem);
      print('Updated $refId');
      ref.read(selectedListItemIdProvider.notifier).state = null;
    }
    router.pop();
  }
}
