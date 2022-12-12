// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_vo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestVO _$LoginRequestVOFromJson(Map<String, dynamic> json) =>
    LoginRequestVO(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$LoginRequestVOToJson(LoginRequestVO instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
