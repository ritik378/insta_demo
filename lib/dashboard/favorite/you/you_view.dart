import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/common_logics/common_logics_controller.dart';
import 'package:insta_demo/common/common_ui.dart';

class YouView extends StatelessWidget {
  YouView({super.key});

  final CommonLogicsController commonLogicsController = Get.find<
      CommonLogicsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: commonLogicsController.isDarkMode.value ? AppColors
            .darkTheme : AppColors.paleWhite,
        body: Center(
          child: CommonUi.commonText(text: "You View",
              color: commonLogicsController.isDarkMode.value
                  ? AppColors.white
                  : AppColors.black),
        ),
      );
    });
  }
}
