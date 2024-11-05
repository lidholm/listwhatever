import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/custom/pages/listItems/filters/categories_helper.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/form/form_generator.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_section.dart';
import 'package:listwhatever/standard/helpers/date_helper.dart';
import 'package:listwhatever/standard/helpers/logger_helper.dart';
import 'package:listwhatever/standard/helpers/shimmer_helper.dart';

import '/custom/pages/listItems/filters/filters.dart';
import '/custom/pages/listItems/models/list_item.dart';
import '/custom/pages/lists/models/list_of_things.dart';
import '/standard/settings/settings.dart';
import '/standard/widgets/vStack/x_stack.dart' as x_stack;
import 'bloc/filter_bloc.dart';
import 'bloc/filter_event.dart';

const String className = 'FilterView';

enum SectionName {
  name._('name'),
  dates._('dates'),
  distance._('distance'),
  categories._('categories'),
  submit._('submit');

  const SectionName._(this.value);

  final String value;
}

enum FieldId {
  name._('name'),
  startdate._('startdate'),
  enddate._('enddate'),
  distance._('distance'),
  categoryvalue._('categoryvalue'),
  cancel._('cancel'),
  submit._('submit');

  const FieldId._(this.value);

  final String value;
}

const distanceMin = 0.0;
const distanceMax = 50.0;

