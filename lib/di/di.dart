import 'package:finatmo/core/network/dio_config.dart';
import 'package:finatmo/di/provider_module.dart';
import 'package:finatmo/di/repository_module.dart';
import 'package:finatmo/di/service_module.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerLazySingleton<DioConfig>(() => DioConfig());

  await serviceModule(getIt);
  await repositoryModule(getIt);
  await providerModule(getIt);

  await getIt.allReady();
}
