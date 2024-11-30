import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_fonts.dart';

class CommonUi {
  static setPngImage(String imageName, {double? height, double? width}) {
    return Image.asset(
      'assets/images/$imageName.png',
      height: height,
      width: width,
    );
  }

  static setSvgImage(String imageName,
      {double? height, double? width, Color? color}) {
    return SvgPicture.asset(
      'assets/svg_images/$imageName.svg',
      color: color,
      height: height,
      width: width,
    );
  }

  static commonText(
      {String? text,
      double size = 14,
      Color color = AppColors.black,
      String fontFamily = AppFonts.regular}) {
    return Text(
      text ?? '',
      style: TextStyle(
        fontSize: size,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }

  static customBorderCircleImage(
      {double? height,
      double? width,
      String? title,
      Color backgroundColor = AppColors.white,
      Color borderColor = AppColors.mistyGray,
      double borderWidth = 2,
      BorderRadiusGeometry borderRadius = BorderRadius.zero,
      double? childPadding,
      Widget? child}) {
    return Column(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
          ),
          child: ClipRRect(
            borderRadius: borderRadius,
            child: Padding(
              padding: EdgeInsets.all(childPadding ?? 0),
              child: child,
            ),
          ),
        ),
        title != null
            ? Padding(
                padding: const EdgeInsets.only(top: 3),
                child: CommonUi.commonText(
                    text: title,
                    size: 12,
                    color: AppColors.black,
                    fontFamily: AppFonts.regular),
              )
            : Container(),
      ],
    );
  }
}
