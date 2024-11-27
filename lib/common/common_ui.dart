import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insta_demo/common/app_fonts.dart';

class CommonUi {
  static setPngImage(String imageName, {double? height, double? width}) {
    return Image.asset(
      'assets/images/$imageName.png',
      height: height,
      width: width,
    );
  }

  static setSvgImage(String imageName, {double? height, double? width,Color? color}) {
    return SvgPicture.asset(
      'assets/svg_images/$imageName.svg',
      color:color ,
      height: height,
      width: width,
    );
  }

  static commonText(
      {String? text,
      double size = 14,
      Color color = Colors.black,
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
}
