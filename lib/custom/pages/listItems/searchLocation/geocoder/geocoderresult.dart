// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'addresscomponent.dart';
import 'geometry.dart';
import 'pluscode.dart';

part 'geocoderresult.freezed.dart';
part 'geocoderresult.g.dart';

@freezed
class GeocoderResult with _$GeocoderResult {
  factory GeocoderResult({
    @JsonKey(name: 'address_components')
    required List<AddressComponent> addressComponents,
    @JsonKey(name: 'formatted_address') required String formattedAddress,
    required Geometry geometry,
    @JsonKey(name: 'partial_match') required bool partialMatch,
    @JsonKey(name: 'place_id') required String placeId,
    @JsonKey(name: 'plus_code') required PlusCode plusCode,
    required List<String> types,
    @Default('') String searchPhrase,
  }) = _GeocoderResult;

  factory GeocoderResult.fromJson(Map<String, dynamic> json) =>
      _$GeocoderResultFromJson(json);
}
