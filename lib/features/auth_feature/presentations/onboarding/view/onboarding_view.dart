import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/app_constants.dart';
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// top image
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                        AssetsManager.bgIMG,
                      ),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2), BlendMode.dstATop),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: ColorManager.secondPrimaryColor,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                                bottomRight: Radius.circular(100),
                              ),
                            ),
                            child: Image.asset(
                              AssetsManager.topLeft,
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: ColorManager.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AssetsManager.topRight,
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: ColorManager.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              AssetsManager.bottomLeft,
                              width: 150,
                              height: 150,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: ColorManager.secondPrimaryColor,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                                bottomLeft: Radius.circular(100),
                              ),
                            ),
                            child: Image.asset(
                              AssetsManager.bottomRight,
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),

              /// title
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  children: [
                    CustomText(
                      text: LocaleKeys.onBoardingTitle.tr,
                      fontWeight: FontWeightManager.bold,
                      fontSize: 20,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 18),

                    /// subtitle
                    CustomText(
                      text: LocaleKeys.onBoardingSubTitle.tr,
                      color: ColorManager.grey,
                      fontSize: 16,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50),

                    /// button
                    CustomElevatedButton(
                      onPressed: () => controller.getStart(),
                      height: 70,
                      textColor: ColorManager.white,
                      child: CustomText(
                        text: LocaleKeys.onBoardingGetStart.tr,
                        color: ColorManager.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

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
                  const SizedBox(width: 5),

                  /// nofal image
                  Image.asset(
                    AssetsManager.company,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 5),

                  /// nofal seo
                  const CustomText(
                    text: AppConstants.companyName,
                    fontSize: 14,
                    color: ColorManager.secondPrimaryColor,
                  ),
                ],
              ),
              const SizedBox(height: 22),
            ],
          ),
        );
      },
    );
  }
}
