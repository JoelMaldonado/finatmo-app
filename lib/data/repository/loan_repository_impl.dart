import 'package:dartz/dartz.dart';
import 'package:finatmo/core/error/failure.dart';
import 'package:finatmo/data/services/loan_service.dart';
import 'package:finatmo/domain/model/loan.dart';
import 'package:finatmo/domain/model/loan_movement.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';

class LoanRepositoryImpl implements LoanRepository {
  final LoanService service;

  LoanRepositoryImpl({required this.service});

  @override
  Future<Either<Failure, List<Loan>>> getLoans() async {
    try {
      final res = await service.getLoans();
      final listMap = res.data?.map((e) => e.toDomain()).toList();
      return Right(listMap ?? []);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<LoanMovement>>> getLoanMovements(
    int loanId,
  ) async {
    try {
      final res = await service.getLoanMovements(loanId);
      final listMap = res.data?.map((e) => e.toDomain()).toList();
      return Right(listMap ?? []);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
