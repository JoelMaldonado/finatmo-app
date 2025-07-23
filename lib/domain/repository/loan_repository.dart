import 'package:finatmo/data/model/dtos/loan_dto.dart';

abstract class LoanRepository {
  Future<List<LoanMovementDto>> getLoanMovements(int loanId);
}
