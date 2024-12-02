import 'package:get/get.dart';
import 'package:insta_demo/dashboard/add/add_post_controller.dart';

class AddPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddPostController>(() => AddPostController());
  }
}