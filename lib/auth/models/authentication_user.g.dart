// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationUserImpl _$$AuthenticationUserImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationUserImpl(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      isNewUser: json['isNewUser'] as bool,
    );

Map<String, dynamic> _$$AuthenticationUserImplToJson(
        _$AuthenticationUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'photo': instance.photo,
      'isNewUser': instance.isNewUser,
    };
