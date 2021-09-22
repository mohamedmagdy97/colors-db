// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userName: json['userName'] as String,
      id: json['id'] as String,
      token: json['token'] as String,
      lang: json['lang'] as String,
      type: json['type'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userName': instance.userName,
      'id': instance.id,
      'token': instance.token,
      'lang': instance.lang,
      'type': instance.type,
    };
