import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../features/user/data/datasources/user_api_service.dart';
import '../../features/user/data/repositories/user_repository_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerLazySingleton<Dio>(() => Dio());

  // API Services
  getIt.registerLazySingleton<UserApiService>(
    () => UserApiService(getIt<Dio>()),
  );

  // Repositories
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(getIt<UserApiService>()),
  );
}
