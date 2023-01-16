import 'package:dartz/dartz.dart';
import 'package:yalla_chat/core/error/failures.dart';
import 'package:yalla_chat/features/auth_feature/domain/repositories/base_auth_repository.dart';

class RegisterUseCase {
  final BaseAuthRepository baseAuthRepository;

  RegisterUseCase({required this.baseAuthRepository});

  Future<Either<Failure, bool>> call({
    required String userPhone,
  }) async {
    return await baseAuthRepository.register(
      userPhone: userPhone,
    );
  }
}
