import 'package:dartz/dartz.dart';
import 'package:finatmo/core/error/failure.dart';
import 'package:finatmo/data/model/requests/loan_requests.dart';
import 'package:finatmo/domain/model/loan.dart';
import 'package:finatmo/domain/model/loan_movement.dart';

abstract class LoanRepository {
  Future<Either<Failure, List<Loan>>> getLoans();
  Future<Either<Failure, Unit>> addLoan(AddLoanRequest loan);
  Future<Either<Failure, List<LoanMovement>>> getLoanMovements(int loanId);
  Future<Either<Failure, Unit>> addLoanMovement(AddLoanMovementRequest request);
}
