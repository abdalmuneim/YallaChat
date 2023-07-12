import 'package:yalla_chat/core/error/failures.dart';
import 'package:yalla_chat/core/resources/app_strings.dart';

import 'en_translation.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translations = {
    'en': en,
  };
}

abstract class LocaleKeys {
  /// onBoarding
  static const String onBoardingTitle = 'onBoardingTitle';
  static const String onBoardingSubTitle = 'onBoardingSubTitle';
  static const String onBoardingGetStart = 'onBoardingGetStart';
  static const String onBoardingPoweredBy = 'onBoardingPoweredBy';
  static const String nofalSEO = 'nofalSEO';

  /// login
  static const String login = 'login';
  static const String labelPhone = 'labelPhone';
  static const String hintPhone = 'hintPhone';
  static const String createAccount = 'createAccount';
  static const String chat = 'chat';

  /// register
  static const String register = 'register';
  static const String userName = 'userName';
  static const String gender = 'gender';
  static const String male = 'male';
  static const String female = 'female';
  static const String chosesImage = 'chosesImage';
  static const String welcomeBack = 'welcomeBack';

  /// remote exception
  static const String timeOut = 'timeOut';
  static const String error = 'error';
  static const String invalidPhoneNumber = 'invalidPhoneNumber';

  /// otp
  static const String otpTitle = 'otpTitle';
  static const String otpDoNotShare = 'otpDoNotShare';
  static const String verify = 'verify';
  static const String time = 'time';

  /// home
  static const String messages = 'messages';
  static const String search = 'search';
  static const String activities = 'activities';

  /// validations
  static const String phoneValidation = 'phoneValidation';
  static const String phoneValidationLength = 'phoneValidationLength';
  static const String genderValidation = 'genderValidation';
  static const String nameValidation = 'nameValidation';
  static const String shortNameValidation = 'shortNameValidation';
  static const String imageValidation = 'imageValidation';
  static const String enterOTP = 'enterOTP';

  /// Failure
  static const String emptyCacheException = 'emptyCacheException';

  /// utils
  static const String gallery = 'gallery';
  static const String camera = 'camera';
}

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return failure.message;
    case NetworkFailure:
      return AppStrings.networkFailure;

    default:
      return AppStrings.unexpectedError;
  }
}
