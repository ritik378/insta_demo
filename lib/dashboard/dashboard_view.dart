import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/common_logics/common_logics_controller.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/dashboard/dashboard_controller.dart';
import 'package:insta_demo/navigation/app_routes.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

/// A view representing the dashboard screen with a bottom navigation bar.
class DashboardView extends StatelessWidget {
  DashboardView({super.key});

  /// Controller for managing the state of the dashboard.
  final dashboardController = Get.find<DashboardController>();

  /// Controller for managing common logic states.
  final commonLogicsController = Get.find<CommonLogicsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        /// Determines if the dark mode is enabled.
        final isDarkMode = commonLogicsController.isDarkMode.value;

        /// Sets the theme color based on the dark mode state.
        final themeColor =
            isDarkMode ? AppColors.darkTheme : AppColors.lightTheme;

        /// Sets the border for the navigation bar based on the dark mode state.
        final border = isDarkMode
            ? null
            : const Border(
                top: BorderSide(color: AppColors.mistyGray, width: 1.0));

        return ColorfulSafeArea(
          color: themeColor,
          bottom: false,
          child: Scaffold(
            /// Displays the first screen in the navigation list.
            body: dashboardController.navScreens[0],

            /// Configures the bottom navigation bar.
            bottomNavigationBar: PersistentTabView(
              onItemSelected: dashboardController.onItemSelected,
              navBarHeight: 78,
              context,
              controller: dashboardController.bottomNavController,
              decoration: NavBarDecoration(border: border),
              items: _navBarItems(isDarkMode),
              screens: dashboardController.navScreens,
              backgroundColor: themeColor,
              navBarStyle: NavBarStyle.style6,
            ),
          ),
        );
      },
    );
  }

  /// Returns a list of navigation bar items based on the dark mode state.
  List<PersistentBottomNavBarItem> _navBarItems(bool isDarkMode) {
    final color = isDarkMode ? AppColors.white : Colors.grey;

    return [
      PersistentBottomNavBarItem(
        icon: CommonUi.setSvgImage('home_icon',
            color: isDarkMode ? AppColors.white : null),
        inactiveIcon: CommonUi.setSvgImage('inactive_home_icon', color: color),
      ),
      PersistentBottomNavBarItem(
        icon: CommonUi.setSvgImage('search_active_icon',
            color: isDarkMode ? AppColors.white : null),
        inactiveIcon:
            CommonUi.setSvgImage('search_inactive_icon', color: color),
      ),
      PersistentBottomNavBarItem(
        icon: CommonUi.setSvgImage('add_icon',
            color: isDarkMode ? AppColors.white : null),
        inactiveIcon: CommonUi.setSvgImage('add_icon', color: color),
        onPressed: (context) async {
          Get.toNamed(AppRoutes.add);
        },
      ),
      PersistentBottomNavBarItem(
        icon: CommonUi.setSvgImage('active_favorite_icon',
            color: isDarkMode ? AppColors.white : null),
        inactiveIcon:
            CommonUi.setSvgImage('inactive_favorite_icon', color: color),
      ),
      PersistentBottomNavBarItem(
        icon: CommonUi.setPngImage('profile_image', height: 30, width: 30),
      ),
    ];
  }
}