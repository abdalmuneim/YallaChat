import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:yalla_chat/core/util/widgets/background.dart';
import 'package:yalla_chat/core/util/widgets/custom_elevated_button.dart';
import 'package:yalla_chat/core/util/widgets/custom_text.dart';
import 'package:yalla_chat/core/util/widgets/custom_text_form_field.dart';
import 'package:yalla_chat/features/auth_feature/presentations/login/controllers/login_controller.dart';
import 'package:country_picker/country_picker.dart';
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: LocaleKeys.login.tr,
                      color: ColorManager.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                    const SizedBox(height: 30),

                    /// text form field phone
                    CustomTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return LocaleKeys.phoneValidation.tr;
                        } else if (value.length < 9) {
                          return LocaleKeys.phoneValidationLength.tr;
                        }
                        return null;
                      },
                      textEditingController: controller.phoneCtrl,
                      isNumberOnly: true,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                ColorManager.secondPrimaryColor),
                          ),
                          onPressed: () {
                            showCountryPicker(
                              context: context,
                              exclude: <String>['EG', 'EG'],
                              favorite: <String>['eg'],
                              showPhoneCode: true,
                              onSelect: (Country country) =>
                                  controller.changeCountryCode(country),
                              countryListTheme: CountryListThemeData(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(40.0),
                                  topRight: Radius.circular(40.0),
                                ),
                                inputDecoration: InputDecoration(
                                  labelText: 'Search',
                                  hintText: 'Start typing to search',
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: const Color(0xFF8C98A8)
                                          .withOpacity(0.2),
                                    ),
                                  ),
                                ),
                                searchTextStyle: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                ),
                              ),
                            );
                          },
                          child: CustomText(
                            text: controller.countryCode,
                            color: ColorManager.white,
                          ),
                        ),
                      ),
                      labelText: LocaleKeys.labelPhone.tr,
                      hintText: LocaleKeys.hintPhone.tr,
                      enabledBorder: false,
                    ),
                    const SizedBox(height: 30),

                    /// button login
                    controller.isLoading
                        ? const CircularProgressIndicator()
                        : Container(
                            height: 50,
                            width: double.infinity,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: CustomElevatedButton(
                              onPressed: controller.isLoading
                                  ? () {}
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                        controller.login();
                                      }
                                    },
                              child: controller.isLoading
                                  ? const LinearProgressIndicator()
                                  : CustomText(
                                      text: LocaleKeys.login.tr,
                                      color: ColorManager.white,
                                      fontSize: 20,
                                    ),
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
