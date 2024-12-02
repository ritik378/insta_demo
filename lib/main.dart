import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_demo/common/language/translation_service.dart';
import 'package:insta_demo/navigation/app_routes.dart';
import 'package:insta_demo/navigation/routes_manager.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: RoutesManager.pages,
      translationsKeys: TranslationService().translations,
      locale: const Locale('en', 'US'),
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Get.defaultTransitionDuration,
    );
  }
}

