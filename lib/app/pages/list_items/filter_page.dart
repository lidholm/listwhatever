import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:listanything/app/common_theme_data.dart';
import 'package:listanything/app/helpers/constants.dart';
import 'package:listanything/app/pages/list_items/date_filter.dart';
import 'package:listanything/app/pages/list_items/filter_provider.dart';
import 'package:listanything/app/pages/list_items/filters.dart';
import 'package:listanything/app/pages/list_items/list_and_list_items_provider.dart';
import 'package:listanything/app/pages/list_items/list_item.dart';
import 'package:listanything/app/pages/lists/list_of_things.dart';
import 'package:listanything/app/widgets/standardWidgets/border_with_header.dart';
import 'package:listanything/app/widgets/standardWidgets/common_scaffold.dart';
import 'package:listanything/app/widgets/standardWidgets/exception_widget.dart';

const distanceFieldName = 'distance';
const metersInMile = 1608;

const distanceMin = 0.0;
const distanceMax = 50.0;

class FilterPage extends ConsumerWidget {
  const FilterPage({
    required this.publicListId,
    super.key,
  });
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
    required this.categories,
    required this.isLoading,
    required this.ref,
    required this.filters,
    required this.list,
    super.key,
  });

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
  double distanceValue = distanceMax;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    distanceValue = (widget.filters.distance ?? 0) / metersInMile;
  }

  @override
  Widget build(BuildContext context) {
    final other = <String, dynamic>{
      startDateFieldName: widget.filters.startDate,
      endDateFieldName: widget.filters.endDate
    };
    final initialValue = <String, dynamic>{}
      ..addAll(widget.filters.categoryFilters)
      ..addAll(other);

    return CommonScaffold(
      title: 'Filter for ${widget.list?.name}',
      body: getFormBuilderWrapper(initialValue),
    );
  }

  Widget getFormBuilderWrapper(Map<String, dynamic> initialValue) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
                logger.d(_formKey.currentState!.value.toString());
              },
              autovalidateMode: AutovalidateMode.disabled,
              skipDisabled: true,
              initialValue: initialValue,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  if (widget.list?.withDates ?? false)
                    DateFilter(formKey: _formKey),
                  if (widget.list?.withMap ?? false) ...[
                    const SizedBox(height: 16),
                    getDistanceFilter(),
                  ],
                  const SizedBox(height: 16),
                  ...getCategoriesSections(),
                  const SizedBox(height: 16),
                  cancelAndSubmitButtons(),
                ],
              ),
            ),
          ],
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
    logger.d('fields: $fields');

    final categoryFilters = <String, List<String>>{};
    DateTime? startDate;
    DateTime? endDate;
    double? maxDistance;

    for (final field in fields!.entries) {
      if (field.key == startDateFieldName) {
        startDate = field.value.value as DateTime?;
      } else if (field.key == endDateFieldName) {
        endDate = field.value.value as DateTime?;
      } else if (field.key == distanceFieldName) {
        maxDistance = (field.value.value as double) * metersInMile;
      } else {
        final values = field.value.value as List<String>?;
        if (values != null) {
          categoryFilters[field.key] = values;
        }
      }
    }
    logger.d('filters: $categoryFilters');
    widget.ref.read(filterProvider.notifier).state = Filters(
      categoryFilters: categoryFilters,
      startDate: startDate,
      endDate: endDate,
      distance: maxDistance,
    );
    router.pop();
  }

  Widget getDistanceFilter() {
    return BorderWithHeader(
      title: 'Distance',
      child: FormBuilderField(
        name: distanceFieldName,
        key: const Key(distanceFieldName),
        builder: (FormFieldState<dynamic> field) {
          return FlutterSlider(
            values: [distanceValue],
            max: distanceMax,
            min: distanceMin,
            handler: FlutterSliderHandler(
              decoration: const BoxDecoration(),
              child: const Icon(
                Icons.circle,
                color: mainColor,
                size: 31,
              ),
            ),
            tooltip: FlutterSliderTooltip(
              format: (s) => s == '$distanceMax' ? '∞' : s,
            ),
            trackBar: FlutterSliderTrackBar(
              inactiveTrackBar: BoxDecoration(
                color: Colors.black12,
                border: Border.all(width: 3, color: shadedMainColor),
              ),
              activeTrackBar: const BoxDecoration(color: mainColor),
            ),
            onDragCompleted: (handlerIndex, lowerValue, upperValue) {
              setState(() {
                distanceValue = lowerValue as double;
                field.didChange(distanceValue);
              });
            },
          );
        },
      ),
    );
  }

  List<Widget> getCategoriesSections() {
    return widget.categories.entries.expand((e) {
      final categoryName = e.key;
      final categoryValues = e.value;

      return [
        FormBuilderFilterChip<String>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: categoryName,
          ),
          name: categoryName,
          selectedColor: mainColor,
          backgroundColor: shadedMainColor,
          options: categoryValues
              .map(
                (c) => FormBuilderChipOption<String>(
                  value: c,
                  avatar: CircleAvatar(
                    backgroundColor: mainColor,
                    child: Text(
                      isSelected(categoryName, c) ? '' : c[0],
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(
          height: 16,
        )
      ];
    }).toList();
  }

  Widget cancelAndSubmitButtons() {
    return Row(
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
                logger.d(_formKey.currentState?.value.toString());
                updateFilters(GoRouter.of(context));
              } else {
                logger
                  ..d(_formKey.currentState?.value.toString())
                  ..d('validation failed');
              }
            },
            child: const Text(
              'Submit',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
