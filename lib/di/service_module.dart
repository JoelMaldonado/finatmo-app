import 'package:finatmo/core/network/dio_config.dart';
import 'package:finatmo/data/services/auth_service.dart';
import 'package:finatmo/data/services/loan_service.dart';
import 'package:get_it/get_it.dart';

Future<void> serviceModule(GetIt getIt) async {
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(dio: getIt<DioConfig>()),
  );
  getIt.registerLazySingleton<LoanService>(
    () => LoanService(dio: getIt<DioConfig>()),
  );
}
