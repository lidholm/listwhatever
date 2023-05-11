// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CurrentUser _$$_CurrentUserFromJson(Map<String, dynamic> json) =>
    _$_CurrentUser(
      uid: json['uid'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      isAdmin: _fromJsonIsAdmin(json['isAdmin'] as bool?),
      settings: _fromJsonSettings(json['settings'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_CurrentUserToJson(_$_CurrentUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'name': instance.name,
      'isAdmin': _toJsonIsAdmin(instance.isAdmin),
      'settings': _toJsonSettings(instance.settings),
    };
