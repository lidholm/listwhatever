import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_location_response.freezed.dart';
part 'search_location_response.g.dart';


@freezed
class SearchLocationResponse with _$SearchLocationResponse {
  const factory SearchLocationResponse({
    required String address,
    required double lat,
    required double long,
    required String searchPhrase,
  }) = _SearchLocationResponse;

  factory SearchLocationResponse.fromJson(Map<String, Object?> json)
  => _$SearchLocationResponseFromJson(json);
}
