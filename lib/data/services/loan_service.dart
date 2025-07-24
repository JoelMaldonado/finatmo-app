import 'package:dio/dio.dart';
import 'package:finatmo/core/error/handle_dio_exception.dart';
import 'package:finatmo/core/network/dio_config.dart';
import 'package:finatmo/data/model/dtos/loan_dto.dart';
import 'package:finatmo/data/model/responses/responses.dart';

class LoanService {
  final DioConfig dio;

  LoanService({required this.dio});

  Future<ApiResponse<List<LoanDto>>> getLoans() async {
    try {
      final call = await dio.get(path: '/loan');
      final response = ApiResponse<List<LoanDto>>.fromJson(
        call.data,
        (json) =>
            (json as List<dynamic>).map((e) => LoanDto.fromJson(e)).toList(),
      );
      return response;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }

  Future<ApiResponse<List<LoanMovementDto>>> getLoanMovements(
    int loanId,
  ) async {
    try {
      final params = {'loanId': loanId};
      final call = await dio.get(
        path: '/loan/movements',
        queryParameters: params,
      );
      final response = ApiResponse<List<LoanMovementDto>>.fromJson(
        call.data,
        (json) => (json as List<dynamic>)
            .map((e) => LoanMovementDto.fromJson(e))
            .toList(),
      );
      return response;
    } on DioException catch (e) {
      throw handleDioException(e);
    }
  }
}
