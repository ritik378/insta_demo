import 'package:get/get.dart';
import 'package:insta_demo/dashboard/add/add_binding.dart';
import 'package:insta_demo/dashboard/add/add_view.dart';
import 'package:insta_demo/dashboard/dashboard_binding.dart';
import 'package:insta_demo/dashboard/dashboard_view.dart';
import 'package:insta_demo/dashboard/favorite/favorite_binding.dart';
import 'package:insta_demo/dashboard/favorite/favorite_view.dart';
import 'package:insta_demo/dashboard/favorite/following/following_binding.dart';
import 'package:insta_demo/dashboard/favorite/you/you_binding.dart';
import 'package:insta_demo/dashboard/favorite/you/you_view.dart';
import 'package:insta_demo/dashboard/home/home_binding.dart';
import 'package:insta_demo/dashboard/home/home_view.dart';
import 'package:insta_demo/dashboard/profile/profile_binding.dart';
import 'package:insta_demo/dashboard/profile/profile_view.dart';
import 'package:insta_demo/dashboard/search/search_binding.dart';
import 'package:insta_demo/dashboard/search/search_view.dart';
import 'package:insta_demo/login/login_binding.dart';
import 'package:insta_demo/login/login_view.dart';
import 'package:insta_demo/navigation/app_routes.dart';
import 'package:insta_demo/splash/splash_binding.dart';
import 'package:insta_demo/splash/splash_view.dart';

import '../dashboard/favorite/following/following_view.dart';

class RoutesManager {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardView(),
      bindings: [
        DashboardBinding(),
        HomeBinding(),
        FavoriteBinding(),
        SearchBinding(),
        ProfileBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.add,
      page: () => AddView(),
      binding: AddBinding(),
      transition: Transition.leftToRight, // Slide in from the left
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.favorite,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.following,
      page: () => const FollowingView(),
      binding: FollowingBinding(),
    ),
    GetPage(
      name: AppRoutes.you,
      page: () => const YouView(),
      binding: YouBinding(),
    ),
  ];
}
