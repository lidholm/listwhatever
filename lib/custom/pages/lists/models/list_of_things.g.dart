// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_things.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListOfThingsImpl _$$ListOfThingsImplFromJson(Map<String, dynamic> json) =>
    _$ListOfThingsImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      listType: $enumDecode(_$ListTypeEnumMap, json['listType']),
      imageFilename: json['imageFilename'] as String,
      withMap: json['withMap'] as bool,
      withDates: json['withDates'] as bool,
      withTimes: json['withTimes'] as bool,
      shared: json['shared'] as bool,
      shareCodeForViewer: json['shareCodeForViewer'] as String?,
      shareCodeForEditor: json['shareCodeForEditor'] as String?,
      sharedWith: (json['sharedWith'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, $enumDecode(_$ShareTypeEnumMap, e)),
      ),
      ownerId: json['ownerId'] as String?,
      shareType: $enumDecodeNullable(_$ShareTypeEnumMap, json['shareType']) ??
          ShareType.viewer,
    );

Map<String, dynamic> _$$ListOfThingsImplToJson(_$ListOfThingsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'listType': _$ListTypeEnumMap[instance.listType]!,
      'imageFilename': instance.imageFilename,
      'withMap': instance.withMap,
      'withDates': instance.withDates,
      'withTimes': instance.withTimes,
      'shared': instance.shared,
      'shareCodeForViewer': instance.shareCodeForViewer,
      'shareCodeForEditor': instance.shareCodeForEditor,
      'sharedWith': instance.sharedWith
          .map((k, e) => MapEntry(k, _$ShareTypeEnumMap[e]!)),
      'ownerId': instance.ownerId,
      'shareType': _$ShareTypeEnumMap[instance.shareType]!,
    };

const _$ListTypeEnumMap = {
  ListType.restaurants: 'restaurants',
  ListType.food: 'food',
  ListType.activities: 'activities',
  ListType.movies: 'movies',
  ListType.other: 'other',
};

const _$ShareTypeEnumMap = {
  ShareType.viewer: 'viewer',
  ShareType.editor: 'editor',
};
