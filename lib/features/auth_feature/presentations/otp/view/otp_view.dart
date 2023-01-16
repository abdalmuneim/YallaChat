import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';
import 'package:yalla_chat/core/services/extenions.dart';
import 'package:yalla_chat/core/util/widgets/background.dart';
import 'package:yalla_chat/core/util/widgets/custom_elevated_button.dart';
import 'package:yalla_chat/core/util/widgets/custom_text.dart';
import 'package:yalla_chat/features/auth_feature/presentations/otp/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpView extends GetView<OTPController> {
  const OtpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(<OTPController>() {
      return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// title
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: ColorManager.white,
                          fontSize: 25,
                        ),
                    children: [
                      TextSpan(text: LocaleKeys.otpTitle.tr),
                      TextSpan(
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(
                                  color: ColorManager.secondPrimaryColor,
                                  fontSize: 25),
                          text: controller.phone),
                      TextSpan(text: LocaleKeys.otpDoNotShare.tr),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                /// otp text form
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                    controller.otp.value = code;
                    print('controller OTP: ${controller.otp.value}');
                    print('code: $code');
                  },
                  onSubmit: (String verificationCode) {
                    controller.otp.value = verificationCode;

                    FocusManager.instance.primaryFocus?.unfocus();
                  }, // end onSubmit
                ),
                const SizedBox(height: 10),
                CustomText(
                  text: LocaleKeys.time.tr +
                      (controller.timerDuration.value.inSeconds == 0
                          ? ''
                          : ': ${'${controller.timerDuration.value.inMinutes.getDurationReminder}:${controller.timerDuration.value.inSeconds.remainder(60).getDurationReminder}'}'),
                ),
                CustomText(text: controller.timeOut),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomElevatedButton(
                    onPressed: controller.isLoading
                        ? () {}
                        : () => controller.verifyCode(),
                    child: controller.isLoading
                        ? const LinearProgressIndicator()
                        : CustomText(
                            text: LocaleKeys.verify.tr,
                            color: ColorManager.white,
                            fontSize: 20,
                          ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
