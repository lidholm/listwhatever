import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listwhatever/standard/widgets/vStack/x_stack.dart';

part 'form_input_section.freezed.dart';

@freezed
class FormInputSection with _$FormInputSection {
  factory FormInputSection({
    required String name,
    required AxisDirection direction,
    required bool showBorder,
  }) = _FormInputSection;
}
