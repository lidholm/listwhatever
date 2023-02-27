// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'addresscomponent.freezed.dart';
part 'addresscomponent.g.dart';

@freezed
class AddressComponent with _$AddressComponent {
  factory AddressComponent({
    @JsonKey(name: 'long_name') required String longName,
    @JsonKey(name: 'short_name') required String shortName,
    required List<String> types,
  }) = _AddressComponent;

  factory AddressComponent.fromJson(Map<String, dynamic> json) => _$AddressComponentFromJson(json);
}
