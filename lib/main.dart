import 'package:yalla_chat/core/cache_helper/cache_helper.dart';
import 'package:yalla_chat/core/language/app_translations.dart';
import 'package:yalla_chat/core/resources/theme_manager.dart';
import 'package:yalla_chat/core/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'injection.dart' as di;

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  CacheHelper.init();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      locale: const Locale('en'),
      translationsKeys: AppTranslation.translations,
      fallbackLocale: const Locale('en'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
    );
  }
}
