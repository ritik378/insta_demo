import 'package:get/get.dart';
import 'package:insta_demo/dashboard/favorite/following/following_view.dart';
import 'package:insta_demo/dashboard/favorite/you/you_view.dart';

class FavoriteController extends GetxController {
var screenList=[
 const  FollowingView(),
  const YouView(),
].obs;
}