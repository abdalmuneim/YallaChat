import 'package:flutter/material.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';

class CustomCircleAvatar extends StatelessWidget {
  const CustomCircleAvatar({Key? key, required this.imgURL}) : super(key: key);
  final String imgURL;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: ColorManager.green, width: 3),
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imgURL),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle),
      ),
    );
  }
}
