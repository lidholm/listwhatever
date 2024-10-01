import 'dart:async';

import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

const String className = 'FormInputFieldTwoAutoCompleteFields';

class FormInputFieldTwoAutoCompleteFields extends StatefulWidget {
  const FormInputFieldTwoAutoCompleteFields({required this.field, super.key});

  final FormInputFieldInfoTwoAutoCompleteFields field;

  @override
  State<FormInputFieldTwoAutoCompleteFields> createState() =>
      _FormInputFieldTwoAutoCompleteFieldsState();
}

class _FormInputFieldTwoAutoCompleteFieldsState
    extends State<FormInputFieldTwoAutoCompleteFields> {
  final fieldKey = GlobalKey<AutoCompleteTextFieldState<String>>();

  List<String> optionsLeft = [];
  List<String> optionsRight = [];

  @override
  void initState() {
    super.initState();
    optionsLeft = widget.field.optionsLeft;
    optionsRight = [];
  }

  @override
  Widget build(BuildContext context) {
    logger.i('$className: build');
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.48,
              child: FormBuilderTypeAhead<String>(
                name: widget.field.idLeft,
                initialValue: widget.field.currentValueLeft,
                suggestionsCallback: getSuggestionsLeft,
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(item),
                  );
                },
                onChanged: onChangeLeft,
              ),
            ),
            SizedBox(width: constraints.maxWidth * 0.04),
            SizedBox(
              width: constraints.maxWidth * 0.48,
              child: FormBuilderTypeAhead<String>(
                name: widget.field.idRight,
                initialValue: widget.field.currentValueRight,
                suggestionsCallback: getSuggestionsRight,
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(item),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  FutureOr<List<String>> getSuggestionsLeft(String search) {
    return [
      ...widget.field.optionsLeft, //.where((e) => e.startsWith(search)),
      search,
    ].where((e) => e.trim() != '').toSet().toList();
  }

  FutureOr<List<String>> getSuggestionsRight(String search) {
    return optionsRight
        // .where((o) => o.startsWith(search))
        .where((e) => e.trim() != '')
        .toList();
  }

  void onChangeLeft(String? value) {
    setState(() {
      optionsRight = widget.field.optionsRight[value]?.toList() ?? [];
    });
  }
}
