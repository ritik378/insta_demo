import 'package:get/get.dart';
import 'package:insta_demo/common/common_logics/common_logics_controller.dart';

class CommonLogicsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommonLogicsController>(() => CommonLogicsController());
  }
}