import 'package:get/get.dart';
import 'package:insta_demo/dashboard/favorite/you/you_controller.dart';

class YouBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<YouController>(() => YouController());
  }
}