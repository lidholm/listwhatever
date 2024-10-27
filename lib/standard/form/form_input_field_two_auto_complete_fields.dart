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
    logger.i(
      '$className: build ${widget.field.id} - ${widget.field.currentValueLeft}',
    );
    final fieldWidth = widget.field.deletable ? 0.44 : 0.48;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: constraints.maxWidth * fieldWidth,
              child: FormBuilderTypeAhead<String>(
                key: Key(widget.field.id),
                name: widget.field.id,
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
            SizedBox(width: constraints.maxWidth * 0.02),
            SizedBox(
              width: constraints.maxWidth * fieldWidth,
              child: FormBuilderTypeAhead<String>(
                key: Key(widget.field.id),
                name: widget.field.id2,
                initialValue: widget.field.currentValueRight,
                suggestionsCallback: getSuggestionsRight,
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(item),
                  );
                },
              ),
            ),
            if (widget.field.deletable)
              IconButton(
                onPressed: widget.field.onDelete,
                icon: const Icon(Icons.delete),
                padding: const EdgeInsets.only(bottom: 6),
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
    return [
      ...optionsRight
          // .where((o) => o.startsWith(search))
          .where((e) => e.trim() != ''),
      search,
    ];
  }

  void onChangeLeft(String? value) {
    setState(() {
      optionsRight = widget.field.optionsRight[value]?.toList() ?? [];
    });
  }
}
