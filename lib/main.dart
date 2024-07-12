import 'package:flutter/material.dart';
import 'package:t89/src/data/datasources/remote/remote_data_source.dart.dart';
import 'package:t89/src/data/repositories/authentication_repository_impl.dart';
import 'package:t89/src/domain/repositories/authentication_repository.dart';
import 'package:t89/src/domain/usecases/get_user.dart';
import 'package:t89/src/presentation/routes/app_routes.dart';

final sl = GetIt.instance;

void setupLocator() {
  // Register BLoCs
  sl.registerFactory(() => AuthenticationBloc(sl()));

  // Register use cases
  sl.registerLazySingleton(() => GetUser(sl()));

  // Register repositories
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImpl(remoteDataSource: sl()));

  // Register data sources
  sl.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: sl()));

  // Register external dependencies
  sl.registerLazySingleton(() => http.Client());
}

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
