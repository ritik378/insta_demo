import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_fonts.dart';
import 'package:insta_demo/common/common_logics/common_logics_controller.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/dashboard/favorite/you/hero_animation_view.dart';
import 'package:insta_demo/dashboard/favorite/you/you_controller.dart';
import 'package:lottie/lottie.dart';

class YouView extends StatelessWidget {
  YouView({super.key});

  final CommonLogicsController commonLogicsController =
      Get.find<CommonLogicsController>();
  final YouController youController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: commonLogicsController.isDarkMode.value
              ? AppColors.darkTheme
              : AppColors.lightTheme,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        height: youController.animateContainerHeight.value,
                        width: youController.animateContainerWidth.value,
                        decoration: youController.myDeco.value,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (youController.isAnimated.value) {
                            youController.animateContainerHeight.value = 100;
                            youController.animateContainerWidth.value = 200;
                            youController.myDeco.value = BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            );
                            youController.isAnimated.value =
                                !youController.isAnimated.value;
                          } else {
                            youController.animateContainerHeight.value = 200;
                            youController.animateContainerWidth.value = 100;
                            youController.myDeco.value = BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(2),
                            );
                            youController.isAnimated.value =
                                !youController.isAnimated.value;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.skyBlue,
                        ),
                        child: CommonUi.commonText(
                            text: "Animate",
                            color: AppColors.white,
                            fontFamily: AppFonts.semiBold),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedOpacity(
                        opacity: youController.containerOpacity.value,
                        duration: const Duration(seconds: 2),
                        child: Container(
                          height: 100,
                          width: 200,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (youController.containerOpacity.value == 1.0) {
                            youController.containerOpacity.value = 0.0;
                          } else {
                            youController.containerOpacity.value = 1.0;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.skyBlue,
                        ),
                        child: CommonUi.commonText(
                            text: "Change Opacity",
                            color: AppColors.white,
                            fontFamily: AppFonts.semiBold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedCrossFade(
                        firstChild: Container(
                          height: 100,
                          width: 200,
                          color: Colors.yellow,
                        ),
                        secondChild: Container(
                          height: 100,
                          width: 200,
                          color: Colors.purple,
                        ),
                        crossFadeState: youController.isFadeFirst.value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(seconds: 2),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          youController.isFadeFirst.value =
                              !youController.isFadeFirst.value;
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.skyBlue,
                        ),
                        child: CommonUi.commonText(
                            text: "Cross Fade",
                            color: AppColors.white,
                            fontFamily: AppFonts.semiBold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Hero(
                    tag: "hero",
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HeroAnimationView(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.skyBlue,
                      ),
                      child: CommonUi.commonText(
                          text: "Hero Animation",
                          color: AppColors.white,
                          fontFamily: AppFonts.semiBold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        height: youController.tweenSize.value,
                        width: youController.tweenSize.value,
                        decoration: BoxDecoration(
                          color: youController.tweenColor.value,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          final colorTween =
                              ColorTween(begin: Colors.blue, end: Colors.red)
                                  .animate(youController.animationController);
                          youController.animationController.addListener(() {
                            youController.tweenSize.value =
                                youController.animation.value;
                            youController.tweenColor.value = colorTween.value!;
                          });
                          youController.animationController.forward();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.skyBlue,
                        ),
                        child: CommonUi.commonText(
                            text: "Tween Animation",
                            size: 18,
                            color: AppColors.white,
                            fontFamily: AppFonts.medium),
                      ),
                    ],
                  ),
                  Lottie.network(
                      'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/B.json'),
                  Lottie.asset('assets/lotties/LogoSmall.json'),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

