import 'package:flutter/material.dart';
import 'package:insta_demo/common/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.color = AppColors.fieldsColor,
    this.borderColor = AppColors.lightBlackTransparent,
    this.hintText,
    this.hintStyle = const TextStyle(
      color: AppColors.customGray,
      fontSize: 14,
    ),
    this.validator,
  });

  final TextEditingController? controller;
  final Color color;
  final Color borderColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.black,
      cursorErrorColor: Colors.red,
      validator: validator,
      decoration: InputDecoration(
        fillColor: color,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
            width: 0.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 0.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
