// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchLocationResponseImpl _$$SearchLocationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchLocationResponseImpl(
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      searchPhrase: json['searchPhrase'] as String,
    );

Map<String, dynamic> _$$SearchLocationResponseImplToJson(
        _$SearchLocationResponseImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'lat': instance.lat,
      'long': instance.long,
      'searchPhrase': instance.searchPhrase,
    };
