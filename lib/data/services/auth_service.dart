import 'package:dio/dio.dart';
import 'package:finatmo/core/error/handle_dio_exception.dart';
import 'package:finatmo/core/network/dio_config.dart';
import 'package:finatmo/data/model/requests/auth_requests.dart';
import 'package:finatmo/data/model/responses/auth_responses.dart';
import 'package:finatmo/data/model/responses/responses.dart';

class AuthService {
  final DioConfig dio;

  AuthService({required this.dio});

  Future<ApiResponse<LoginResponse>> login(LoginRequest request) async {
    try {
      final call = await dio.post(
        path: '/auth/login',
        body: request.toJson(),
        useToken: false,
      );

      final response = ApiResponse<LoginResponse>.fromJson(
        call.data,
        (json) => LoginResponse.fromJson(json as Map<String, dynamic>),
      );

      return response;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }
}
