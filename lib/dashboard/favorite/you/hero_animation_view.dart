import 'package:flutter/material.dart';
import 'package:insta_demo/common/app_fonts.dart';
import 'package:insta_demo/common/common_ui.dart';

class HeroAnimationView extends StatelessWidget {
  const HeroAnimationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "hero",
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: CommonUi.commonText(
                      text: "Hero Animation",
                      color: Colors.white,
                      size: 20,
                      fontFamily: AppFonts.semiBold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
