import 'package:finatmo/domain/repository/auth_repository.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:finatmo/presentation/providers/auth_provider.dart';
import 'package:finatmo/presentation/providers/loan_provider.dart';
import 'package:get_it/get_it.dart';

Future<void> providerModule(GetIt getIt) async {
  getIt.registerFactory(
    () => AuthProvider(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerFactory(
    () => LoanProvider(repository: getIt<LoanRepository>()),
  );
}
