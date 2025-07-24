import 'package:dartz/dartz.dart';
import 'package:finatmo/core/error/failure.dart';
import 'package:finatmo/core/storage/prefs.dart';
import 'package:finatmo/core/storage/secure_storage.dart';
import 'package:finatmo/data/model/requests/auth_requests.dart';
import 'package:finatmo/data/services/auth_service.dart';
import 'package:finatmo/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService service;
  final Prefs prefs;
  final SecureStorage secureStorage;

  AuthRepositoryImpl({
    required this.service,
    required this.prefs,
    required this.secureStorage,
  });

  @override
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
  }) async {
    try {
      final request = LoginRequest(email: email, password: password);
      final res = await service.login(request);
      if (res.data != null) {
        secureStorage.saveAccessToken(res.data!.accessToken.token);
        secureStorage.saveRefreshToken(res.data!.refreshToken.token);
        return Right(unit);
      } else {
        return Left(Failure(res.message));
      }
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
