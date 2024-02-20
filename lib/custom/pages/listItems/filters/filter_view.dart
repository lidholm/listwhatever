import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_bloc.dart';
import 'package:listwhatever/custom/pages/listItems/list_items_load_bloc/list_items_load_state.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_bloc.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_event.dart';
import 'package:listwhatever/custom/pages/lists/list_load_events/list_load_state.dart';
import 'package:listwhatever/custom/pages/lists/models/list_of_things.dart';
import 'package:listwhatever/standard/app/bloc/app_bloc.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/settings/settings.dart';

import '/custom/pages/listItems/filters/filters.dart';
import '/custom/pages/listItems/list_item.dart';
import '/custom/pages/listItems/list_items.dart';
import '/custom/pages/listItems/list_or_list_item_not_loaded_handler.dart';
import '/l10n/l10n.dart';
import '/standard/widgets/border_with_header.dart';
import 'bloc/filter_bloc.dart';
import 'bloc/filter_event.dart';
import 'bloc/filter_state.dart';
import 'date_filter.dart';

class SelectedChipsCubit extends Cubit<Set<String>> {
  SelectedChipsCubit() : super({});
  void update(Set<String> selected) => emit(selected);
}

const distanceFieldName = 'distance';

const distanceMin = 0.0;
const distanceMax = 50.0;

class FilterView extends StatefulWidget {
  const FilterView({required this.listId, super.key});
  final String listId;

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  double distanceValue = distanceMax;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    BlocProvider.of<ListLoadBloc>(context).add(LoadList(widget.listId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listState = context.watch<ListLoadBloc>().state;
    final listItemsState = context.watch<ListItemsLoadBloc>().state;

    final filtersState = context.watch<FilterBloc>().state;
    final appState = context.watch<AppBloc>().state;

    final filtersNotLoadedView = handleFiltersNotLoaded(filtersState);
    if (filtersNotLoadedView != null) {
      return filtersNotLoadedView;
    }
    final filters = (filtersState as FiltersUpdated).filters;
    // logger.d('this filters: $filters');

    final settings = appState.user.settings;

    final listStateView = ListOrListItemNotLoadedHandler.handleListAndListItemsState(listState, listItemsState);
    if (listStateView != null) {
      return listStateView;
    }

    final list = (listState as ListLoadLoaded).list!;
    final listItems = (listItemsState as ListItemsLoadLoaded).listItems;

    final initialValues = {
      ...filters.categoryFilters,
      startDateFieldName: filters.startDate,
      endDateFieldName: filters.endDate,
    };
    if (filters.distance != null) {
      initialValues[distanceFieldName] = filters.distance! / convertDistanceToMeters(settings.distanceUnit, 1);
    }
    return getFormBuilderWrapper(list, listItems, initialValues, settings);
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
              },
              autovalidateMode: AutovalidateMode.disabled,
              skipDisabled: true,
              initialValue: initialValue,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 16),
                  if (list.withDates) DateFilter(formKey: _formKey),
                  if (list.withMap) ...[
                    const SizedBox(height: 16),
                    getDistanceFilter(initialValue[distanceFieldName] as double?, settings),
                  ],
                  const SizedBox(height: 16),
                  ...getCategoriesSections(getCategories(listItems), selectedChips),
                  const SizedBox(height: 16),
                  cancelAndSubmitButtons(settings),
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
    print('distanceValue: $distanceValue');
    print('initialValue: $initialValue');
    final values = (distanceValue == distanceMax) ? [initialValue ?? distanceValue] : [distanceValue];
    print('values: $values');
    return BorderWithHeader(
      title: context.l10n.distanceFilterText(settings.distanceUnit.toString()),
      child: FormBuilderField(
        name: distanceFieldName,
        key: const Key(distanceFieldName),
        builder: (FormFieldState<dynamic> field) {
          print('field: $field');
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

  Widget cancelAndSubmitButtons(Settings settings) {
    return Row(
      children: <Widget>[
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              _formKey.currentState?.reset();
            },
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
                updateFilters(settings);
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
        maxDistance = convertDistanceToMeters(settings.distanceUnit, d);
        print('Distance: $d, $maxDistance');
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
    GoRouter.of(context).pop();
  }
}
