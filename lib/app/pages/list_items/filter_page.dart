import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/date_filter.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/filters.dart';
import 'package:listanything/app/pages/list_items/list_and_list_items_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';
import 'package:listanything/app/widgets/standardWidgets/exception_widget.dart';

class FilterPage extends ConsumerWidget {
  const FilterPage({Key? key, required this.publicListId}) : super(key: key);
  final String publicListId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);
    return ref.watch(listAndListItemsProvider(publicListId)).when(
          error: (e, st) => ExceptionWidget(e: e, st: st),
          loading: () => FilterPageInner(
            categories: const {},
            isLoading: true,
            ref: ref,
            filters: filters,
            list: null,
          ),
          data: (tuple) {
            final list = tuple.item1;
            final items = tuple.item2;
            return FilterPageInner(
              categories: getCategories(items ?? []),
              isLoading: false,
              ref: ref,
              filters: filters,
              list: list,
            );
          },
        );
  }

  Map<String, Set<String>> getCategories(List<ListItem> items) {
    final categories = <String, Set<String>>{};

    for (final item in items) {
      for (final category in item.categories.entries) {
        final categoryName = category.key.trim();
        if (!categories.containsKey(categoryName)) {
          categories[categoryName] = {};
        }
        categories[categoryName]!.addAll(category.value.map((e) => e.trim()));
      }
    }
    return categories;
  }
}

class FilterPageInner extends StatefulWidget {
  const FilterPageInner({
    Key? key,
    required this.categories,
    required this.isLoading,
    required this.ref,
    required this.filters,
    required this.list,
  }) : super(key: key);

  final Map<String, Set<String>> categories;
  final bool isLoading;
  final WidgetRef ref;
  final Filters filters;
  final ListOfThings? list;

  @override
  State<FilterPageInner> createState() {
    return _FilterPageInnerState();
  }
}

class _FilterPageInnerState extends State<FilterPageInner> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();

  void _onChanged(dynamic val) => debugPrint(val.toString());

  @override
  Widget build(BuildContext context) {
    final other = <String, dynamic>{
      startDateFieldName: widget.filters.startDate,
      endDateFieldName: widget.filters.endDate
    };
    final initialValue = <String, dynamic>{}
      ..addAll(widget.filters.categoryFilters)
      ..addAll(other);
    final iconTexts = getIconTexts(widget.categories);
    print('iconTexts: $iconTexts');

    return CommonScaffold(
      title: 'Filter for ${widget.list?.name}',
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
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
                    if (widget.list?.withDates ?? false) DateFilter(formKey: _formKey),
                    const SizedBox(height: 16),
                    ...widget.categories.entries.expand((e) {
                      final categoryName = e.key;
                      final categoryValues = e.value;

                      return [
                        FormBuilderFilterChip<String>(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            labelText: categoryName,
                          ),
                          name: categoryName,
                          selectedColor: Colors.orange.shade800,
                          backgroundColor: Colors.orange.shade300,
                          options: categoryValues
                              .map(
                                (c) => FormBuilderChipOption<String>(
                                  value: c,
                                  avatar: CircleAvatar(
                                    backgroundColor: Colors.orange.shade800,
                                    child: Text(isSelected(categoryName, c) ? '' : c[0]),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (values) {
                            print('onChanged');
                            print('values: $values');
                            setState(() {
                              for (final value in values ?? <String>[]) {
                                iconTexts[categoryName]![value] = '';
                              }
                            });
                            _onChanged(values);
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ];
                    })
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
                      },
                      // color: Theme.of(context).colorScheme.secondary,
                      child: const Text(
                        'Reset',
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          // debugPrint(_formKey.currentState?.value.toString());
                          updateFilters(GoRouter.of(context));
                        } else {
                          // debugPrint(_formKey.currentState?.value.toString());
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

  bool isSelected(String categoryName, String c) {
    final filters = _formKey.currentState?.value;
    final filter = filters?[categoryName] as List<String>?;
    final isChecked = filter?.contains(c) ?? false;
    return isChecked;
  }

  void updateFilters(GoRouter router) {
    final fields = _formKey.currentState?.fields;
    print('fields: $fields');

    final categoryFilters = <String, List<String>>{};
    DateTime? startDate;
    DateTime? endDate;

    for (final field in fields!.entries) {
      if (field.key == startDateFieldName) {
        startDate = field.value.value as DateTime?;
      } else if (field.key == endDateFieldName) {
        endDate = field.value.value as DateTime?;
      } else {
        final values = field.value.value as List<String>?;
        if (values != null) {
          categoryFilters[field.key] = values;
        }
      }
    }
    print('filters: $categoryFilters');
    widget.ref.read(filterProvider.notifier).state = Filters(
      categoryFilters: categoryFilters,
      startDate: startDate,
      endDate: endDate,
    );
    router.pop();
  }

  Map<String, Map<String, String>> getIconTexts(Map<String, Set<String>> filters) {
    return {
      for (var entry in filters.entries) entry.key: getIconLetters(entry.value),
    };
  }

  Map<String, String> getIconLetters(Set<String> value) {
    return {
      for (var entry in value) entry: entry[0],
    };
  }
}
