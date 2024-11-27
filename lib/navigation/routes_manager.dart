import 'package:get/get.dart';
import 'package:insta_demo/dashboard/add/add_binding.dart';
import 'package:insta_demo/dashboard/add/add_view.dart';
import 'package:insta_demo/dashboard/dashboard_binding.dart';
import 'package:insta_demo/dashboard/dashboard_view.dart';
import 'package:insta_demo/dashboard/favorite/favorite_binding.dart';
import 'package:insta_demo/dashboard/favorite/favorite_view.dart';
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
      bindings: [DashboardBinding(), HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.search,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: AppRoutes.add,
      page: () => const AddView(),
      binding: AddBinding(),
    ),
    GetPage(
      name: AppRoutes.favorite,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
