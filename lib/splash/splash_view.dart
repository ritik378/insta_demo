import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/splash/splash_controller.dart';

class SplashView extends StatelessWidget {
  //Instance of SplashController
  final SplashController splashController = Get.find();

  SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: Center(
          child:
              CommonUi.setPngImage('insta_logo', height: 100.0, width: 100.0),
        ),
      ),
    );
  }
}
