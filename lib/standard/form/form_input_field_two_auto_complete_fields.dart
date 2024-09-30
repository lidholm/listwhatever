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

  List<String> optionsLeft = [];
  List<String> optionsRight = [];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.48,
              child: FormBuilderTypeAhead<String>(
                name: widget.field.id,
                suggestionsCallback: getSuggestionsLeft,
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(item),
                  );
                },
                onSelected: widget.field.onChangeLeft,
              ),
            ),
            SizedBox(width: constraints.maxWidth * 0.04),
            SizedBox(
              width: constraints.maxWidth * 0.48,
              child: FormBuilderTypeAhead<String>(
                name: widget.field.id,
                suggestionsCallback: getSuggestionsRight,
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(item),
                  );
                },
                onSelected: widget.field.onChangeRight,
              ),
            ),
          ],
        );
      },
    );
  }

  FutureOr<List<String>> getSuggestionsLeft(String search) {
    setState(() {
      optionsLeft = [
        ...widget.field.optionsLeft
            .map((e) => e.toString())
            .where((e) => e.startsWith(search)),
        search,
      ];
    });
    return Future.value(optionsLeft);
  }

  FutureOr<List<String>> getSuggestionsRight(String search) {
    setState(() {
      optionsLeft = [
        ...widget.field.optionsRight
            .map((e) => e.toString())
            .where((e) => e.startsWith(search)),
        search,
      ];
    });
    return Future.value(optionsRight);
  }
}
