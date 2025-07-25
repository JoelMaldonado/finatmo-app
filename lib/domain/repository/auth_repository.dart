import 'package:dartz/dartz.dart';
import 'package:finatmo/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  });
}
