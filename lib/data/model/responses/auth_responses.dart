import 'package:json_annotation/json_annotation.dart';

part 'auth_responses.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'credentials')
  final LoginCredentialsResponse credentials;

  @JsonKey(name: 'user')
  final LoginUserResponse user;

  LoginResponse({required this.user, required this.credentials});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class LoginUserResponse {
  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'email')
  final String email;

  LoginUserResponse({required this.name, required this.email});

  factory LoginUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginUserResponseToJson(this);
}

@JsonSerializable()
class LoginCredentialsResponse {
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  // final int refreshExpiresIn;
  final String sessionId;

  LoginCredentialsResponse({
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.sessionId,
  });

  factory LoginCredentialsResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginCredentialsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginCredentialsResponseToJson(this);
}
