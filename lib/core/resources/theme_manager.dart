import 'package:flutter/material.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    /// Main Color

    primaryColor: ColorManager.primaryColor,
    primaryColorLight: Colors.lightBlue,

    disabledColor: Colors.grey,
    fontFamily: FontConstants.englishFontFamily,
    scaffoldBackgroundColor: ColorManager.white,

    /// CardViewTheme

    cardTheme: const CardTheme(
        color: Colors.white, shadowColor: Colors.grey, elevation: 4),

    /// AppBar Theme

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      color: ColorManager.white,
      elevation: 4,
      shadowColor: Colors.black,
      titleTextStyle: TextStyle(
        fontFamily: FontConstants.englishFontFamily,
        fontSize: FontSize.s24,
        fontWeight: FontWeightManager.bold,
        color: ColorManager.black,
      ),
    ),

    /// Button Theme

    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: Colors.grey,
      buttonColor: ColorManager.primaryColor,
      splashColor: Colors.lightBlue,
    ),

    /// text style
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: FontSize.s18,
      ),
    ),

    /// Elevated Button Theme

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: FontConstants.arabicFontFamily,
            fontSize: FontSize.s20,
            fontWeight: FontWeightManager.regular,
            color: ColorManager.white,
          ),
          backgroundColor: ColorManager.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
    ),
  );
}
