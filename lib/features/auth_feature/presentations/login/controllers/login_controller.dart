import 'package:yalla_chat/core/resources/app_constants.dart';
import 'package:yalla_chat/core/resources/toast_manager.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:yalla_chat/core/util/fields.dart';
import 'package:yalla_chat/features/auth_feature/domain/use_case/login_use_case.dart';

class LoginController extends GetxController {
  final LoginUseCase _loginUseCase;

  String phoneCtrl = '';

  bool isLoading = false;
  bool obscureText = true;
  String countryCode = AppConstants.countryCode;

  LoginController(this._loginUseCase);

  void login() async {
    print(phoneCtrl);
    isLoading = true;
    update();
    final result = await _loginUseCase(
      userPhone: phoneCtrl.trim(),
    );
    result.fold((l) {
      isLoading = false;
      update();
      ToastManager.showError(l.message);
    }, (bool r) {
      isLoading = false;
      update();
      Get.toNamed(Routes.otp, arguments: {Fields.userPhone: phoneCtrl});
    });
  }

  changeCountryCode(String phone) {
    phoneCtrl = phone;
    update();
  }

  @override
  void dispose() {
    phoneCtrl = '';
    super.dispose();
  }
}
