import 'package:get/get.dart';
import 'package:yalla_chat/features/auth_feature/presentations/login/bindings/login_bindings.dart';
import 'package:yalla_chat/features/auth_feature/presentations/login/view/login_view.dart';
import 'package:yalla_chat/features/auth_feature/presentations/onboarding/bindings/onboarding_binding.dart';
import 'package:yalla_chat/features/auth_feature/presentations/onboarding/view/onboarding_view.dart';
import 'package:yalla_chat/features/auth_feature/presentations/otp/bindings/otp_binding.dart';
import 'package:yalla_chat/features/auth_feature/presentations/otp/view/otp_view.dart';
import 'package:yalla_chat/features/auth_feature/presentations/register/bindings/register_binding.dart';
import 'package:yalla_chat/features/auth_feature/presentations/register/view/register_view.dart';
import 'package:yalla_chat/features/auth_feature/presentations/splash/bindings/splash_binding.dart';
import 'package:yalla_chat/features/auth_feature/presentations/splash/views/splash_view.dart';
import 'package:yalla_chat/features/bottom_bar/binding/bottom_bar_binding.dart';
import 'package:yalla_chat/features/bottom_bar/presentations/bottom_bar_view.dart';
import 'package:yalla_chat/features/bottom_bar/presentations/messages_feature/bindings/messages_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String initial = Routes.register;

  /// initial rout

  static final routes = [
    /// splash
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),

    /// onBoarding
    GetPage(
      name: _Paths.onBoarding,
      page: () => const OnboardingView(),
      binding: OnBoardingBinding(),
    ),

    /// Login page
    GetPage(
      name: _Paths.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),

    /// register page
    GetPage(
      name: _Paths.register,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),

    /// otp page
    GetPage(
      name: _Paths.otp,
      page: () => const OtpView(),
      binding: OTPBinding(),
    ),

    /// bottom page
    GetPage(
      name: _Paths.bottom,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
      bindings: [
        /// messages page
        MessagesBinding(),

        /// call page

        /// camera page

        /// setting page
      ],
    ),

    /// update user
    /* GetPage(
      name: _Paths.userUpdate,
      page: () => UpdateUserDataView(),
      binding: UpdateUserBinding(),
    ), */
  ];
}
