import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

const String className = 'FormInputFieldSlider';

class FormInputFieldChips extends StatelessWidget {
  const FormInputFieldChips({required this.field, super.key});

  final FormInputFieldInfoChips field;

  @override
  Widget build(BuildContext context) {
    return FormBuilderFilterChip<String>(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: field.label,
      ),
      name: field.id,
      onChanged: (List<String>? selected) {
        // final chips = selected?.map((s) => '$categoryName-$s').toSet();
        // context.read<SelectedChipsCubit>().update(chips ?? <String>{});
      },
      spacing: 8,
      selectedColor: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColor.withAlpha(100),
      options: field.values.map(
        (c) {
          const iconText = 'S';
          // isSelected(categoryName, c, selectedChips) ? '' : c[0];
          return FormBuilderChipOption<String>(
            value: c,
            avatar: const CircleAvatar(
              // backgroundColor: mainColor,
              child: Text(iconText),
            ),
          );
        },
      ).toList(),
    );
  }
}
