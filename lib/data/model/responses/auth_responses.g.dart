// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user: LoginUserResponse.fromJson(json['user'] as Map<String, dynamic>),
      credentials: LoginCredentialsResponse.fromJson(
        json['credentials'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'credentials': instance.credentials,
      'user': instance.user,
    };

LoginUserResponse _$LoginUserResponseFromJson(Map<String, dynamic> json) =>
    LoginUserResponse(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$LoginUserResponseToJson(LoginUserResponse instance) =>
    <String, dynamic>{'name': instance.name, 'email': instance.email};

LoginCredentialsResponse _$LoginCredentialsResponseFromJson(
  Map<String, dynamic> json,
) => LoginCredentialsResponse(
  accessToken: json['accessToken'] as String,
  expiresIn: (json['expiresIn'] as num).toInt(),
  refreshToken: json['refreshToken'] as String,
  sessionId: json['sessionId'] as String,
);

Map<String, dynamic> _$LoginCredentialsResponseToJson(
  LoginCredentialsResponse instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'expiresIn': instance.expiresIn,
  'refreshToken': instance.refreshToken,
  'sessionId': instance.sessionId,
};
