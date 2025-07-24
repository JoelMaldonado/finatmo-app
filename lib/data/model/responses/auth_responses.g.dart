// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user: LoginUserResponse.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: LoginTokenResponse.fromJson(
        json['accessToken'] as Map<String, dynamic>,
      ),
      refreshToken: LoginTokenResponse.fromJson(
        json['refreshToken'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };

LoginUserResponse _$LoginUserResponseFromJson(Map<String, dynamic> json) =>
    LoginUserResponse(name: json['name'] as String);

Map<String, dynamic> _$LoginUserResponseToJson(LoginUserResponse instance) =>
    <String, dynamic>{'name': instance.name};

LoginTokenResponse _$LoginTokenResponseFromJson(Map<String, dynamic> json) =>
    LoginTokenResponse(
      token: json['token'] as String,
      expiresIn: (json['expiresIn'] as num).toInt(),
    );

Map<String, dynamic> _$LoginTokenResponseToJson(LoginTokenResponse instance) =>
    <String, dynamic>{'token': instance.token, 'expiresIn': instance.expiresIn};
