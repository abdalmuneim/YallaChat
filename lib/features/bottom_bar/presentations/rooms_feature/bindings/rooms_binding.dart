import 'package:yalla_chat/features/bottom_bar/presentations/rooms_feature/controllers/rooms_controller.dart';
import 'package:get/get.dart';

class MessagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RoomsController>(() => RoomsController());
  }
}
