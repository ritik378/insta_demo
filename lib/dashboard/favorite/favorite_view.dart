import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/common_logics/common_logics_controller.dart';
import 'package:insta_demo/common/custom_app_bar.dart';
import 'package:insta_demo/common/language/language_string.dart';
import 'package:insta_demo/dashboard/favorite/favorite_controller.dart';
import '../../common/app_fonts.dart';

/// A view representing the favorite screen.
class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});

  /// Controller for managing favorite-related state.
  final favoriteController = Get.find<FavoriteController>();
  final CommonLogicsController commonLogicsController =
  Get.find<CommonLogicsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: commonLogicsController.isDarkMode.value
              ? AppColors.darkTheme
              : AppColors.paleWhite,
          appBar: CustomAppBar(
            color: commonLogicsController.isDarkMode.value
                ? AppColors.darkTheme
                : AppColors.paleWhite,
            bottom: _buildTabBar(),
          ),
          body: TabBarView(
            children: favoriteController.screenList,
          ),
        ),
      );
    });
  }

  /// Builds the tab bar widget.
  TabBar _buildTabBar() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: commonLogicsController.isDarkMode.value
          ? AppColors.white
          : AppColors.black,
      indicatorWeight: 1.0,
      labelStyle: TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.medium,
        color: commonLogicsController.isDarkMode.value
            ? AppColors.white
            : AppColors.black,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.medium,
        color: commonLogicsController.isDarkMode.value
            ? AppColors.white
            : AppColors.semiTransparentBlack,
      ),
      tabs: [
        Tab(text: LanguageString.followings.tr),
        Tab(text: LanguageString.smallYou.tr),
      ],
    );
  }
}
