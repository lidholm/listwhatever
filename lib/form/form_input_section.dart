import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_input_section.freezed.dart';

@freezed
class FormInputSection with _$FormInputSection {
  factory FormInputSection({
    required String name,
    required FormAxisDirection direction,
    required bool showBorder,
  }) = _FormInputSection;
}
