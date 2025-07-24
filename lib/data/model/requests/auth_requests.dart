import 'package:json_annotation/json_annotation.dart';

part 'auth_requests.g.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'password')
  final String password;

  LoginRequest({required this.email, required this.password});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
