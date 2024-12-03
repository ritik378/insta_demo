import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_demo/common/app_colors.dart';

/// A custom text form field widget with configurable properties.
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.color = AppColors.snowWhite,
    this.borderColor = AppColors.lightBlackTransparent,
    this.hintText,
    this.hintStyle = const TextStyle(
      color: AppColors.customGray,
      fontSize: 14,
    ),
    this.validator,
    this.onChanged,
    this.errorText,
    this.style,
    this.cursorColor,
  });

  final TextEditingController? controller;
  final Color color;
  final Color borderColor;
  final String? hintText;
  final TextStyle? hintStyle;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String? errorText;
  final TextStyle? style;
  final Color? cursorColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: style,
      cursorColor: cursorColor,
      cursorErrorColor: Colors.red,
      validator: validator,
      onChanged: onChanged,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'^\s+')),
      ],
      decoration: InputDecoration(
        fillColor: color,
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle,
        errorText: errorText,
        enabledBorder: _buildBorder(borderColor),
        focusedBorder: _buildBorder(borderColor),
        errorBorder: _buildBorder(Colors.red),
        focusedErrorBorder: _buildBorder(borderColor),
      ),
    );
  }

  /// Builds the border for the text field.
  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: color,
        width: 0.5,
      ),
    );
  }
}
