// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_things.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ListOfThings _$$_ListOfThingsFromJson(Map<String, dynamic> json) =>
    _$_ListOfThings(
      id: json['id'] as String?,
      name: json['name'] as String,
      type: $enumDecode(_$ListTypeEnumMap, json['type']),
      withMap: json['withMap'] as bool? ?? false,
      withDates: json['withDates'] as bool? ?? false,
      withTimes: json['withTimes'] as bool? ?? false,
      shareCode: json['shareCode'] == null
          ? null
          : _fromJsonShareCode(json['shareCode'] as String),
    );

Map<String, dynamic> _$$_ListOfThingsToJson(_$_ListOfThings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ListTypeEnumMap[instance.type]!,
      'withMap': instance.withMap,
      'withDates': instance.withDates,
      'withTimes': instance.withTimes,
      'shareCode': _toJsonShareCode(instance.shareCode),
    };

const _$ListTypeEnumMap = {
  ListType.restaurants: 'restaurants',
  ListType.food: 'food',
  ListType.activities: 'activities',
  ListType.movies: 'movies',
  ListType.other: 'other',
};
