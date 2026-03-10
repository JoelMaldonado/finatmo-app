import 'package:dartz/dartz.dart';
import 'package:finatmo/core/error/failure.dart';
import 'package:finatmo/data/model/requests/loan_requests.dart';
import 'package:finatmo/domain/model/loan_contact.dart';

abstract class LoanRepository {
  Future<Either<Failure, List<LoanContact>>> getContacts();
  Future<Either<Failure, Unit>> addContact(AddLoanContactRequest request);
}
