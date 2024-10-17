import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';

const String className = 'FormInputFieldSlider';

class FormInputFieldSlider extends StatelessWidget {
  const FormInputFieldSlider({required this.field, super.key});

  final FormInputFieldInfoSlider field;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField(
      name: field.id,
      key: Key(field.id),
      builder: (FormFieldState<double> formField) {
        // logger.i('$className => field: $field');
        return FlutterSlider(
          values: [formField.value ?? field.currentValue],
          min: field.range.$1,
          max: field.range.$2,
          handler: FlutterSliderHandler(
            decoration: const BoxDecoration(),
            child: const Icon(
              Icons.circle,
              // color: mainColor,
              size: 31,
            ),
          ),
          tooltip: FlutterSliderTooltip(
            format: (s) => s == '${field.range.$2}' ? '∞' : s,
          ),
          trackBar: FlutterSliderTrackBar(
            inactiveTrackBar: BoxDecoration(
              color: Colors.black12,
              border: Border.all(width: 3), //, color: shadedMainColor),
            ),
            activeTrackBar: const BoxDecoration(), //color: mainColor),
          ),
          onDragCompleted: (handlerIndex, lowerValue, upperValue) {
            final distanceValue = lowerValue as double;
            formField.didChange(distanceValue);
          },
        );
      },
    );
  }
}
