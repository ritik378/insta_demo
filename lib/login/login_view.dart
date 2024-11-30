import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_keys.dart';
import 'package:insta_demo/common/common_logics.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/common/custom_app_bar.dart';
import 'package:insta_demo/common/custom_button.dart';
import 'package:insta_demo/common/custom_text_form_field.dart';
import 'package:insta_demo/common/language/language_string.dart';
import 'package:insta_demo/login/login_controller.dart';
import '../common/app_fonts.dart';

/// A view representing the login screen.
class LoginView extends StatelessWidget {
  LoginView({super.key});

  /// Controller for managing login-related state.
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.white,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: const CustomAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: loginController.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    CommonUi.setSvgImage('instagram_text'),
                    const SizedBox(height: 40),
                    _buildTextFormField(
                      hintText: LanguageString.phoneEmailUserName.tr,
                      validator: (value) {
                        return CommonLogics.accountValidation(value);
                      },
                    ),
                    const SizedBox(height: 12),
                    _buildTextFormField(
                      hintText: LanguageString.password.tr,
                      validator: (value) {
                        return CommonLogics.passwordValidation(value);
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildForgotPasswordText(),
                    const SizedBox(height: 30),
                    _buildLoginButton(context),
                    const SizedBox(height: 38),
                    _buildLoginWithFb(),
                    const SizedBox(height: 40),
                    _buildDividerWithText(LanguageString.or.tr),
                    const SizedBox(height: 40),
                    _buildSignUpText(),
                    const SizedBox(height: 60),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a custom text form field.
  Widget _buildTextFormField(
      {required String hintText,
      required String? Function(String?) validator}) {
    return CustomTextFormField(
      hintText: hintText,
      validator: validator,
      hintStyle: const TextStyle(
        color: AppColors.customGray,
        fontSize: 14,
        fontFamily: AppFonts.regular,
      ),
    );
  }

  /// Builds the forgot password text.
  Widget _buildForgotPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CommonUi.commonText(
          text: LanguageString.forgotPassword.tr,
          size: 12,
          color: AppColors.skyBlue,
          fontFamily: AppFonts.medium,
        ),
      ],
    );
  }

  /// Builds the login button..
  Widget _buildLoginButton(BuildContext context) {
    return CustomButton(
      buttonName: LanguageString.login.tr,
      onPressed: (startLoading, stopLoading, btnState) {
        if (loginController.formKey.currentState!.validate()) {
          FocusScope.of(context).unfocus();
          startLoading();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              Get.offNamed('/dashboard');
              GetStorage().write(AppKeys.isLogged, true);
              stopLoading();
            },
          );
        }
      },
    );
  }

  /// Builds the login with Facebook section.
  Widget _buildLoginWithFb() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonUi.setSvgImage('fb_logo'),
        const SizedBox(width: 10),
        CommonUi.commonText(
          text: LanguageString.loginWithFb.tr,
          color: AppColors.skyBlue,
          fontFamily: AppFonts.semiBold,
        ),
      ],
    );
  }

  /// Builds a divider with text.
  Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.customGray,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CommonUi.commonText(
            text: text,
            size: 12,
            color: AppColors.semiTransparentBlack,
            fontFamily: AppFonts.semiBold,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.customGray,
          ),
        ),
      ],
    );
  }

  /// Builds the sign-up text.
  Widget _buildSignUpText() {
    return RichText(
      text: TextSpan(
        text: LanguageString.dontHaveAnAccount.tr,
        style: const TextStyle(
          color: AppColors.semiTransparentBlack,
          fontSize: 14,
          fontFamily: AppFonts.regular,
        ),
        children: [
          TextSpan(
            text: LanguageString.signUp.tr,
            style: const TextStyle(
              color: AppColors.skyBlue,
              fontSize: 14,
              fontFamily: AppFonts.regular,
            ),
          ),
        ],
      ),
    );
  }
}
