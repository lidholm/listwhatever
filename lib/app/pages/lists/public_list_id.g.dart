// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_list_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PublicListId _$$_PublicListIdFromJson(Map<String, dynamic> json) =>
    _$_PublicListId(
      path: json['path'] as String,
      publicListId: json['publicListId'] as String,
      editors: Map<String, bool>.from(json['editors'] as Map),
      viewers: Map<String, bool>.from(json['viewers'] as Map),
      userId: json['userId'] as String,
      listId: json['listId'] as String,
    );

Map<String, dynamic> _$$_PublicListIdToJson(_$_PublicListId instance) =>
    <String, dynamic>{
      'path': instance.path,
      'publicListId': instance.publicListId,
      'editors': instance.editors,
      'viewers': instance.viewers,
      'userId': instance.userId,
      'listId': instance.listId,
    };
