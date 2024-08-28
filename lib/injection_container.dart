import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:it_health_example/src/core/database/collections_name.dart';
import 'package:it_health_example/src/features/data/dataSource/auth_local_data_source.dart';
import 'package:it_health_example/src/features/data/dataSource/auth_remote_data_source.dart';
import 'package:it_health_example/src/features/data/repositories/auth_repository_impl.dart';
import 'package:it_health_example/src/features/domain/entities/login_entity.dart';
import 'package:it_health_example/src/features/domain/repositories/auth_repository.dart';
import 'package:it_health_example/src/features/domain/repositories/blood_pressure_repository.dart';
import 'package:it_health_example/src/features/domain/useCases/get_blood_pressure_use_case.dart';
import 'package:it_health_example/src/features/domain/useCases/get_session_use_case.dart';
import 'package:it_health_example/src/features/domain/useCases/log_out_use_case.dart';
import 'package:it_health_example/src/features/domain/useCases/login_use_case.dart';
import 'package:path_provider/path_provider.dart';

import 'src/features/app/presentation/controllers/auth_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //CONTROLLERS
  sl.registerFactory(() => AuthController(
        getSessionUseCase: sl(),
        logOutUseCase: sl(),
      ));

  /// USE CASES
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => GetSessionUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));

  sl.registerLazySingleton(() => GetBloodPressureUseCase(sl()));

  /// REPOSITORIES
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()));

  // sl.registerLazySingleton<BloodPressureRepository>(
  //     () => BloodPressureRepositoryImpl(remoteDataSource: sl()));

  /// DATA SOURCES
  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl());

  //HIVE
  await Hive.initFlutter((await getApplicationSupportDirectory()).path);

  /// Adapta el registro de adaptadores según tus necesidades
  Hive.registerAdapter(LoginEntityAdapter());

  /// Abre la caja "auth" como Box<LoginAdapter>
  await Hive.openBox<LoginEntity>(HiveCollections.auth);
}
