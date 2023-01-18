import 'package:dartz/dartz.dart';
import 'package:yalla_chat/core/error/failures.dart';
import 'package:yalla_chat/features/auth_feature/domain/entities/user.dart';
import 'package:yalla_chat/features/auth_feature/domain/repositories/base_auth_repository.dart';

class GetUserUseCase {
  final BaseAuthRepository baseAuthRepository;

  GetUserUseCase({required this.baseAuthRepository});

  Future<Either<Failure, User>> call() async {
    return await baseAuthRepository.getUser();
  }
}
