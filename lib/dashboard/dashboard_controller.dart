import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/dashboard/add/add_view.dart';
import 'package:insta_demo/dashboard/favorite/favorite_view.dart';
import 'package:insta_demo/dashboard/home/home_view.dart';
import 'package:insta_demo/dashboard/profile/profile_view.dart';
import 'package:insta_demo/dashboard/search/search_view.dart';
import 'package:insta_demo/navigation/app_routes.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

/// Controller for managing the dashboard state and navigation.
class DashboardController extends GetxController {
  /// Observable index of the current selected tab.
  var currentIndex = 0.obs;

  /// Controller for managing the state of the bottom navigation bar.
  final bottomNavController = PersistentTabController(initialIndex: 0);

  /// List of screens for the bottom navigation bar.
  final navScreens = [
    HomeView(),
    SearchView(),
    SizedBox(),// AddView(),
    FavoriteView(),
    ProfileView(),
  ];

  /// Updates the current index when a tab is selected.
  void onItemSelected(int index) {
    currentIndex.value = index;
  }

  /// List of items for the bottom navigation bar.
  final navBarItems = [
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage('home_icon'),
      inactiveIcon:
          CommonUi.setSvgImage('inactive_home_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage('search_active_icon'),
      inactiveIcon:
          CommonUi.setSvgImage('search_inactive_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage('add_icon'),
      inactiveIcon: CommonUi.setSvgImage('add_icon', color: Colors.grey),
      onPressed: (context) async {
        Get.toNamed(

            AppRoutes.add);

      },
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage('active_favorite_icon'),
      inactiveIcon:
          CommonUi.setSvgImage('inactive_favorite_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setPngImage('profile_image', height: 30, width: 30),
    ),
  ];
}
