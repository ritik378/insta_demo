import 'package:get/get.dart';
import 'package:insta_demo/common/common_logics/common_logics_binding.dart';
import 'package:insta_demo/dashboard/add/add_post_binding.dart';
import 'package:insta_demo/dashboard/add/add_post_view.dart';
import 'package:insta_demo/dashboard/add/post/post_binding.dart';
import 'package:insta_demo/dashboard/add/post/post_view.dart';
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
      bindings:[
        SplashBinding(),
        CommonLogicsBinding(),
      ]
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
        CommonLogicsBinding(),
        YouBinding(),
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
      page: () => AddPostView(),
      binding: AddPostBinding(),
      transition: Transition.leftToRight,
      // Slide in from the left
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
      page: () =>  FollowingView(),
      binding: FollowingBinding(),
    ),
    GetPage(
      name: AppRoutes.you,
      page: () =>  YouView(),
      binding: YouBinding(),
    ),
    GetPage(
      name: AppRoutes.post,
      page: () => PostView(),
      binding: PostBinding(),
    ),
  ];
}
