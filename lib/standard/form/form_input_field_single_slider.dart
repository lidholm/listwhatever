import 'package:another_xlider/another_xlider.dart';
import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/slider_step.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:listwhatever/standard/form/form_input_field_info.dart';
import 'package:listwhatever/standard/helpers/date_format_helper.dart';
import 'package:listwhatever/standard/helpers/date_helper.dart';

const String className = 'FormInputFieldSingleSlider';

class FormInputFieldSingleSlider extends StatelessWidget {
  const FormInputFieldSingleSlider({required this.field, super.key});

  final FormInputFieldInfoSlider field;

  @override
  Widget build(BuildContext context) {
    final initialValue = field.currentValue ?? field.range.$2;

    return FormBuilderField(
      name: field.id,
      key: Key(field.id),
      initialValue: initialValue,
      builder: (FormFieldState<double> formField) {
        var values = <double>[initialValue];
        if (formField.value != null) {
          values = [formField.value!];
        }

        // LoggerHelper.logger.i('$className => field: $field');
        return FlutterSlider(
          values: values,
          min: field.range.$1,
          max: field.range.$2,
          step: getStep(field),
          handler: FlutterSliderHandler(
            decoration: const BoxDecoration(),
            child: const Icon(
              Icons.circle,
              size: 31,
            ),
          ),
          tooltip: getTooltip(field),
          trackBar: FlutterSliderTrackBar(
            inactiveTrackBar: BoxDecoration(
              color: Colors.black12,
              border: Border.all(width: 3),
            ),
            activeTrackBar: const BoxDecoration(),
          ),
          onDragCompleted: (handlerIndex, lowerValue, upperValue) {
            final distanceValue = lowerValue as double;
            formField.didChange(distanceValue);
          },
        );
      },
    );
  }

  static FlutterSliderStep getStep(FormInputFieldInfoSlider field) {
    return switch (field.type) {
      SliderType.numeric => const FlutterSliderStep(),
      SliderType.date => const FlutterSliderStep(step: 86400),
      SliderType.timeOfDay => const FlutterSliderStep(step: 60),
    };
  }

  static FlutterSliderTooltip getTooltip(FormInputFieldInfoSlider field) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
    return switch (field.type) {
      SliderType.numeric => FlutterSliderTooltip(
          textStyle: textStyle,
          format: (s) => s == '${field.range.$2}' ? '∞' : s,
        ),
      SliderType.date => FlutterSliderTooltip(
          textStyle: textStyle,
          format: (s) {
            final date = DateTime.fromMillisecondsSinceEpoch(int.parse(s));
            return DateFormatHelper.formatReadableDate(
              date,
              DateFormatType.iso8601,
            );
          },
        ),
      SliderType.timeOfDay => FlutterSliderTooltip(
          textStyle: textStyle,
          format: (s) {
            return DateHelper.secondsToTimeOfDayString(int.parse(s));
          },
        ),
    };
  }
}
