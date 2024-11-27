import 'package:flutter/material.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_fonts.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:loading_btn/loading_btn.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
    this.buttonHeight = 44,
    this.buttonWidth = double.infinity,
    this.buttonName,
    this.buttonColor = AppColors.skyBlue, this.borderRadius = 5,this.onPressed});

  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColor;
  final String? buttonName;
  final double borderRadius;
  final Function(
      Function startLoading, Function stopLoadig, ButtonState btnState)?
  onPressed;

  @override
  Widget build(BuildContext context) {
    return LoadingBtn(
      height: buttonHeight,
      width: buttonWidth,
      color: buttonColor,
      borderRadius:borderRadius,
      roundLoadingShape: false,
      loader: const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),
      onTap: onPressed,
      child: CommonUi.commonText(
          text: buttonName,
          size: 14,
          color: AppColors.white,
          fontFamily: AppFonts.semiBold),
    );
  }
}
