import 'package:finatmo/core/network/dio_config.dart';
import 'package:finatmo/core/network/graphql_config.dart';
import 'package:finatmo/data/services/auth_service.dart';
import 'package:finatmo/data/services/loan_graphql_service.dart';
import 'package:finatmo/data/services/loan_rest_service.dart';
import 'package:get_it/get_it.dart';

Future<void> serviceModule(GetIt getIt) async {
  getIt.registerLazySingleton<AuthService>(
    () => AuthService(dio: getIt<DioConfig>()),
  );
  getIt.registerLazySingleton<LoanRestService>(
    () => LoanRestService(dio: getIt<DioConfig>()),
  );
  getIt.registerLazySingleton<LoanGraphqlService>(
    () => LoanGraphqlService(graphql: getIt<GraphqlConfig>()),
  );
}
