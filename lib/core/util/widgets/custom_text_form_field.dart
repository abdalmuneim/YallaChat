import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.labelText,
    this.prefixIcon,
    this.fillColor = Colors.white,
    this.filled = true,
    this.borderRadius = 10,
    this.obscureText,
    this.suffixIcon,
    this.prefixIconColor = Colors.white,
    this.suffixIconColor = Colors.white,
    this.textEditingController,
    this.textDirection,
    this.validator,
    this.onChange,
    this.onSave,
    this.enabled,
    this.maxLines = 1,
    this.elevation = 5.0,
    this.enabledBorder = true,
    this.textAlign = TextAlign.start,
    this.isNumberOnly = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String hintText, labelText;
  final Widget? prefixIcon, suffixIcon;
  final Color fillColor;
  final Color prefixIconColor;
  final Color suffixIconColor;
  final bool? filled, obscureText;
  final int? maxLines;
  final double? elevation;

  final bool isNumberOnly;
  final bool? enabled, enabledBorder;
  final TextAlign textAlign;

  final double borderRadius;
  final TextEditingController? textEditingController;
  final TextDirection? textDirection;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChange;
  final FormFieldSetter<String>? onSave;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool obscureText = widget.obscureText ?? false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: widget.elevation,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: TextFormField(
        maxLines: widget.maxLines,
        enabled: widget.enabled,
        validator: widget.validator,
        controller: widget.textEditingController,
        onChanged: widget.onChange,
        onSaved: widget.onSave,
        textDirection: widget.textDirection,
        obscureText: obscureText,
        keyboardType: widget.isNumberOnly
            ? const TextInputType.numberWithOptions(decimal: true)
            : widget.keyboardType,
        inputFormatters: widget.isNumberOnly
            ? [
                FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
              ]
            : null,
        style: const TextStyle(color: Colors.black, fontSize: 20),
        textAlign: widget.textAlign,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon ?? toggleVisibility(),
          suffixIconColor: widget.suffixIconColor,
          prefixIcon: widget.prefixIcon,
          prefixIconColor: widget.prefixIconColor,
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle:
              Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
          filled: true,
          fillColor: widget.fillColor,
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderSide: widget.enabledBorder!
                ? const BorderSide(color: Colors.green)
                : BorderSide.none,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
        ),
      ),
    );
  }

  toggleVisibility() {
    if (obscureText) {
      return IconButton(
        icon: const Icon(
          Icons.visibility_off_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            obscureText = false;
          });
        },
      );
    } else if (widget.obscureText != null) {
      return IconButton(
        icon: const Icon(
          Icons.visibility_outlined,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            obscureText = true;
          });
        },
      );
    } else {
      return null;
    }
  }
}
