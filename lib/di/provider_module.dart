import 'package:finatmo/domain/repository/loan_repository.dart';
import 'package:finatmo/presentation/providers/loan_provider.dart';
import 'package:get_it/get_it.dart';

Future<void> providerModule(GetIt getIt) async {
  getIt.registerFactory(
    () => LoanProvider(repository: getIt<LoanRepository>()),
  );
}
