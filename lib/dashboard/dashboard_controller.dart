import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_demo/common/app_keys.dart';
import 'package:insta_demo/common/common_logics/common_logics_controller.dart';
import 'package:insta_demo/dashboard/favorite/favorite_view.dart';
import 'package:insta_demo/dashboard/home/home_view.dart';
import 'package:insta_demo/dashboard/profile/profile_view.dart';
import 'package:insta_demo/dashboard/search/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

/// Controller for managing the dashboard state and navigation.
class DashboardController extends GetxController {
  /// Observable index of the current selected tab.
  var currentIndex = 0.obs;

  /// Controller for managing the state of the bottom navigation bar.
  final bottomNavController = PersistentTabController(initialIndex: 0);
  CommonLogicsController commonLogicsController = Get.find();

  /// List of screens for the bottom navigation bar.
  final navScreens = [
    HomeView(),
    SearchView(),
    const SizedBox(), // AddView(),
    FavoriteView(),
    ProfileView(),
  ];

  @override
  void onInit() {
    super.onInit();
    commonLogicsController.isDarkMode.value =
        GetStorage().read(AppKeys.isDarkMode) ?? false;
  }

  /// Updates the current index when a tab is selected.
  void onItemSelected(int index) {
    currentIndex.value = index;
  }


}