class FilterView extends StatefulWidget {
  const FilterView({
    required this.isLoading,
    required this.list,
    required this.listItems,
    required this.filters,
    required this.settings,
    super.key,
  });
  final bool isLoading;
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
  Widget build(BuildContext context) {
    // LoggerHelper.logger.i('$className listItems: ${widget.listItems}');

    final fields = widget.isLoading
        ? ShimmerHelper.generateShimmerFormFields(4, SectionName.name.name)
        : [
            itemNameInputField(),
            startDateInputField(),
            endDateInputField(),
            distanceInputField(),
            ...categoriesFields(getCategories(widget.listItems)),
            resetButton(),
          ];
    // LoggerHelper.logger.i('fields: ${fields.length}');

    final sections = getSections();

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: fields,
      focusFieldName: FieldId.submit.name,
      changeCallback: updateFilters,
      isLoading: widget.isLoading,
    );

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor.withOpacity(0.85),
        border: Border(
          left: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.6),
            width: 3,
          ),
        ),
      ),
      child: formGenerator,
    );
  }

  List<FormInputSection> getSections() {
    return [
      FormInputSection(
        name: SectionName.name.name,
        direction: x_stack.AxisDirection.vertical,
        showBorder: !widget.isLoading,
      ),
      FormInputSection(
        name: SectionName.dates.name,
        direction: x_stack.AxisDirection.vertical,
        showBorder: !widget.isLoading,
      ),
      FormInputSection(
        name: SectionName.distance.name,
        direction: x_stack.AxisDirection.vertical,
        showBorder: !widget.isLoading,
      ),
      FormInputSection(
        name: SectionName.categories.name,
        direction: x_stack.AxisDirection.vertical,
        showBorder: !widget.isLoading,
      ),
      FormInputSection(
        name: SectionName.submit.name,
        direction: x_stack.AxisDirection.horizontal,
        showBorder: !widget.isLoading,
      ),
    ];
  }

  FormInputFieldInfo itemNameInputField() {
    return FormInputFieldInfo.textArea(
      id: FieldId.name.name,
      label: 'Item name',
      currentValue: '',
      validators: [],
      sectionName: SectionName.name.name,
    );
  }

  FormInputFieldInfo startDateInputField() {
    return FormInputFieldInfo.date(
      id: FieldId.startdate.name,
      label: 'Start date',
      currentValue: widget.filters.startDate ?? DateTime.now(),
      inputType: widget.list.withTimes ? InputType.both : InputType.date,
      validator: (d) {
        return null;
      },
      sectionName: SectionName.dates.name,
    );
  }

  FormInputFieldInfo endDateInputField() {
    return FormInputFieldInfo.date(
      id: FieldId.enddate.name,
      label: 'End date',
      currentValue: widget.filters.endDate ?? DateTime.now(),
      inputType: widget.list.withTimes ? InputType.both : InputType.date,
      validator: (e) => null,
      sectionName: SectionName.dates.name,
    );
  }

  FormInputFieldInfo distanceInputField() {
    return FormInputFieldInfo.slider(
      id: FieldId.distance.name,
      label: 'End date',
      currentValue: widget.filters.distance ?? distanceMax,
      range: (distanceMin, distanceMax),
      validators: [],
      sectionName: SectionName.distance.name,
    );
  }

  List<FormInputFieldInfo> categoriesFields(
    Map<String, Set<String>> categories,
  ) {
    // LoggerHelper.logger.i('$className categories: $categories');
    final chipsFields = categories.entries
        .map((e) => getCategoryField(e.key, e.value))
        .toList();

    return chipsFields;
  }

  FormInputFieldInfo getCategoryField(String categoryName, Set<String> values) {
    final type = widget.list.filterTypes[categoryName];
    return switch (type) {
      FilterType.regular => getCategoriesChipsField(categoryName, values),
      FilterType.numericRange =>
        getCategoriesNumericSliderField(categoryName, values),
      FilterType.dateRange =>
        getCategoriesDateSliderField(categoryName, values),
      FilterType.timeOfDayRange =>
        getCategoriesTimeOfDaySliderField(categoryName, values),
      null => getCategoriesChipsField(categoryName, values),
    };
  }

  FormInputFieldInfo getCategoriesChipsField(
    String categoryName,
    Set<String> values,
  ) {
    return FormInputFieldInfo.chips(
      id: getCategoryFieldKey(categoryName),
      label: categoryName,
      currentValue: values,
      values: values.where((e) => e.trim().isNotEmpty),
      validators: [],
      sectionName: SectionName.categories.name,
    );
  }

  FormInputFieldInfo getCategoriesNumericSliderField(
    String categoryName,
    Set<String> values,
  ) {
    final minValue = values.map((s) => double.tryParse(s) ?? 0).reduce(min);
    final maxValue = values.map((s) => double.tryParse(s) ?? 0).reduce(max);
    return FormInputFieldInfo.slider(
      id: getCategoryFieldKey(categoryName),
      rangeSlider: true,
      range: (minValue, maxValue),
      label: categoryName,
      currentValues: (minValue, maxValue),
      validators: [],
      sectionName: SectionName.categories.name,
    );
  }

  FormInputFieldInfo getCategoriesDateSliderField(
    String categoryName,
    Set<String> values,
  ) {
    final minValue = values
            .map((s) => DateTime.tryParse(s)?.millisecondsSinceEpoch ?? 0)
            .reduce(min) *
        1.0;
    final maxValue = values
            .map((s) => DateTime.tryParse(s)?.millisecondsSinceEpoch ?? 0)
            .reduce(max) *
        1.0;
    return FormInputFieldInfo.slider(
      id: getCategoryFieldKey(categoryName),
      type: SliderType.date,
      rangeSlider: true,
      range: (minValue, maxValue),
      label: categoryName,
      currentValues: (minValue, maxValue),
      validators: [],
      sectionName: SectionName.categories.name,
    );
  }

  FormInputFieldInfo getCategoriesTimeOfDaySliderField(
    String categoryName,
    Set<String> values,
  ) {
    final timeOfDayValues = values.map(DateHelper.timeOfDayToSeconds);
    final minValue = timeOfDayValues.reduce(min) * 1.0;
    final maxValue = timeOfDayValues.reduce(max) * 1.0;
    return FormInputFieldInfo.slider(
      id: getCategoryFieldKey(categoryName),
      type: SliderType.timeOfDay,
      rangeSlider: true,
      range: (minValue, maxValue),
      label: categoryName,
      currentValues: (minValue, maxValue),
      validators: [],
      sectionName: SectionName.categories.name,
    );
  }

  String getCategoryFieldKey(String category) {
    return '${FieldId.categoryvalue.name}-$category';
  }

  FormInputFieldInfo resetButton() {
    return FormInputFieldInfo.cancelButton(
      id: FieldId.cancel.name,
      label: 'Reset',
      sectionName: SectionName.submit.name,
      cancel: () {},
    );
  }

  void updateFilters(Map<String, dynamic> values) {
    DateTime? startDate;
    DateTime? endDate;
    double? maxDistance;

    if (values.containsKey(FieldId.startdate.name)) {
      startDate = values[FieldId.startdate.name] as DateTime?;
    }
    if (values.containsKey(FieldId.enddate.name)) {
      endDate = values[FieldId.enddate.name] as DateTime?;
    }
    if (values.containsKey(FieldId.distance.name)) {
      final d = (values[FieldId.distance.name] ?? distanceMax) as double;
      if (d != distanceMax) {
        maxDistance =
            convertDistanceToMeters(DistanceUnitOptions.kilometers, d);
      }
    }

    final categoryFilters = getRegularCategoryFilters(values);
    LoggerHelper.logger.i('$className: categoryFilters: $categoryFilters');

    final filters = Filters(
      itemName: values[FieldId.name.name] as String?,
      regularCategoryFilters: categoryFilters,
      dateCategoryFilters: getDateCategoryFilters(values),
      timeOfDayCategoryFilters: getTimeOfDayCategoryFilters(values),
      numericCategoryFilters: getNumericCategoryFilters(values),
      startDate: startDate,
      endDate: endDate,
      distance: maxDistance,
    );
    BlocProvider.of<FilterBloc>(context).add(UpdateFilters(filters));
  }

  List<MapEntry<String, T>> getConvertedCategories<T>(
    Map<String, dynamic> values,
    FilterType filterType,
    T Function(dynamic) converter,
  ) {
    final categoryValues = values.entries
        .where((entry) => entry.key.startsWith(FieldId.categoryvalue.name))
        .map((e) => (e.key.split('-')[1], e.value))
        .where((e) => widget.list.filterTypes[e.$1] == filterType)
        .toList();

    final categoryConvertedValues = categoryValues
        .map(
          (entry) => MapEntry(entry.$1, converter(entry.$2)),
        )
        .toList();
    return categoryConvertedValues;
  }

  Map<String, Set<String>> getRegularCategoryFilters(
    Map<String, dynamic> values,
  ) {
    final categoryConvertedValues = getConvertedCategories(
      values,
      FilterType.regular,
      (x) => x as List<String>,
    );

    final categoryFilters =
        CategoriesHelper.getAllCategoriesAndValuesForListOfCategories(
      categoryConvertedValues,
    );
    return categoryFilters;
  }

  Map<String, (int, int)> getDateCategoryFilters(
    Map<String, dynamic> values,
  ) {
    final categoryConvertedValues = getConvertedCategories(
      values,
      FilterType.dateRange,
      (x) => x as (int, int),
    );

    final dateCategoryFilters = Map.fromEntries(categoryConvertedValues);
    return dateCategoryFilters;
  }

  Map<String, (int, int)> getTimeOfDayCategoryFilters(
    Map<String, dynamic> values,
  ) {
    final categoryConvertedValues = getConvertedCategories(
      values,
      FilterType.timeOfDayRange,
      (x) => x as (int, int),
    );

    final timeOfDayCategoryFilters = Map.fromEntries(categoryConvertedValues);
    return timeOfDayCategoryFilters;
  }

  Map<String, (int, int)> getNumericCategoryFilters(
    Map<String, dynamic> values,
  ) {
    final categoryConvertedValues = getConvertedCategories(
      values,
      FilterType.numericRange,
      (x) => x as (int, int),
    );

    final numericCategoryFilters = Map.fromEntries(categoryConvertedValues);
    return numericCategoryFilters;
  }
}
