import 'package:get/get.dart';
import 'package:insta_demo/dashboard/add/add_controller.dart';

class AddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddController>(() => AddController());
  }
}