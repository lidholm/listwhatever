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
      userId: json['userId'] as String,
      withMap: json['withMap'] as bool? ?? false,
      withDates: json['withDates'] as bool? ?? false,
      withTimes: json['withTimes'] as bool? ?? false,
      publicListId: json['publicListId'] == null
          ? null
          : _fromJsonPublicListId(json['publicListId'] as String),
      shareCodeForViewer: json['shareCodeForViewer'] as String? ?? null,
      shareCodeForEditor: json['shareCodeForEditor'] as String? ?? null,
      viewers: (json['viewers'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const <UserId, bool>{},
      editors: (json['editors'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as bool),
          ) ??
          const <UserId, bool>{},
      shared: json['shared'] as bool? ?? false,
      isViewer: json['isViewer'] as bool? ?? false,
      isEditor: json['isEditor'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ListOfThingsToJson(_$_ListOfThings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$ListTypeEnumMap[instance.type]!,
      'userId': instance.userId,
      'withMap': instance.withMap,
      'withDates': instance.withDates,
      'withTimes': instance.withTimes,
      'publicListId': _toJsonPublicListId(instance.publicListId),
      'shareCodeForViewer': instance.shareCodeForViewer,
      'shareCodeForEditor': instance.shareCodeForEditor,
      'viewers': instance.viewers,
      'editors': instance.editors,
      'shared': instance.shared,
      'isViewer': instance.isViewer,
      'isEditor': instance.isEditor,
    };

const _$ListTypeEnumMap = {
  ListType.restaurants: 'restaurants',
  ListType.food: 'food',
  ListType.activities: 'activities',
  ListType.movies: 'movies',
  ListType.other: 'other',
};
