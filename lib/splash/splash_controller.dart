import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_demo/common/app_keys.dart';
import 'package:insta_demo/navigation/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _navigate();
  }

  /// Navigates to the appropriate screen after a delay.
  void _navigate() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        final isLogged = GetStorage().read(AppKeys.isLogged) ?? false;
        Get.offNamed(isLogged ? AppRoutes.dashboard : AppRoutes.login);
      },
    );
  }
}
