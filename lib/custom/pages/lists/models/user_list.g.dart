// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserListImpl _$$UserListImplFromJson(Map<String, dynamic> json) =>
    _$UserListImpl(
      id: json['id'] as String?,
      listId: json['listId'] as String,
      listName: json['listName'] as String,
      listType: $enumDecode(_$ListTypeEnumMap, json['listType']),
      ownerId: json['ownerId'] as String,
      isOwnList: json['isOwnList'] as bool?,
    );

Map<String, dynamic> _$$UserListImplToJson(_$UserListImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listId': instance.listId,
      'listName': instance.listName,
      'listType': _$ListTypeEnumMap[instance.listType]!,
      'ownerId': instance.ownerId,
      'isOwnList': instance.isOwnList,
    };

const _$ListTypeEnumMap = {
  ListType.restaurants: 'restaurants',
  ListType.food: 'food',
  ListType.activities: 'activities',
  ListType.movies: 'movies',
  ListType.other: 'other',
};
