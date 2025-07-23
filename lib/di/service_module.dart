import 'package:finatmo/core/network/dio_config.dart';
import 'package:finatmo/data/services/loan_service.dart';
import 'package:get_it/get_it.dart';

Future<void> serviceModule(GetIt getIt) async {
  getIt.registerLazySingleton<LoanService>(
    () => LoanService(dio: getIt<DioConfig>()),
  );
}
