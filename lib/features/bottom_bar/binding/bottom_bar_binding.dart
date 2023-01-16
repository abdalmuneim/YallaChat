import 'package:yalla_chat/features/bottom_bar/controllers/bottom_bar_controller.dart';
import 'package:get/get.dart';

class BottomBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomBarController>(() => BottomBarController());
  }
}
