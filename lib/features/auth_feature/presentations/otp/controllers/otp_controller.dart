import 'dart:async';

import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/app_constants.dart';
import 'package:yalla_chat/core/resources/toast_manager.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:yalla_chat/core/util/fields.dart';
import 'package:yalla_chat/core/util/utils.dart';
import 'package:yalla_chat/features/auth_feature/data/model/user_model.dart';
import 'package:get/get.dart';
import 'package:yalla_chat/features/auth_feature/domain/use_case/otp_use_case.dart';
import 'package:yalla_chat/features/auth_feature/domain/use_case/upload_image_file_use_case.dart';

class OTPController extends GetxController {
  final OTPUseCase _otpUseCase;
  final UploadImageFileUseCase _uploadImageFileUseCase;
  OTPController(this._otpUseCase, this._uploadImageFileUseCase);

  String phone = Get.arguments[Fields.userPhone];
  String timeOut = '';

  bool isLoading = false;
  Rx<String> otp = ''.obs;

  /// timer in seconds
  late Rx<Duration> timerDuration =
      Rx(Duration(seconds: _maximumTimerSeconds.value));

  /// the maximum timer in seconds
  final Rx<int> _maximumTimerSeconds = Rx(AppConstants.timeOut);

  /// timer instance
  final Rx<Timer> _timer = Rx(Timer(Duration.zero, () {}));

  verifyCode() async {
    isLoading = true;
    update();
    if (otp.value == '') {
      isLoading = false;
      update();
      ToastManager.showError(LocaleKeys.enterOTP.tr);
    } else {
      final userImgURL = await _uploadImageFileUseCase(
          userPhone: phone, userImage: Get.arguments[Fields.userImage]);

      userImgURL.fold((l) {
        isLoading = false;
        update();
        ToastManager.showError(LocaleKeys.error);
      }, (r) async {
        print(r);
        final verifying = await _otpUseCase(
          otp: otp.value,
          userModel: UserModel(
            userName: Get.arguments[Fields.userName],
            userPhone: Get.arguments[Fields.userPhone],
            createdAt: Utils.getDateTime(),
            userImage: r,
            aboutMe: 'Bio',
            chattingWith: '',
            updateAt: '',
            blockedChats: false,
            blockedVideoCall: false,
            blockedVoiceCall: false,
          ),
        );
        verifying.fold((failure) {
          ToastManager.showError(LocaleKeys.error.tr);
          isLoading = false;
          update();
        }, (success) async {
          print(success);
          Get.offAllNamed(Routes.bottom);
          isLoading = false;
          update();
        });
      });
    }
  }

  /// timer start method
  _startTimer() {
    _timer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick >= _maximumTimerSeconds.value) {
        timer.cancel();
        timerDuration.value = Duration(seconds: _maximumTimerSeconds.value);
        timeOut = LocaleKeys.timeOut.tr;
        update();
      } else {
        timerDuration.value =
            Duration(seconds: _maximumTimerSeconds.value - timer.tick);
        update();
      }
    });
  }

  @override
  void onInit() {
    // phone = Get.arguments[Fields.userPhone];
    _startTimer();
    super.onInit();
  }

  @override
  void dispose() {
    if (_timer.value.isActive) {
      _timer.value.cancel();
    }
    super.dispose();
  }
}
