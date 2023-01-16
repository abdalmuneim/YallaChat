import 'package:dartz/dartz.dart';
import 'package:yalla_chat/core/error/failures.dart';
import 'package:yalla_chat/features/auth_feature/domain/repositories/base_auth_repository.dart';
import 'dart:io' as io;

class UploadImageFileUseCase {
  final BaseAuthRepository baseAuthRepository;

  UploadImageFileUseCase({required this.baseAuthRepository});

  Future<Either<Failure, String>> call({
    required String userPhone,
    required io.File userImage,
  }) async {
    return await baseAuthRepository.uploadImageFile(
        phone: userPhone, imageFile: userImage);
  }
}
