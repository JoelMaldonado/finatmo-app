import 'package:dio/dio.dart';
import 'package:finatmo/data/model/responses/responses.dart';

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);

  @override
  String toString() => message;
}

NetworkException handleDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return NetworkException("Tiempo de espera agotado. Intenta de nuevo.");

    case DioExceptionType.connectionError:
      return NetworkException("Sin conexión a internet.");

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode;
      final data = e.response?.data;
      String? errorMessage;

      if (data is Map<String, dynamic>) {
        try {
          final errorResponse = ApiErrorResponse.fromJson(data);
          if (errorResponse.message.isNotEmpty == true) {
            errorMessage = errorResponse.message;
          } else if (errorResponse.error.isNotEmpty == true) {
            errorMessage = errorResponse.error;
          }
        } catch (_) {}
      }

      if (errorMessage != null) {
        return NetworkException(errorMessage);
      }

      switch (statusCode) {
        case 400:
          return NetworkException("Solicitud incorrecta. Verifica los datos.");

        case 401:
          return NetworkException("No autorizado. Verifica tus credenciales.");

        case 500:
          return NetworkException("Error del servidor. Intenta más tarde.");

        default:
          return NetworkException(
            "Error inesperado (${statusCode ?? 'desconocido'}).",
          );
      }

    default:
      return NetworkException("No se pudo conectar con el servidor.");
  }
}
