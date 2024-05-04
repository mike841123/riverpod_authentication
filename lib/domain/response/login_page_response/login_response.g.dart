// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      msg: json['msg'] as String? ?? "",
      code: (json['code'] as num?)?.toInt() ?? 1,
      data: json['data'] == null
          ? null
          : LoginResult.fromJson(json['data'] as Map<String, dynamic>),
      extend: json['extend'],
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'msg': instance.msg,
      'code': instance.code,
      'data': instance.data,
      'extend': instance.extend,
    };

LoginResult _$LoginResultFromJson(Map<String, dynamic> json) => LoginResult(
      access_token: json['access_token'] as String?,
      expires_in: (json['expires_in'] as num?)?.toInt(),
      refresh_token: json['refresh_token'] as String?,
      scope: json['scope'] as String?,
      token_type: json['token_type'] as String?,
    );

Map<String, dynamic> _$LoginResultToJson(LoginResult instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'expires_in': instance.expires_in,
      'refresh_token': instance.refresh_token,
      'scope': instance.scope,
      'token_type': instance.token_type,
    };
