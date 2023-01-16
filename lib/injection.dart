import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:yalla_chat/features/auth_feature/data/data_sources/auth_local_data_source.dart';
import 'package:yalla_chat/features/auth_feature/data/data_sources/auth_remote_data_sourece.dart';
import 'package:yalla_chat/features/auth_feature/data/repositories/auth_repository.dart';
import 'package:yalla_chat/features/auth_feature/domain/repositories/base_auth_repository.dart';
import 'package:yalla_chat/features/auth_feature/domain/use_case/otp_use_case.dart';
import 'package:yalla_chat/features/auth_feature/domain/use_case/register_use_case.dart';
import 'package:yalla_chat/features/auth_feature/domain/use_case/upload_image_file_use_case.dart';

import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///-------------- Auth FEATURE -----------------------
  // Use cases
  sl.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(baseAuthRepository: sl()));
  sl.registerLazySingleton<OTPUseCase>(
      () => OTPUseCase(baseAuthRepository: sl()));

  sl.registerLazySingleton<UploadImageFileUseCase>(
      () => UploadImageFileUseCase(baseAuthRepository: sl()));

  // Repository
  sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(
      baseAuthRemoteDataSource: sl(),
      baseAuthLocalDataSource: sl(),
      networkInfo: sl()));

  // Data sources
  sl.registerLazySingleton<BaseAuthRemoteDataSource>(
      () => AuthRemoteDataSource());

  // Local sources
  sl.registerLazySingleton<BaseAuthLocalDataSource>(
      () => AuthLocalDataSource(getStorage: sl(), flutterSecureStorage: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );

  //! External
  await GetStorage.init('UserChatApp');
  sl.registerLazySingleton(() => GetStorage('UserChatApp'));
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => InternetConnectionCheckerPlus());
}
