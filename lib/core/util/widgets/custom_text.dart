import 'package:flutter/material.dart';
import 'package:yalla_chat/core/resources/font_manager.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 18,
    this.textAlign,
    this.color = Colors.black,
    this.fontWeight = FontWeightManager.regular,
    this.maxLines,
    this.overflow,
  }) : super(key: key);
  final String? text;
  final double? fontSize;
  final int? maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
          ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
