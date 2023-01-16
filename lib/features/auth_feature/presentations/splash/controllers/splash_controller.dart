import 'package:yalla_chat/core/cache_helper/cache_helper.dart';
import 'package:yalla_chat/core/resources/app_constants.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:yalla_chat/core/util/fields.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(
      const Duration(milliseconds: AppConstants.threeMille),
      () async {
        final isVerify = await CacheHelper.getData(key: Fields.token) ?? false;
        return isVerify
            ? Get.offAllNamed(Routes.bottom)
            : Get.offAllNamed(Routes.onBoarding);
      },
    );
    super.onReady();
  }
}
