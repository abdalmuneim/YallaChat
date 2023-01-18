import 'dart:developer';
import 'dart:io';

import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/app_constants.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:yalla_chat/core/util/fields.dart';
import 'package:yalla_chat/core/util/utils.dart';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yalla_chat/features/auth_feature/domain/use_case/register_use_case.dart';

class RegisterController extends GetxController {
  // static RegisterController get instance => Get.find();

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
  changeCountryCode(Country country) {
    countryCode = '+${country.phoneCode}';
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
      await _registerUseCase(
        userPhone: '$countryCode${phoneCtrl.text.trim()}',
      );
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
    }
  }
  /*  void register() async {
    isLoading = true;
    update();
    if (userImage == null) {
      isLoading = false;
      photoError = LocaleKeys.imageValidation.tr;
      log('--------------> $isLoading');
      update();
    } else {
      await AuthFireBase.register(
        userPhone: '$countryCode${phoneCtrl.text.trim()}',
      );
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
    }
  }
 */
}
