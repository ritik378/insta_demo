import 'package:get/get.dart';
import 'package:insta_demo/dashboard/favorite/following/following_view.dart';
import 'package:insta_demo/dashboard/favorite/you/you_view.dart';

/// Controller for managing the favorite screen state.
class FavoriteController extends GetxController {
  /// List of screens to be displayed in the favorite section.
  var screenList = [
    const FollowingView(),
    const YouView(),
  ].obs;
}