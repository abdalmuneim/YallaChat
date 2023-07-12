import 'dart:io';

import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/app_constants.dart';
import 'package:yalla_chat/core/resources/toast_manager.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:yalla_chat/core/util/fields.dart';
import 'package:yalla_chat/core/util/utils.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_chat/features/auth_feature/domain/use_case/register_use_case.dart';

class RegisterController extends GetxController {
  final RegisterUseCase _registerUseCase;

  RegisterController(this._registerUseCase);

  TextEditingController nameCtrl = TextEditingController(text: '');
  TextEditingController phoneCtrl = TextEditingController(text: '');

  String countryCode = AppConstants.countryCode;

  bool isLoading = false;
  bool obscureTextPass = true;
  bool obscureTextPassCon = true;
  String photoError = '';

  File? userImage;

  /// choses user image
  getImage() async {
    userImage = await Utils.showBottomSheetPic();
    userImage != null ? photoError = '' : null;
    update();
  }

  /// change country code
  changeCountryCode(String country) {
    countryCode = '+$country';
    update();
  }

  /// Register Function post data
  register() async {
    isLoading = true;
    update();
    if (userImage == null) {
      isLoading = false;
      photoError = LocaleKeys.imageValidation.tr;
      update();
    } else {
      final result = await _registerUseCase(
        userPhone: '$countryCode${phoneCtrl.text.trim()}',
      );

      result.fold((l) {
        isLoading = false;
        update();
        ToastManager.showError(l.message);
      }, (r) {
        isLoading = false;
        update();
        Get.toNamed(
          Routes.otp,
          arguments: {
            Fields.userImage: userImage,
            Fields.userName: nameCtrl.text,
            Fields.userPhone: '$countryCode${phoneCtrl.text}',
          },
        );
      });
    }
  }
}
