import 'package:yalla_chat/core/resources/assets_manager.dart';
import 'package:yalla_chat/core/resources/size_config.dart';
import 'package:yalla_chat/features/auth_feature/presentations/splash/controllers/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Image.asset(AssetsManager.company),
          ),
        );
      },
    );
  }
}
