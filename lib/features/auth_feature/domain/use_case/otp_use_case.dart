import 'package:dartz/dartz.dart';
import 'package:yalla_chat/core/error/failures.dart';
import 'package:yalla_chat/features/auth_feature/data/model/user_model.dart';
import 'package:yalla_chat/features/auth_feature/domain/entities/user.dart';
import 'package:yalla_chat/features/auth_feature/domain/repositories/base_auth_repository.dart';

class OTPUseCase {
  final BaseAuthRepository baseAuthRepository;

  OTPUseCase({required this.baseAuthRepository});

  Future<Either<Failure, User>> call(
      {required String otp, UserModel? userModel}) async {
    return await baseAuthRepository.verifyOTP(otp: otp, userModel: userModel);
  }
}
