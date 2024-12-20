import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/components/border_with_header.dart';
import 'package:listwhatever/form/form_input_field_info.dart';
import 'package:listwhatever/form/form_input_field_single_slider.dart';

const String className = 'FormInputFieldDoubleSlider';

class FormInputFieldDoubleSlider extends StatelessWidget {
  const FormInputFieldDoubleSlider({required this.field, super.key});

  final FormInputFieldInfoSlider field;

  @override
  Widget build(BuildContext context) {
    return BorderWithHeader(
      title: field.label,
      child: FormBuilderField(
        name: field.id,
        key: Key(field.id),
        initialValue: field.currentValues,
        builder: (FormFieldState<(double, double)> formField) {
          var values = [field.currentValues!.$1, field.currentValues!.$2];
          if (formField.value != null) {
            values = [formField.value!.$1, formField.value!.$2];
          }
          return FlutterSlider(
            rangeSlider: true,
            values: values,
            min: field.range.$1,
            max: field.range.$2,
            step: FormInputFieldSingleSlider.getStep(field),
            tooltip: FormInputFieldSingleSlider.getTooltip(field),
            trackBar: FlutterSliderTrackBar(
              inactiveTrackBar: BoxDecoration(
                color: Colors.black12,
                border: Border.all(width: 3),
              ),
              activeTrackBar: const BoxDecoration(),
            ),
            onDragCompleted: (handlerIndex, lowerValue, upperValue) {
              formField.didChange((lowerValue, upperValue));
            },
          );
        },
      ),
    );
  }
}
