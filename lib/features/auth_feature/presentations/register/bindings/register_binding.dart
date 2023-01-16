import 'package:get/get.dart';
import 'package:yalla_chat/injection.dart';

import '../controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(sl()),
    );
  }
}
