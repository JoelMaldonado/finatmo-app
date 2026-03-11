import 'package:dartz/dartz.dart';
import 'package:finatmo/core/error/failure.dart';
import 'package:finatmo/domain/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  AuthProvider({required this.authRepository});

  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  }) async {
    return await authRepository.login(email: email, password: password);
  }
}
