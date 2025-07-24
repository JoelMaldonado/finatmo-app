import 'package:finatmo/core/storage/prefs.dart';
import 'package:finatmo/core/storage/secure_storage.dart';
import 'package:finatmo/data/repository/auth_repository_impl.dart';
import 'package:finatmo/data/repository/loan_repository_impl.dart';
import 'package:finatmo/data/services/auth_service.dart';
import 'package:finatmo/data/services/loan_service.dart';
import 'package:finatmo/domain/repository/auth_repository.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> repositoryModule(GetIt getIt) async {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      service: getIt<AuthService>(),
      prefs: getIt<Prefs>(),
      secureStorage: getIt<SecureStorage>(),
    ),
  );
  getIt.registerLazySingleton<LoanRepository>(
    () => LoanRepositoryImpl(service: getIt<LoanService>()),
  );
}
