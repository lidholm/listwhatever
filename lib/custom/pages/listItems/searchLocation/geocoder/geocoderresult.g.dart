// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoderresult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GeocoderResult _$$_GeocoderResultFromJson(Map<String, dynamic> json) =>
    _$_GeocoderResult(
      addressComponents: (json['address_components'] as List<dynamic>)
          .map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      formattedAddress: json['formatted_address'] as String,
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      partialMatch: json['partial_match'] as bool,
      placeId: json['place_id'] as String,
      plusCode: PlusCode.fromJson(json['plus_code'] as Map<String, dynamic>),
      types: (json['types'] as List<dynamic>).map((e) => e as String).toList(),
      searchPhrase: json['searchPhrase'] as String? ?? '',
    );

Map<String, dynamic> _$$_GeocoderResultToJson(_$_GeocoderResult instance) =>
    <String, dynamic>{
      'address_components':
          instance.addressComponents.map((e) => e.toJson()).toList(),
      'formatted_address': instance.formattedAddress,
      'geometry': instance.geometry.toJson(),
      'partial_match': instance.partialMatch,
      'place_id': instance.placeId,
      'plus_code': instance.plusCode.toJson(),
      'types': instance.types,
      'searchPhrase': instance.searchPhrase,
    };
