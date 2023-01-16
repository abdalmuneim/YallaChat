import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/assets_manager.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';
import 'package:yalla_chat/core/resources/font_manager.dart';
import 'package:yalla_chat/core/util/widgets/custom_elevated_button.dart';
import 'package:yalla_chat/core/util/widgets/custom_text.dart';
import 'package:yalla_chat/features/auth_feature/presentations/onboarding/controllers/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (controller) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// top image
              Container(
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AssetsManager.onBoarding,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomText(
                  text: LocaleKeys.onBoardingTitle.tr,
                  fontWeight: FontWeightManager.bold,
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
              ),

              /// subtitle
              CustomText(
                text: LocaleKeys.onBoardingSubTitle.tr,
                color: ColorManager.grey,
                fontSize: 16,
                textAlign: TextAlign.center,
              ),

              /// button
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomElevatedButton(
                  onPressed: () => controller.getStart(),
                  width: double.infinity - 100,
                  textColor: ColorManager.white,
                  child: CustomText(
                    text: LocaleKeys.onBoardingGetStart.tr,
                    color: ColorManager.white,
                    fontSize: 20,
                  ),
                ),
              ),

              /// copy write
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// powered by
                  CustomText(
                    text: LocaleKeys.onBoardingPoweredBy.tr,
                    fontSize: 14,
                  ),
                  const SizedBox(width: 10),

                  /// nofal image
                  Image.asset(
                    AssetsManager.company,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 10),

                  /// nofal seo
                  CustomText(
                    text: LocaleKeys.nofalSEO.tr,
                    fontSize: 14,
                    color: ColorManager.secondPrimaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
