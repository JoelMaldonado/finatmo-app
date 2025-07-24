import 'package:finatmo/domain/repository/auth_repository.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:finatmo/presentation/pages/add_loan/add_loan_provider.dart';
import 'package:finatmo/presentation/pages/add_movement/add_movement_provider.dart';
import 'package:finatmo/presentation/pages/login/login_provider.dart';
import 'package:finatmo/presentation/providers/loan_provider.dart';
import 'package:get_it/get_it.dart';

Future<void> providerModule(GetIt getIt) async {
  // Ui
  getIt.registerFactory(
    () => LoginProvider(authRepository: getIt<AuthRepository>()),
  );
  getIt.registerFactory(
    () => AddLoanProvider(repository: getIt<LoanRepository>()),
  );
  getIt.registerFactory(
    () => AddMovementProvider(repository: getIt<LoanRepository>()),
  );

  // Shared
  getIt.registerFactory(
    () => LoanProvider(repository: getIt<LoanRepository>()),
  );
}
