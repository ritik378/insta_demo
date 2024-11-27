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

/// A stateless widget that represents the login view.
class LoginView extends StatelessWidget {
  /// Creates a [LoginView] widget.
  LoginView({super.key});

  /// The controller for managing the login logic.
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.white,
      child: GestureDetector(
        // Unfocus the text fields when tapping outside.
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
                    // Display Instagram logo.
                    CommonUi.setSvgImage('instagram_text'),
                    const SizedBox(height: 40),
                    // Text field for phone, email, or username.
                    CustomTextFormField(
                      hintText: LanguageString.phoneEmailUserName.tr,
                      validator: (value) {
                        return CommonLogics.fieldValidation(value);
                      },
                      hintStyle: const TextStyle(
                        color: AppColors.customGray,
                        fontSize: 14,
                        fontFamily: AppFonts.regular,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Text field for password.
                    CustomTextFormField(
                      hintText: LanguageString.password.tr,
                      validator: (value) {
                        return CommonLogics.fieldValidation(value);
                      },
                      hintStyle: const TextStyle(
                        color: AppColors.customGray,
                        fontSize: 14,
                        fontFamily: AppFonts.regular,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Forgot password text.
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CommonUi.commonText(
                          text: LanguageString.forgotPassword.tr,
                          size: 12,
                          color: AppColors.skyBlue,
                          fontFamily: AppFonts.medium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    // Login button.
                    CustomButton(
                      buttonName: LanguageString.login.tr,
                      onPressed: (startLoading, stopLoading, btnState) {
                        if (loginController.formKey.currentState!.validate()) {
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
                    ),
                    const SizedBox(height: 38),
                    // Login with Facebook option.
                    Row(
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
                    ),
                    const SizedBox(height: 40),
                    // Divider with "or" text.
                    Row(
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
                            text: LanguageString.or.tr,
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
                    ),
                    const SizedBox(height: 40),
                    // Sign up text.
                    RichText(
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
                    ),
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
}
