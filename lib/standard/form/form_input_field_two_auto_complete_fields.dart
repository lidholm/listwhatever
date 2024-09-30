import 'dart:async';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

const String className = 'FormInputFieldTwoAutoCompleteFields';

class FormInputFieldTwoAutoCompleteFields<T, S> extends StatefulWidget {
  const FormInputFieldTwoAutoCompleteFields({required this.field, super.key});

  final FormInputFieldInfoTwoAutoCompleteFields<T, S> field;

  @override
  State<FormInputFieldTwoAutoCompleteFields<T, S>> createState() =>
      _FormInputFieldTwoAutoCompleteFieldsState<T, S>();
}

class _FormInputFieldTwoAutoCompleteFieldsState<T, S>
    extends State<FormInputFieldTwoAutoCompleteFields<T, S>> {
  final fieldKey = GlobalKey<AutoCompleteTextFieldState<String>>();

  List<String> options = [];

  String leftValue = '';

  @override
  Widget build(BuildContext context) {
    return FormBuilderTypeAhead<String>(
      name: widget.field.id,
      suggestionsCallback: getSuggestions,
      itemBuilder: (context, city) {
        return ListTile(
          title: Text(city),
        );
      },
      onSelected: print,
    );
  }

  FutureOr<List<String>> getSuggestions(String search) {
    setState(() {
      options = [
        ...widget.field.optionsLeft
            .map((e) => e.toString())
            .where((e) => e.startsWith(search)),
        search,
      ];
    });
    return Future.value(options);
  }
}
