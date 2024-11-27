import 'package:flutter/material.dart';
import 'package:insta_demo/common/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.centerTitle = false,
    this.actions,
    this.color = AppColors.white,
  });
  final Widget? title;
  final Widget? leading;
  final bool centerTitle;
  final List<Widget>? actions;
  final Color color;
  @override

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      elevation: 0.0,
      backgroundColor: color,
      surfaceTintColor: color,
      centerTitle: centerTitle,
      leading: leading,
      actions: actions,
      shape: const Border(
        bottom: BorderSide(
          color: AppColors.customGray,
          width: 1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);

}