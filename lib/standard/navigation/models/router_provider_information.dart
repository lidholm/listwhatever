import 'package:freezed_annotation/freezed_annotation.dart';

part 'router_provider_information.freezed.dart';

@freezed
class RouterProviderInformation with _$RouterProviderInformation {
  const factory RouterProviderInformation({
    required List<String> dontRequireLoginRouteLocations,
    required List<String> requireLoginRouteLocations,
    required String initialRouteLocation,
    required String signUpRouteLocation,
    required String signInRouteLocation,
    required String errorLoadingUserRouteLocation,
    required String loadingUserRouteLocation,
  }) = _RouterProviderInformation;
}
