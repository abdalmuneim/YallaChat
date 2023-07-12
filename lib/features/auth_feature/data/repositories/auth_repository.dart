import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:yalla_chat/core/error/exceptions.dart';
import 'package:yalla_chat/core/error/failures.dart';
import 'package:yalla_chat/core/network/network_info.dart';
import 'package:yalla_chat/features/auth_feature/data/data_sources/auth_local_data_source.dart';
import 'package:yalla_chat/features/auth_feature/data/data_sources/auth_remote_data_sourece.dart';
import 'package:yalla_chat/features/auth_feature/data/model/user_model.dart';
import 'package:yalla_chat/features/auth_feature/domain/repositories/base_auth_repository.dart';

class AuthRepository implements BaseAuthRepository {
  final BaseAuthRemoteDataSource baseAuthRemoteDataSource;
  final BaseAuthLocalDataSource baseAuthLocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepository({
    required this.baseAuthRemoteDataSource,
    required this.baseAuthLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, bool>> register({
    required String userPhone,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await baseAuthRemoteDataSource.register(userPhone: userPhone);
        return const Right(true);
      } catch (e) {
        return Left((ExceptionFailure(message: e.toString())));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> verifyOTP({
    required String otp,
    UserModel? userModel,
  }) async {
    if (await networkInfo.isConnected) {
      final UserModel user = await baseAuthRemoteDataSource.verifyOTP(
          otp: otp, userModel: userModel);

      await baseAuthLocalDataSource.writeUser(user: user);
      await baseAuthLocalDataSource.writeToken(token: user.userId);

      return Right(user);
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> login({
    required String userPhone,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        await baseAuthRemoteDataSource.login(userPhone: userPhone);
        return const Right(true);
      } catch (e) {
        return Left((ExceptionFailure(message: e.toString())));
      }
    } else {
      return const Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final user = await baseAuthLocalDataSource.readUser();

      return Right(user);
    } on EmptyCacheException {
      return Left(EmptyCacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> userUpdate() {
    // TODO: implement userUpdate
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> uploadImageFile(
      {required String phone, required File imageFile}) async {
    if (await networkInfo.isConnected) {
      final String urlImg = await baseAuthRemoteDataSource.uploadImageFile(
          phone: phone, userImage: imageFile);
      return Right(urlImg);
    } else {
      return const Left(NetworkFailure());
    }
  }
}
