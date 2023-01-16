import 'package:flutter/material.dart';

class CustomerAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomerAppBar({
    Key? key,
    required this.title,
    this.action,
    this.leading,
    this.flexibleSpace,
    this.center,
    this.elevation,
    this.customSize,
  }) : super(key: key);
  final Widget title;
  final Widget? leading;
  final List<Widget>? action;
  final Widget? flexibleSpace;
  final bool? center;
  final double? elevation;
  final double? customSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: leading,
      actions: action,
      centerTitle: center,
      elevation: elevation,
      flexibleSpace: flexibleSpace,
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(customSize ?? kToolbarHeight);
}
