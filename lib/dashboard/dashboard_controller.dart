import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/dashboard/add/add_view.dart';
import 'package:insta_demo/dashboard/favorite/favorite_view.dart';
import 'package:insta_demo/dashboard/home/home_view.dart';
import 'package:insta_demo/dashboard/profile/profile_view.dart';
import 'package:insta_demo/dashboard/search/search_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class DashboardController extends GetxController {
  var currentIndex = 0.obs;
  PersistentTabController bottomNavController =
      PersistentTabController(initialIndex: 0);

  List<Widget> navScreens = [
    HomeView(),
    const SearchView(),
    const AddView(),
    const FavoriteView(),
    const ProfileView(),
  ];

  void onItemSelected(int index) {
    currentIndex.value = index;
  }

  List<PersistentBottomNavBarItem> navBarItems = [
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage(
        'home_icon',
      ),
      inactiveIcon: CommonUi.setSvgImage('home_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage(
        'search_icon',
      ),
      inactiveIcon: CommonUi.setSvgImage('search_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage(
        'add_icon',
      ),
      inactiveIcon: CommonUi.setSvgImage('add_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
      icon: CommonUi.setSvgImage(
        'favorite_icon',
      ),
      inactiveIcon: CommonUi.setSvgImage('favorite_icon', color: Colors.grey),
    ),
    PersistentBottomNavBarItem(
        icon: CommonUi.setPngImage('profile_image', height: 30, width: 30)),
  ];
}
