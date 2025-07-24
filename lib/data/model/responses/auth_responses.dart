import 'package:json_annotation/json_annotation.dart';

part 'auth_responses.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'user')
  final LoginUserResponse user;

  @JsonKey(name: 'accessToken')
  final LoginTokenResponse accessToken;

  @JsonKey(name: 'refreshToken')
  final LoginTokenResponse refreshToken;

  LoginResponse({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginUserResponse {
  @JsonKey(name: 'name')
  final String name;

  LoginUserResponse({required this.name});

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserResponseToJson(this);
}

@JsonSerializable()
class LoginTokenResponse {
  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'expiresIn')
  final int expiresIn;

  LoginTokenResponse({required this.token, required this.expiresIn});

  factory LoginTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginTokenResponseToJson(this);
}
