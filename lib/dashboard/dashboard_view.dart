import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/dashboard/dashboard_controller.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

/// A view representing the dashboard screen with a bottom navigation bar.
class DashboardView extends StatelessWidget {
  /// Creates a [DashboardView] widget.
  DashboardView({super.key});

  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: AppColors.white,
      bottom: false,
      child: Scaffold(
        body: dashboardController.navScreens[1],
        bottomNavigationBar: PersistentTabView(
          onItemSelected: dashboardController.onItemSelected,
          navBarHeight: 78,
          context,
          controller: dashboardController.bottomNavController,
          decoration: const NavBarDecoration(
            border: Border.symmetric(
              horizontal: BorderSide(
                color: AppColors.customGray,
                width: 1,
              ),
            ),
          ),
          items: dashboardController.navBarItems,
          screens: dashboardController.navScreens,
          backgroundColor: AppColors.white,
          navBarStyle: NavBarStyle.style6,
        ),
      ),
    );
  }
}