import 'package:yalla_chat/features/auth_feature/presentations/splash/controllers/splash_controller.dart';
import 'package:get/get.dart';
import 'package:yalla_chat/injection.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(
      () => SplashController(getUserUseCase: sl()),
    );
  }
}
