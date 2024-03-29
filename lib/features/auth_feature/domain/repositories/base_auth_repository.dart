import 'package:dartz/dartz.dart';
import 'dart:io' as io;
import 'package:yalla_chat/core/error/failures.dart';
import 'package:yalla_chat/features/auth_feature/data/model/user_model.dart';
import 'package:yalla_chat/features/auth_feature/domain/entities/user.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, bool>> login({
    required String userPhone,
  });
  Future<Either<Failure, bool>> register({
    required String userPhone,
  });
  Future<Either<Failure, User>> verifyOTP({
    required String otp,
    UserModel? userModel,
  });
  Future<Either<Failure, User>> getUser();

  Future<Either<Failure, String>> uploadImageFile(
      {required String phone, required io.File imageFile});

  Future<Either<Failure, Unit>> userUpdate();
  Future<Either<Failure, Unit>> logOut();
}
