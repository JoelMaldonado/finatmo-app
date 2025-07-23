import 'package:finatmo/core/network/dio_config.dart';
import 'package:finatmo/data/model/dtos/loan_dto.dart';

class LoanService {
  final DioConfig dio;

  LoanService({required this.dio});

  Future<List<LoanMovementDto>> getLoanMovements(int loanId) async {
    final params = {'loanId': loanId};
    final call = await dio.get(url: '/loan/movements', queryParameters: params);
    final response = call.data as List<dynamic>;
    return response.map((e) => LoanMovementDto.fromJson(e)).toList();
  }
}
