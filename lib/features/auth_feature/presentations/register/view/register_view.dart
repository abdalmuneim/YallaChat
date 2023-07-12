import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/app_constants.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';
import 'package:yalla_chat/core/util/widgets/background.dart';
import 'package:yalla_chat/core/util/widgets/custom_elevated_button.dart';
import 'package:yalla_chat/core/util/widgets/custom_text.dart';
import 'package:yalla_chat/core/util/widgets/custom_text_form_field.dart';
import 'package:yalla_chat/features/auth_feature/presentations/register/controllers/register_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(builder: (controller) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Background(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// top content
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: LocaleKeys.register.tr,
                            color: ColorManager.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: ColorManager.white,
                            icon: const Icon(
                              Icons.arrow_forward_ios_sharp,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),

                      Column(
                        children: [
                          /// upload image
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () => controller.getImage(),
                                    style: Theme.of(context)
                                        .elevatedButtonTheme
                                        .style
                                        ?.copyWith(
                                            backgroundColor:
                                                MaterialStateProperty.all<
                                                    Color>(Colors.white),
                                            shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                                    const Size(200, 50)),
                                            textStyle: MaterialStateProperty
                                                .all<TextStyle>(const TextStyle(
                                                    color: Colors.black))),
                                    child: CustomText(
                                      text: LocaleKeys.chosesImage.tr,
                                    ),
                                  ),
                                  if (controller.photoError.isNotEmpty)
                                    CustomText(
                                      text: controller.photoError,
                                      color: ColorManager.white,
                                      fontSize: 12,
                                    )
                                ],
                              ),
                              if (controller.userImage == null)
                                const SizedBox()
                              else
                                CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      Image.file(controller.userImage!).image,
                                )
                            ],
                          ),
                          const SizedBox(height: 30),

                          /// text form field name
                          CustomTextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return LocaleKeys.nameValidation.tr;
                              } else if (value.length < 9) {
                                return LocaleKeys.shortNameValidation.tr;
                              }
                              return null;
                            },
                            borderRadius: 10,
                            textEditingController: controller.nameCtrl,
                            prefixIcon: const Icon(Icons.person),
                            labelText: LocaleKeys.userName.tr,
                            hintText: LocaleKeys.userName.tr,
                            enabledBorder: false,
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
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CountryPickerDropdown(
                                initialValue: AppConstants.countryCode,
                                selectedItemBuilder: (country) {
                                  print(
                                      '----Country code phoneCode---->${country.phoneCode}');
                                  print(
                                      '----Country code name---->${country.name}');
                                  print(
                                      '----Country code iso3Code---->${country.iso3Code}');
                                  print(
                                      '----Country code isoCode---->${country.isoCode}');
                                  return controller
                                      .changeCountryCode(country.phoneCode);
                                },
                                itemBuilder: (country) => Row(
                                  children: <Widget>[
                                    CountryPickerUtils.getDefaultFlagImage(
                                        country),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                        "+${country.phoneCode}(${country.isoCode})"),
                                  ],
                                ),
                                itemFilter: (c) =>
                                    ['AR', 'EN'].contains(c.isoCode),
                                priorityList: [
                                  CountryPickerUtils.getCountryByIsoCode('AR'),
                                  CountryPickerUtils.getCountryByIsoCode('EN'),
                                ],
                                sortComparator: (Country a, Country b) =>
                                    a.isoCode.compareTo(b.isoCode),
                                onValuePicked: (Country country) {
                                  print(country.name);
                                  print(country.phoneCode);
                                  print(country.isoCode);
                                  print(country.iso3Code);
                                },
                              ),
                            ),
                            labelText: LocaleKeys.labelPhone.tr,
                            hintText: LocaleKeys.hintPhone.tr,
                            enabledBorder: false,
                          ),
                          const SizedBox(height: 30),

                          /// register button
                          Container(
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
                                        controller.register();
                                      }
                                    },
                              child: controller.isLoading
                                  ? const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: LinearProgressIndicator(),
                                    )
                                  : CustomText(
                                      text: LocaleKeys.register.tr,
                                      color: ColorManager.white,
                                      fontSize: 20,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
