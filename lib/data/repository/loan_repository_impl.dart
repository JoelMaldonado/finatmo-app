import 'package:finatmo/data/model/dtos/loan_dto.dart';
import 'package:finatmo/data/services/loan_service.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';

class LoanRepositoryImpl implements LoanRepository {
  final LoanService service;

  LoanRepositoryImpl({required this.service});

  @override
  Future<List<LoanMovementDto>> getLoanMovements(int loanId) async {
    return await service.getLoanMovements(loanId);
  }
}
