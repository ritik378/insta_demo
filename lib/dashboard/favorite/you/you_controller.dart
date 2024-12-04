import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YouController extends GetxController with SingleGetTickerProviderMixin {
  var animateContainerHeight = 100.0.obs;
  var animateContainerWidth = 200.0.obs;
  var isAnimated = false.obs;
  var containerOpacity = 1.0.obs;
  var isFadeFirst = true.obs;
  late Animation<double> animation;
  late AnimationController animationController;

  var tweenSize = 100.0.obs;
  var tweenColor = Rx<Color>(Colors.blue);


@override
  void onInit() {
  animationController =
      AnimationController(
        duration: const Duration(seconds: 20),
        vsync: this,
      );
  animation =
      Tween<double>(begin: 100.0, end: 400.0)
          .animate(animationController);
    super.onInit();
  }
  var myDeco = BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
  ).obs;
}
