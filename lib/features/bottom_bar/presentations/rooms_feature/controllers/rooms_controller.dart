import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class RoomsController extends GetxController {
  final RxBool _error = false.obs;
  RxBool get error => _error;
  final RxBool _initialized = false.obs;
  User? _user;
  get user => _user;

  void initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        _user = user!;
        update();
      });

      _initialized.value = true;
      update();
    } catch (e) {
      _error.value = true;
      update();
    }
  }

  @override
  void onInit() {
    initializeFlutterFire();
    super.onInit();
  }
}
