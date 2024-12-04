import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:insta_demo/common/language/translation_service.dart';
import 'package:insta_demo/navigation/app_routes.dart';
import 'package:insta_demo/navigation/routes_manager.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
    );
  } else if (Platform.isIOS) {
    await Firebase.initializeApp(
      name: 'Create',
      options: FirebaseOptions(
        apiKey: 'AIzaSyBspLyK0TD3VWyD-C-gPxGhpTXhk9Qw66E',
        appId: '1:440193845846:ios:47139bf732ed9f24ed89f7',
        messagingSenderId: '440193845846',
        projectId: 'instademo-33541',
        iosBundleId: 'com.app.NotifyTest',
      ),
    );
  }
  //await Firebase.initializeApp(

    // options: FirebaseOptions(
    //   appId: Platform.isAndroid
    //       ? '1:440193845846:android:2addb7b91355dc7ded89f7'
    //       : '1:440193845846:ios:47139bf732ed9f24ed89f7',
    //   projectId: 'instademo-33541',
    //   apiKey: 'AIzaSyBspLyK0TD3VWyD-C-gPxGhpTXhk9Qw66E',
    //   messagingSenderId: '440193845846',
    //   storageBucket: Platform.isAndroid
    //       ?'instademo-33541.firebasestorage.app' : 'instademo-33541.firebasestorage.app',
    // ),
 // );
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
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      translationsKeys: TranslationService().translations,
      locale: const Locale('en', 'US'),
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Get.defaultTransitionDuration,
    );
  }
}
