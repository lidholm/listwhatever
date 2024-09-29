import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/constants.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:tuple/tuple.dart';

const String className = 'FormInputFieldTwoAutoCompleteFields';

class FormInputFieldTwoAutoCompleteFields<T, S> extends StatelessWidget {
  const FormInputFieldTwoAutoCompleteFields({required this.field, super.key});

  final FormInputFieldInfoTwoAutoCompleteFields<T, S> field;

  @override
  Widget build(BuildContext context) {
    logger.i('$className: build');
    final fieldKey = GlobalKey<AutoCompleteTextFieldState<String>>();

    final fields = FormBuilderField<Tuple2<String, String>>(
      name: field.id,
      key: fieldKey,
      builder: (FormFieldState<Tuple2<String, String>> formField) {
        return Row(
          children: [
            Expanded(child: getLeftField(formField)),
            const SizedBox(
              width: 20,
            ),
            Expanded(child: getRightField(formField)),
          ],
        );
      },
    );

    return fields;
  }

  SimpleAutoCompleteTextField getLeftField(
    FormFieldState<Tuple2<String, String>> formField,
  ) {
    final leftKey = GlobalKey<AutoCompleteTextFieldState<String>>();
    final before = formField.value;

    return SimpleAutoCompleteTextField(
      key: leftKey,
      decoration: const InputDecoration(errorText: 'Beans'),
      controller: TextEditingController(
        text: before?.item1 ?? field.currentValueLeft.toString(),
      ),
      suggestions: field.optionsLeft.map((e) => e.toString()).toList(),
      textChanged: (text) {
        print('left text changed: $text');
        final after = Tuple2<String, String>(before?.item1 ?? '', text);
        // formField.didChange(after);
      },
    );
  }

  SimpleAutoCompleteTextField getRightField(
    FormFieldState<Tuple2<String, String>> formField,
  ) {
    final rightKey = GlobalKey<AutoCompleteTextFieldState<String>>();

    final before = formField.value;
    print('right before: $before');
    return SimpleAutoCompleteTextField(
      key: rightKey,
      decoration: const InputDecoration(errorText: 'Beans'),
      controller: TextEditingController(
        text: before?.item2 ?? field.currentValueRight.toString(),
      ),
      suggestions: field.optionsRight.map((e) => e.toString()).toList(),
      textChanged: (text) {
        print('right text changed: $text');
        final after = Tuple2<String, String>(text, before?.item2 ?? '');
        formField.didChange(after);
      },
    );
  }
}
