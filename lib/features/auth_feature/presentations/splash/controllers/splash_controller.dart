import 'package:get/get.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:yalla_chat/features/auth_feature/domain/use_case/get_user_use_case.dart';

class SplashController extends GetxController {
  GetUserUseCase getUserUseCase;
  SplashController({
    required this.getUserUseCase,
  });

  bool isLoading = false;

  Future<void> getUserData() async {
    isLoading = true;
    update();

    var getUserData = await getUserUseCase();
    getUserData.fold((failure) {
      isLoading = false;
      update();
      Get.offAllNamed(Routes.onBoarding);
    }, (result) {
      isLoading = false;
      update();
      Get.offAllNamed(Routes.bottom, arguments: result);
    });
  }

  @override
  void onInit() async {
    await getUserData();
    super.onInit();
  }
}
