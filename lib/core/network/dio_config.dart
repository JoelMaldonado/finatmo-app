import 'package:dio/dio.dart';
import 'package:finatmo/core/storage/secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  late final Dio _dio;
  final SecureStorage secureStorage;

  DioConfig({required this.secureStorage}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: kReleaseMode
            ? dotenv.env['BASE_URL_ATM']!
            : dotenv.env['BASE_URL_LOCAL']!,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
      ),
    );
  }

  Future<Options?> _getOptions(bool useToken) async {
    if (useToken) {
      final accessToken = await secureStorage.getAccessToken();
      return Options(headers: {'Authorization': 'Bearer $accessToken'});
    } else {
      return null;
    }
  }

  Future<Response<dynamic>> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    bool useToken = true,
  }) async {
    final options = await _getOptions(useToken);
    return _dio.get(path, queryParameters: queryParameters, options: options);
  }

  Future<Response<dynamic>> post<T>({
    required String path,
    T? body,
    bool useToken = true,
  }) async {
    final options = await _getOptions(useToken);
    return _dio.post(path, data: body, options: options);
  }
}
