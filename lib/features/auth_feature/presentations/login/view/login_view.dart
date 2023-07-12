import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/app_constants.dart';
import 'package:yalla_chat/core/resources/assets_manager.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:yalla_chat/core/util/widgets/background.dart';
import 'package:yalla_chat/core/util/widgets/custom_elevated_button.dart';
import 'package:yalla_chat/core/util/widgets/custom_text.dart';
import 'package:yalla_chat/features/auth_feature/presentations/login/controllers/login_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.center,
          children: [
            const Background(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetsManager.company,
                      width: 150,
                    ),
                    const SizedBox(height: 20),
                    CustomText(
                      text:
                          "${LocaleKeys.login.tr}  ${AppConstants.companyName} ${LocaleKeys.chat.tr}",
                      color: ColorManager.primaryColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                    const SizedBox(height: 30),

                    /// text form field phone

                    IntlPhoneField(
                      decoration: InputDecoration(
                        hintText: LocaleKeys.labelPhone.tr,
                        fillColor: ColorManager.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        disabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorManager.secondPrimaryColor,
                            width: 1.5,
                          ),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
                      ],
                      initialCountryCode: AppConstants.countryCode,
                      onChanged: (PhoneNumber phone) =>
                          controller.changeCountryCode(phone.completeNumber),
                    ),
                    const SizedBox(height: 30),

                    /// button login
                    CustomElevatedButton(
                      onPressed: controller.isLoading
                          ? () {}
                          : () {
                              if (_formKey.currentState!.validate()) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.login();
                              }
                            },
                      color: ColorManager.secondPrimaryColor,
                      height: 70,
                      child: controller.isLoading
                          ? const LinearProgressIndicator()
                          : CustomText(
                              text: LocaleKeys.login.tr,
                              color: ColorManager.white,
                              fontSize: 20,
                            ),
                    ),
                    const SizedBox(height: 30),

                    /// button register
                    InkWell(
                      onTap: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        Get.toNamed(Routes.register);
                      },
                      child: Text(
                        LocaleKeys.createAccount.tr,
                        style: const TextStyle(
                            color: ColorManager.white,
                            decoration: TextDecoration.underline,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
