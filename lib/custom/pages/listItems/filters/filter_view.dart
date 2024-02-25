import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '/custom/pages/listItems/filters/filters.dart';
import '/custom/pages/listItems/models/list_item.dart';
import '/custom/pages/lists/models/list_of_things.dart';
import '/l10n/l10n.dart';
import '/standard/constants.dart';
import '/standard/settings/settings.dart';
import '/standard/widgets/border_with_header.dart';
import 'bloc/filter_bloc.dart';
import 'bloc/filter_event.dart';
import 'date_filter.dart';

class SelectedChipsCubit extends Cubit<Set<String>> {
  SelectedChipsCubit() : super({});
  void update(Set<String> selected) => emit(selected);
}

const distanceFieldName = 'distance';

const distanceMin = 0.0;
const distanceMax = 50.0;

class FilterView extends StatefulWidget {
  const FilterView({
    required this.list,
    required this.listItems,
    required this.filters,
    required this.settings,
    super.key,
  });
  final ListOfThings list;
  final List<ListItem> listItems;
  final Filters filters;
  final Settings settings;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  double distanceValue = distanceMax;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final initialValues = {
      ...widget.filters.categoryFilters,
      startDateFieldName: widget.filters.startDate,
      endDateFieldName: widget.filters.endDate,
    };
    if (widget.filters.distance != null) {
      initialValues[distanceFieldName] =
          widget.filters.distance! / convertDistanceToMeters(widget.settings.distanceUnit, 1);
    }

    return getFormBuilderWrapper(widget.list, widget.listItems, initialValues, widget.settings);
  }

  Widget getFormBuilderWrapper(
    ListOfThings list,
    List<ListItem> listItems,
    Map<String, dynamic> initialValue,
    Settings settings,
  ) {
    final selectedChips = context.watch<SelectedChipsCubit>().state;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FormBuilder(
              key: _formKey,
              onChanged: () {
                _formKey.currentState!.save();
                updateFilters(settings);
              },
              autovalidateMode: AutovalidateMode.disabled,
              skipDisabled: true,
              initialValue: initialValue,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  if (list.withDates)
                    DateFilter(
                      formKey: _formKey,
                    ),
                  if (list.withMap) ...[
                    const SizedBox(height: 16),
                    getDistanceFilter(initialValue[distanceFieldName] as double?, settings),
                  ],
                  const SizedBox(height: 16),
                  ...getCategoriesSections(getCategories(listItems), selectedChips),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isSelected(String categoryName, String c, Set<String> selectedChips) {
    return selectedChips.contains('$categoryName-$c');
  }

  Widget getDistanceFilter(double? initialValue, Settings settings) {
    logger
      ..i('distanceValue: $distanceValue')
      ..i('initialValue: $initialValue');
    final values = (distanceValue == distanceMax) ? [initialValue ?? distanceValue] : [distanceValue];
    logger.i('$this => values: $values');
    return BorderWithHeader(
      title: context.l10n.distanceFilterText(settings.distanceUnit.toString()),
      child: FormBuilderField(
        name: distanceFieldName,
        key: const Key(distanceFieldName),
        builder: (FormFieldState<dynamic> field) {
          logger.i('$this => field: $field');
          return FlutterSlider(
            values: values,
            max: distanceMax,
            min: distanceMin,
            handler: FlutterSliderHandler(
              decoration: const BoxDecoration(),
              child: const Icon(
                Icons.circle,
                // color: mainColor,
                size: 31,
              ),
            ),
            tooltip: FlutterSliderTooltip(
              format: (s) => s == '$distanceMax' ? '∞' : s,
            ),
            trackBar: FlutterSliderTrackBar(
              inactiveTrackBar: BoxDecoration(
                color: Colors.black12,
                border: Border.all(width: 3), //, color: shadedMainColor),
              ),
              activeTrackBar: const BoxDecoration(), //color: mainColor),
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

  List<Widget> getCategoriesSections(Map<String, Set<String>> categories, Set<String> selectedChips) {
    return categories.entries.expand((e) {
      final categoryName = e.key;
      final categoryValues = e.value;

      return [
        FormBuilderFilterChip<String>(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: categoryName,
          ),
          name: categoryName,
          onChanged: (List<String>? selected) {
            final chips = selected?.map((s) => '$categoryName-$s').toSet();
            context.read<SelectedChipsCubit>().update(chips ?? <String>{});
          },
          selectedColor: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).primaryColor.withAlpha(100),
          options: categoryValues.map(
            (c) {
              final iconText = isSelected(categoryName, c, selectedChips) ? '' : c[0];
              return FormBuilderChipOption<String>(
                value: c,
                avatar: CircleAvatar(
                  // backgroundColor: mainColor,
                  child: Text(iconText),
                ),
              );
            },
          ).toList(),
        ),
        const SizedBox(
          height: 16,
        ),
      ];
    }).toList();
  }

  void updateFilters(Settings settings) {
    final fields = _formKey.currentState?.fields;

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
        final d = (field.value.value ?? distanceMax) as double;
        if (d != distanceMax) {
          maxDistance = convertDistanceToMeters(settings.distanceUnit, d);
        }
        logger.i('$this => Distance: $d, $maxDistance');
      } else {
        final values = field.value.value as List<String>?;
        if (values != null && values.isNotEmpty) {
          categoryFilters[field.key] = values;
        }
      }
    }
    final filters = Filters(
      categoryFilters: categoryFilters,
      startDate: startDate,
      endDate: endDate,
      distance: maxDistance,
    );
    BlocProvider.of<FilterBloc>(context).add(UpdateFilters(filters));
  }
}
