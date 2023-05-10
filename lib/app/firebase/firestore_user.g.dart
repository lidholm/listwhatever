// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirestoreUser _$$_FirestoreUserFromJson(Map<String, dynamic> json) =>
    _$_FirestoreUser(
      uid: json['uid'] as String,
      email: json['email'] as String,
      isAdmin: _fromJsonIsAdmin(json['isAdmin'] as bool?),
      settings: _fromJsonSettings(json['settings'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$$_FirestoreUserToJson(_$_FirestoreUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'isAdmin': _toJsonIsAdmin(instance.isAdmin),
      'settings': _toJsonSettings(instance.settings),
    };
