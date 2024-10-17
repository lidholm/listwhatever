import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/form/form_generator.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/form/form_input_section.dart';

import '/custom/pages/listItems/filters/filters.dart';
import '/custom/pages/listItems/models/list_item.dart';
import '/custom/pages/lists/models/list_of_things.dart';
import '/standard/settings/settings.dart';
import '/standard/widgets/vStack/x_stack.dart' as x_stack;
import 'bloc/filter_bloc.dart';
import 'bloc/filter_event.dart';

const String className = 'FilterView';

enum SectionName {
  dates._('dates'),
  distance._('distance'),
  categories._('categories'),
  submit._('submit');

  const SectionName._(this.value);

  final String value;
}

enum FieldId {
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
    logger.i('$className listItems: ${widget.listItems}');

    final fields = [
      startDateInputField(),
      endDateInputField(),
      distanceInputField(),
      ...categoriesFields(getCategories(widget.listItems)),
      cancelButton(),
      submitButton(),
    ];
    logger.i('fields: ${fields.length}');

    final sections = getSections();

    final formGenerator = FormGenerator(
      formKey: _formKey,
      sections: sections,
      fields: fields,
      focusFieldName: FieldId.submit.name,
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
        name: SectionName.dates.name,
        direction: x_stack.AxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.distance.name,
        direction: x_stack.AxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.categories.name,
        direction: x_stack.AxisDirection.vertical,
        showBorder: true,
      ),
      FormInputSection(
        name: SectionName.submit.name,
        direction: x_stack.AxisDirection.horizontal,
        showBorder: false,
      ),
    ];
  }

  FormInputFieldInfo startDateInputField() {
    return FormInputFieldInfo.date(
      id: FieldId.startdate.name,
      label: 'Start date',
      currentValue: DateTime.now(),
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
      currentValue: DateTime.now(),
      inputType: widget.list.withTimes ? InputType.both : InputType.date,
      validator: (e) => null,
      sectionName: SectionName.dates.name,
    );
  }

  FormInputFieldInfo distanceInputField() {
    return FormInputFieldInfo.slider(
      id: FieldId.distance.name,
      label: 'End date',
      currentValue: 0,
      range: (distanceMin, distanceMax),
      validators: [],
      sectionName: SectionName.distance.name,
    );
  }

  List<FormInputFieldInfo> categoriesFields(
    Map<String, Set<String>> categories,
  ) {
    logger.i('$className categories: $categories');
    final chipsFields = mapIndexed(categories.entries)
        .map(
          (e) => FormInputFieldInfo.chips(
            id: getCategoryFieldKey(e.$2.key, e.$1),
            label: e.$2.key,
            currentValue: [],
            values: e.$2.value,
            validators: [],
            sectionName: SectionName.categories.name,
          ),
        )
        .toList();

    return chipsFields;
  }

  String getCategoryFieldKey(String category, int index) {
    return '${FieldId.categoryvalue.name}-$category-$index';
  }

  String getCategoryName(String categoryFieldKey) {
    return categoryFieldKey.substring(
        categoryFieldKey.indexOf('-') + 1, categoryFieldKey.lastIndexOf('-'));
  }

  FormInputFieldInfo cancelButton() {
    return FormInputFieldInfo.cancelButton(
      id: FieldId.cancel.name,
      label: 'Cancel',
      sectionName: SectionName.submit.name,
      cancel: () {
        print('cancelled');
      },
    );
  }

  FormInputFieldInfo submitButton() {
    return FormInputFieldInfo.submitButton(
      id: FieldId.submit.name,
      label: 'Submit',
      sectionName: SectionName.submit.name,
      save: (Map<String, dynamic>? values) {
        print('save');
        if (values == null) {
          print('No values to save');
          return;
        }
        updateFilters(values);
      },
    );
  }

  void updateFilters(Map<String, dynamic> values) {
    final categoryFilters = <String, List<String>>{};
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
    for (final value in values.entries) {
      if ([FieldId.startdate.name, FieldId.enddate.name, FieldId.distance.name]
          .contains(value.key)) {
        continue;
      }
      logger.i('$className value: $value');

      categoryFilters[getCategoryName(value.key)] =
          (value.value as List<String>?) ?? [];
    }
    logger.i('$className: categoryFilters: $categoryFilters');

    final filters = Filters(
      categoryFilters: categoryFilters,
      startDate: startDate,
      endDate: endDate,
      distance: maxDistance,
    );
    BlocProvider.of<FilterBloc>(context).add(UpdateFilters(filters));
  }
}
