import 'package:flutter/material.dart';
import 'package:yalla_chat/core/resources/assets_manager.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AssetsManager.onBoarding,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          color: ColorManager.grey.withOpacity(.8),
        ),
      ],
    );
  }
}
