// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      photo: json['photo'] as String,
      isNewUser: json['isNewUser'] as bool,
      settings: Settings.fromJson(json['settings'] as Map<String, dynamic>),
      hasLoadedFromFirestore: json['hasLoadedFromFirestore'] as bool,
      anonymous: json['anonymous'] as bool,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'photo': instance.photo,
      'isNewUser': instance.isNewUser,
      'settings': instance.settings.toJson(),
      'hasLoadedFromFirestore': instance.hasLoadedFromFirestore,
      'anonymous': instance.anonymous,
    };
