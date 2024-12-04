import 'package:flutter/material.dart';
import 'package:insta_demo/common/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.centerTitle = false,
    this.actions,
    this.color = AppColors.lightTheme,
    this.bottom,
    this.shape,
    this.iconTheme,
  });

  final Widget? title;
  final Widget? leading;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color color;
  final PreferredSizeWidget? bottom;
  final ShapeBorder? shape;
  final IconThemeData? iconTheme;

  @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      elevation: 0.0,
      iconTheme: iconTheme,
      backgroundColor: color,
      surfaceTintColor: color,
      centerTitle: centerTitle,
      leading: leading,
      bottom: bottom,
      actions: actions,
      shape: shape,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
