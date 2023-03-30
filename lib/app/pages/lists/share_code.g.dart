// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShareCode _$$_ShareCodeFromJson(Map<String, dynamic> json) => _$_ShareCode(
      path: json['path'] as String,
      shareCode: json['shareCode'] as String,
      users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
      userId: json['userId'] as String,
      listId: json['listId'] as String,
    );

Map<String, dynamic> _$$_ShareCodeToJson(_$_ShareCode instance) =>
    <String, dynamic>{
      'path': instance.path,
      'shareCode': instance.shareCode,
      'users': instance.users,
      'userId': instance.userId,
      'listId': instance.listId,
    };
