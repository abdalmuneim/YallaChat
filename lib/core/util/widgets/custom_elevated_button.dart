import 'package:flutter/material.dart';
import 'package:yalla_chat/core/resources/colors_manager.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.child,
    this.onPressed,
    this.color = ColorManager.secondPrimaryColor,
    this.elevation = 0,
    this.radius = 50,
    this.width = double.infinity,
    this.height = 50,
    this.textColor = ColorManager.white,
    this.vertical = 0,
    this.horizontal = 0,
  });
  final Widget child;

  final void Function()? onPressed;
  final Color? color;
  final Color? textColor;
  final double? elevation;
  final double? radius;
  final double? width;
  final double? height;
  final double? vertical;
  final double? horizontal;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color),
        elevation: MaterialStateProperty.all(elevation),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(width!, height!),
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: horizontal!, vertical: vertical!),
        ),
      ),
      child: child,
    );
  }
}
