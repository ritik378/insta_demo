import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/common_logics/common_logics_controller.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/splash/splash_controller.dart';

import '../common/app_keys.dart';

class SplashView extends StatelessWidget {
  //Instance of SplashController
  final SplashController splashController = Get.find();
  final CommonLogicsController commonLogicsController = Get.find();
  SplashView({super.key});
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: AppColors.lightTheme,
          body: SafeArea(
            bottom: false,
            child: Center(
              child: CommonUi.setPngImage('insta_logo',
                  height: 100.0, width: 100.0),
            ),
          ),
        );
  }
}
