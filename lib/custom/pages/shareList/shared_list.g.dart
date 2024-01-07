// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shared_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SharedListImpl _$$SharedListImplFromJson(Map<String, dynamic> json) =>
    _$SharedListImpl(
      id: json['id'] as String?,
      listName: json['listName'] as String,
      ownerName: json['ownerName'] as String,
      ownerUserId: json['ownerUserId'] as String,
      ownerListId: json['ownerListId'] as String,
      shareType: $enumDecode(_$ShareTypeEnumMap, json['shareType']),
      listType: $enumDecode(_$ListTypeEnumMap, json['listType']),
    );

Map<String, dynamic> _$$SharedListImplToJson(_$SharedListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listName': instance.listName,
      'ownerName': instance.ownerName,
      'ownerUserId': instance.ownerUserId,
      'ownerListId': instance.ownerListId,
      'shareType': _$ShareTypeEnumMap[instance.shareType]!,
      'listType': _$ListTypeEnumMap[instance.listType]!,
    };

const _$ShareTypeEnumMap = {
  ShareType.viewer: 'viewer',
  ShareType.editor: 'editor',
};

const _$ListTypeEnumMap = {
  ListType.restaurants: 'restaurants',
  ListType.food: 'food',
  ListType.activities: 'activities',
  ListType.movies: 'movies',
  ListType.other: 'other',
};
