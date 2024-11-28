import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/custom_app_bar.dart';
import 'package:insta_demo/common/language/language_string.dart';
import 'package:insta_demo/dashboard/favorite/favorite_controller.dart';
import '../../common/app_fonts.dart';

class FavoriteView extends StatelessWidget {
  FavoriteView({super.key});

  /// The controller for managing the favorite view's state.
  final FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.paleWhite,
      bottom: false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: CustomAppBar(
            color: AppColors.paleWhite,
            bottom: _buildTabBar(),
          ),
          body: TabBarView(
            children: favoriteController.screenList,
          ),
        ),
      ),
    );
  }

  /// Builds the [TabBar] for the favorite view.
  TabBar _buildTabBar() {
    return TabBar(
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: AppColors.darkCharcoal,
      indicatorWeight: 1.0,
      labelStyle: const TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.semiBold,
        color: AppColors.darkCharcoal,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
        fontFamily: AppFonts.semiBold,
        color: AppColors.semiTransparentBlack,
      ),
      tabs: [
        Tab(text: LanguageString.following.tr),
        Tab(text: LanguageString.you.tr),
      ],
    );
  }
}
