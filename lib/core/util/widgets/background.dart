import 'package:flutter/material.dart';
import 'package:yalla_chat/core/resources/assets_manager.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
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
    );
  }
}
