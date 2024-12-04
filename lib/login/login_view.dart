import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_keys.dart';
import 'package:insta_demo/common/common_logics/common_logics_controller.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/common/custom_app_bar.dart';
import 'package:insta_demo/common/custom_button.dart';
import 'package:insta_demo/common/custom_text_form_field.dart';
import 'package:insta_demo/common/language/language_string.dart';
import 'package:insta_demo/login/login_controller.dart';
import '../common/app_fonts.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  /// The controller for managing login-related logic.
  final LoginController loginController = Get.find();
  final CommonLogicsController commonLogicsController = Get.find();



  @override
  Widget build(BuildContext context) {

    return Obx(() {
      return ColorfulSafeArea(
        color: commonLogicsController.isDarkMode.value
            ? AppColors.darkTheme
            : AppColors.lightTheme,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: commonLogicsController.isDarkMode.value
                ? AppColors.darkTheme
                : AppColors.lightTheme,
            appBar: CustomAppBar(
              color: commonLogicsController.isDarkMode.value
                  ? AppColors.darkTheme
                  : AppColors.lightTheme,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    CommonUi.setSvgImage('instagram_text',
                        color: commonLogicsController.isDarkMode.value
                            ? AppColors.white
                            : AppColors.black),
                    const SizedBox(height: 40),

                    ///Account field
                    CustomTextFormField(
                      color: commonLogicsController.isDarkMode.value
                          ? AppColors.darkGray
                          : AppColors.snowWhite,
                      style: TextStyle(
                        color: commonLogicsController.isDarkMode.value
                            ? AppColors.white
                            : AppColors.black,
                      ),
                      cursorColor: commonLogicsController.isDarkMode.value
                          ? AppColors.white
                          : AppColors.black,
                      controller: loginController.accountController,
                      borderColor: commonLogicsController.isDarkMode.value
                          ? AppColors.darkInputBorderColor
                          : AppColors.lightInputBorderColor,
                      hintText: LanguageString.phoneEmailUserName.tr,
                      errorText: loginController.acFieldError.value,
                      onChanged: loginController.validateAcField,
                      hintStyle: TextStyle(
                        color: commonLogicsController.isDarkMode.value
                            ? AppColors.milkyWhite
                            : AppColors.customGray,
                        fontSize: 14,
                        fontFamily: AppFonts.regular,
                      ),
                    ),

                    const SizedBox(height: 12),

                    ///Password field
                    Obx(() {
                      return CustomTextFormField(
                        color: commonLogicsController.isDarkMode.value
                            ? AppColors.darkGray
                            : AppColors.snowWhite,
                        style: TextStyle(
                          color: commonLogicsController.isDarkMode.value
                              ? AppColors.white
                              : AppColors.black,
                        ),
                        cursorColor: commonLogicsController.isDarkMode.value
                            ? AppColors.white
                            : AppColors.black,
                        borderColor: commonLogicsController.isDarkMode.value
                            ? AppColors.darkInputBorderColor
                            : AppColors.lightInputBorderColor,
                        controller: loginController.passwordController,
                        hintText: LanguageString.password.tr,
                        errorText: loginController.passwordFieldError.value,
                        onChanged: loginController.validatePasswordField,
                        hintStyle: TextStyle(
                          color: commonLogicsController.isDarkMode.value
                              ? AppColors.milkyWhite
                              : AppColors.customGray,
                          fontSize: 14,
                          fontFamily: AppFonts.regular,
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    _buildForgotPasswordText(),
                    const SizedBox(height: 30),
                    _buildLoginButton(context),
                    const SizedBox(height: 38),
                    _buildLoginWithFb(),
                    const SizedBox(height: 15),
                    _buildLoginWithGoogle(),
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
      );
    });
  }

  /// Builds the "Forgot Password" text widget.
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

  /// Builds the login button widget.
  Widget _buildLoginButton(BuildContext context) {
    return CustomButton(
      buttonName: LanguageString.login.tr,
      onPressed: (startLoading, stopLoading, btnState) {
        if (loginController
                .validateAcField(loginController.accountController.text) &&
            loginController.validatePasswordField(
                loginController.passwordController.text)) {
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

  /// Builds the "Login with Facebook" button widget.
  Widget _buildLoginWithFb() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CommonUi.setSvgImage('fb_logo'),
        const SizedBox(width: 10),
        CommonUi.commonText(
          text: LanguageString.loginWithFb.tr,
          color: AppColors.skyBlue,
          fontFamily: AppFonts.medium,
        ),
      ],
    );
  }

  /// Builds the "Login with Google" button widget.
  Widget _buildLoginWithGoogle() {
    return Obx(
      () {
        return loginController.isGoogleSignIn.value
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.mistyGray),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonUi.setSvgImage('google_icon', height: 20, width: 20),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: loginController.signInWithGoogle,
                    child: CommonUi.commonText(
                      text: LanguageString.loginWithGoogle.tr,
                      color: commonLogicsController.isDarkMode.value
                          ? AppColors.white
                          : AppColors.black,
                      fontFamily: AppFonts.medium,
                    ),
                  ),
                ],
              );
      },
    );
  }

  /// Builds a divider with text in the middle.
  Widget _buildDividerWithText(String text) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: commonLogicsController.isDarkMode.value
                ? AppColors.milkyWhite
                : AppColors.customGray,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: CommonUi.commonText(
            text: text,
            size: 12,
            color: commonLogicsController.isDarkMode.value
                ? AppColors.milkyWhite
                : AppColors.semiTransparentBlack,
            fontFamily: AppFonts.semiBold,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: commonLogicsController.isDarkMode.value
                ? AppColors.milkyWhite
                : AppColors.customGray,
          ),
        ),
      ],
    );
  }

  /// Builds the "Sign Up" text widget.
  Widget _buildSignUpText() {
    return RichText(
      text: TextSpan(
        text: LanguageString.dontHaveAnAccount.tr,
        style: TextStyle(
          color: commonLogicsController.isDarkMode.value
              ? AppColors.milkyWhite
              : AppColors.semiTransparentBlack,
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
