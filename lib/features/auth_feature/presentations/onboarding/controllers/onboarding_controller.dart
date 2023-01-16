import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class OnboardingController extends GetxController {
  /// go to login
  getStart() {
    Get.offAllNamed(Routes.login);
  }

  askPermission() async {
    /// complete Example for IOS
    /// https://github.com/Baseflow/flutter-permission-handler/blob/master/permission_handler/example/ios/Runner/Info.plist

    // You can request multiple permissions at once.
    Map<Permission, PermissionStatus> statuses = await [
      Permission.contacts,
      Permission.storage,
      Permission.camera,
    ].request();

    /// permission contacts
    if (statuses[Permission.contacts]!.isDenied) {
      await Permission.contacts.request().then((value) {
        if (!value.isGranted) askPermission();
      });

      /// permission storage
      if (statuses[Permission.storage]!.isDenied) {
        await Permission.storage.request().then((value) {
          if (!value.isGranted) askPermission();
        });

        /// permission camera
        if (statuses[Permission.camera]!.isDenied) {
          await Permission.photos.request().then((value) {
            if (!value.isGranted) askPermission();
          });
        }
      }
    }
  }

  @override
  void onInit() async {
    await askPermission();
    super.onInit();
  }
}
