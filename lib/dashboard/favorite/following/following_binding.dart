import 'package:get/get.dart';
import 'package:insta_demo/dashboard/favorite/following/following_controller.dart';

class FollowingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FollowingController>(
      () => FollowingController(),
    );
  }
}