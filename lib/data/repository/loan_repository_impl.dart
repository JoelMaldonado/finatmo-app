import 'package:dartz/dartz.dart';
import 'package:finatmo/core/error/failure.dart';
import 'package:finatmo/data/model/requests/loan_requests.dart';
import 'package:finatmo/data/services/loan_graphql_service.dart';
import 'package:finatmo/data/services/loan_rest_service.dart';
import 'package:finatmo/domain/model/loan_contact.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';

class LoanRepositoryImpl implements LoanRepository {
  final LoanRestService _restService;
  final LoanGraphqlService _graphqlService;

  LoanRepositoryImpl(this._restService, this._graphqlService);

  @override
  Future<Either<Failure, List<LoanContact>>> getContacts() async {
    try {
      final res = await _graphqlService.getContacts();
      return Right(res.map((e) => e.toDomain()).toList());
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addContact(
    AddLoanContactRequest request,
  ) async {
    try {
      final res = await _restService.addContact(request);
      if (res.success) {
        return const Right(unit);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
