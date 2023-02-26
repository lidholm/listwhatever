import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/list_items/list_items_provider.dart';
import 'package:listanything/app/widgets/standardWidgets/exception_widget.dart';

class FilterPage extends ConsumerWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(filterProvider);
    return ref.watch(listItemsProvider).when(
          error: (e, st) => ExceptionWidget(e: e, st: st),
          loading: () => FilterPageInner(categories: const {}, isLoading: true, ref: ref, filters: filters),
          data: (items) =>
              FilterPageInner(categories: getCategories(items ?? []), isLoading: false, ref: ref, filters: filters),
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
  }) : super(key: key);

  final Map<String, Set<String>> categories;
  final bool isLoading;
  final WidgetRef ref;
  final Map<String, List<String>> filters;

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
    final initialValue = widget.filters;

    return Scaffold(
      appBar: AppBar(title: const Text('Filter for <Restaurants>')),
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
                    ...widget.categories.entries.map((e) {
                      final categoryName = e.key;
                      final categoryValues = e.value;

                      return FormBuilderFilterChip<String>(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          labelText: categoryName,
                        ),
                        name: categoryName,
                        selectedColor: Colors.blue,
                        options: categoryValues
                            .map(
                              (c) => FormBuilderChipOption<String>(
                                value: c,
                                avatar: CircleAvatar(child: Text(c[0])),
                              ),
                            )
                            .toList(),
                        onChanged: _onChanged,
                      );
                    })
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
                          updateFilters(GoRouter.of(context));
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

  void updateFilters(GoRouter router) {
    final fields = _formKey.currentState?.fields;
    print('fields: $fields');

    final filters = <String, List<String>>{};

    for (final field in fields!.entries) {
      final values = field.value.value as List<String>?;
      if (values != null) {
        filters[field.key] = values;
      }
    }
    print('filters: $filters');
    widget.ref.read(filterProvider.notifier).state = filters;
    router.pop();
  }
}
