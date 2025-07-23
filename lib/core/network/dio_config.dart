import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfig {
  late final Dio _dio;

  DioConfig() {
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

  Future<Response<dynamic>> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    bool useToken = false,
  }) async {
    final options = useToken
        ? Options(headers: {'Authorization': 'Bearer your_token_here'})
        : null;
    return _dio.get(url, queryParameters: queryParameters, options: options);
  }
}
