// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userName: json['userName'] as String,
      id: json['id'] as String,
      token: json['token'] as String,
      email: json['email'] as String,
      fullName: json['fullName'] as String? ?? '',
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
      dateCreated: json['dateCreated'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'email': instance.email,
      'userName': instance.userName,
      'id': instance.id,
      'dateCreated': instance.dateCreated,
      'token': instance.token,
      'roles': instance.roles,
    };
