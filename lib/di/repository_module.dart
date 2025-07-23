import 'package:finatmo/data/repository/loan_repository_impl.dart';
import 'package:finatmo/data/services/loan_service.dart';
import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> repositoryModule(GetIt getIt) async {
  getIt.registerLazySingleton<LoanRepository>(
    () => LoanRepositoryImpl(service: getIt<LoanService>()),
  );
}
