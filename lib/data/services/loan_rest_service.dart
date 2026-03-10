import 'package:dio/dio.dart';
import 'package:finatmo/core/error/handle_dio_exception.dart';
import 'package:finatmo/core/network/dio_config.dart';
import 'package:finatmo/data/model/requests/loan_requests.dart';
import 'package:finatmo/data/model/responses/responses.dart';

class LoanRestService {
  final DioConfig dio;

  LoanRestService({required this.dio});

  Future<ApiResponse<String>> addContact(AddLoanContactRequest request) async {
    try {
      final call = await dio.post(
        path: '/loan/contacts',
        body: request.toJson(),
      );
      final response = ApiResponse<String>.fromJson(
        call.data,
        (json) => json as String,
      );
      return response;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }
}
