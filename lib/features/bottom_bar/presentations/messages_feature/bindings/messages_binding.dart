import 'package:yalla_chat/features/bottom_bar/presentations/messages_feature/controllers/messages_controller.dart';
import 'package:get/get.dart';

class MessagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessagesController>(() => MessagesController());
  }
}
