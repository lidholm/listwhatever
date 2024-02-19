// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirestoreUserImpl _$$FirestoreUserImplFromJson(Map<String, dynamic> json) =>
    _$FirestoreUserImpl(
      name: json['name'] as String,
      settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$FirestoreUserImplToJson(_$FirestoreUserImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'settings': instance.settings.toJson(),
      'id': instance.id,
    };
