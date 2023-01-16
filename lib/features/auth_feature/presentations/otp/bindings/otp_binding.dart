import 'package:yalla_chat/features/auth_feature/presentations/otp/controllers/otp_controller.dart';
import 'package:get/get.dart';
import 'package:yalla_chat/injection.dart';

class OTPBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(() => OTPController(sl(), sl()));
  }
}
