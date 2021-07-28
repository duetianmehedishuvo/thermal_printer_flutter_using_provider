import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial/data/datasource/remote/dio/logging_interceptor.dart';
import 'package:tutorial/data/repository/language_repo.dart';
import 'package:tutorial/data/repository/splash_repo.dart';
import 'package:tutorial/provider/language_provider.dart';
import 'package:tutorial/provider/localization_provider.dart';
import 'package:tutorial/provider/splash_provider.dart';
import 'package:tutorial/provider/theme_provider.dart';
import 'package:tutorial/util/app_constant.dart';

import 'data/datasource/remote/dio/dio_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton(() => DioClient(AppConstant.BASE_URL, sl(), sharedPreferences: sl(), loggingInterceptor: sl()));

  // Repository
  sl.registerLazySingleton(() => LanguageRepo());
  sl.registerLazySingleton(() => SplashRepo(dioClient: sl()));

  // Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LanguageProvider(languageRepo: sl()));
  sl.registerFactory(() => SplashProvider(splashRepo: sl()));

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
