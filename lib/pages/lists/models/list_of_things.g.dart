// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_of_things.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListOfThingsImpl _$$ListOfThingsImplFromJson(Map<String, dynamic> json) =>
    _$ListOfThingsImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      withMap: json['withMap'] as bool,
      withDates: json['withDates'] as bool,
      withTimes: json['withTimes'] as bool,
      shared: json['shared'] as bool,
      sharedWith: (json['sharedWith'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, $enumDecode(_$ShareTypeEnumMap, e)),
      ),
      ownerId: json['ownerId'] as String?,
      filterTypes: (json['filterTypes'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, $enumDecode(_$FilterTypeEnumMap, e)),
          ) ??
          const {},
      imageFilename: json['imageFilename'] as String? ?? null,
      shareCodeForViewer: json['shareCodeForViewer'] as String? ?? null,
      shareCodeForEditor: json['shareCodeForEditor'] as String? ?? null,
      shareType: $enumDecodeNullable(_$ShareTypeEnumMap, json['shareType']) ??
          ShareType.viewer,
    );

Map<String, dynamic> _$$ListOfThingsImplToJson(_$ListOfThingsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'withMap': instance.withMap,
      'withDates': instance.withDates,
      'withTimes': instance.withTimes,
      'shared': instance.shared,
      'sharedWith': instance.sharedWith
          .map((k, e) => MapEntry(k, _$ShareTypeEnumMap[e]!)),
      'ownerId': instance.ownerId,
      'filterTypes': instance.filterTypes
          .map((k, e) => MapEntry(k, _$FilterTypeEnumMap[e]!)),
      'imageFilename': instance.imageFilename,
      'shareCodeForViewer': instance.shareCodeForViewer,
      'shareCodeForEditor': instance.shareCodeForEditor,
      'shareType': _$ShareTypeEnumMap[instance.shareType]!,
    };

const _$ShareTypeEnumMap = {
  ShareType.viewer: 'viewer',
  ShareType.editor: 'editor',
};

const _$FilterTypeEnumMap = {
  FilterType.regular: 'regular',
  FilterType.numericRange: 'numericRange',
  FilterType.dateRange: 'dateRange',
  FilterType.timeOfDayRange: 'timeOfDayRange',
};
