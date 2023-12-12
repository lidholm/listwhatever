// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchLocationResponse _$$_SearchLocationResponseFromJson(
        Map<String, dynamic> json) =>
    _$_SearchLocationResponse(
      address: json['address'] as String,
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      searchPhrase: json['searchPhrase'] as String,
    );

Map<String, dynamic> _$$_SearchLocationResponseToJson(
        _$_SearchLocationResponse instance) =>
    <String, dynamic>{
      'address': instance.address,
      'lat': instance.lat,
      'long': instance.long,
      'searchPhrase': instance.searchPhrase,
    };
