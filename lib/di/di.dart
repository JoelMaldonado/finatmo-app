import 'package:finatmo/core/network/dio_config.dart';
import 'package:finatmo/core/storage/prefs.dart';
import 'package:finatmo/core/storage/secure_storage.dart';
import 'package:finatmo/di/provider_module.dart';
import 'package:finatmo/di/repository_module.dart';
import 'package:finatmo/di/service_module.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  final secureStorage = const FlutterSecureStorage();
  getIt.registerLazySingleton<Prefs>(() => Prefs(sharedPrefs));
  getIt.registerLazySingleton<SecureStorage>(
    () => SecureStorage(secureStorage),
  );

  getIt.registerLazySingleton<DioConfig>(
    () => DioConfig(secureStorage: getIt<SecureStorage>()),
  );

  await serviceModule(getIt);
  await repositoryModule(getIt);
  await providerModule(getIt);

  await getIt.allReady();
}
