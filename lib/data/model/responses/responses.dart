import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(name: "statusCode")
  final int statusCode;

  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "data")
  final T? data;

  ApiResponse({required this.statusCode, required this.message, this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}

@JsonSerializable()
class ApiErrorResponse {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "error")
  final String error;

  @JsonKey(name: "statusCode")
  final int statusCode;

  ApiErrorResponse({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  factory ApiErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorResponseToJson(this);
}
