import 'package:yalla_chat/core/resources/app_constants.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController phoneCtrl = TextEditingController(text: '');
  final TextEditingController passwordCtrl = TextEditingController(text: '');

  bool isLoading = false;
  bool obscureText = true;
  String countryCode = AppConstants.countryCode;

  void login() async {
    isLoading = true;
    update();
    Get.toNamed(Routes.otp, arguments: phoneCtrl.text);
    isLoading = false;
    update();
  }

  changeCountryCode(Country country) {
    countryCode = country.phoneCode;
    update();
  }

  @override
  void dispose() {
    phoneCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }
}
