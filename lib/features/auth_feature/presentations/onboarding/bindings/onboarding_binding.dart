import 'package:yalla_chat/features/auth_feature/presentations/onboarding/controllers/onboarding_controller.dart';
import 'package:get/get.dart';

class OnBoardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
