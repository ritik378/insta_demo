import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_fonts.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/common/language/language_string.dart';

/// A view representing the following screen.
class FollowingView extends StatelessWidget {
  const FollowingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildGridLikedPostsSection(3),
              _buildMultipleLikedSection(),
              _buildStartFollowingSection(),
              _buildGridLikedPostsSection(8),
              _buildMultipleLikedSection(),
              _buildMultipleLikedSection(),
              _buildCommentLikedSection(),
              _buildGridLikedPostsSection(3),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds a section displaying a grid of liked posts.
  Widget _buildGridLikedPostsSection(int itemCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          _buildProfileRow(
              "karennne",
              " ${LanguageString.liked.tr} $itemCount ${LanguageString.posts.tr}.",
              "3h"),
          Padding(
            padding: const EdgeInsets.only(left: 56),
            child: GridView.builder(
              padding: const EdgeInsets.all(0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.0,
              ),
              itemCount: itemCount,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CommonUi.setPngImage("liked_post",
                    height: 44, width: 44);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a section displaying multiple liked posts.
  Widget _buildMultipleLikedSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          _buildStackedProfileImages(),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "kiero_d, zackzone ",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                    TextSpan(
                      text: LanguageString.and.tr,
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                    const TextSpan(
                      text: " craig_love",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: LanguageString.liked.tr,
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                    const TextSpan(
                      text: " joshua_l",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                    const TextSpan(
                      text: " photo.",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                    const TextSpan(
                      text: " 3h",
                      style: TextStyle(
                          color: AppColors.semiTransparentBlack,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          CommonUi.setPngImage("liked_post", height: 44, width: 44),
        ],
      ),
    );
  }

  /// Builds a section displaying users who started following.
  Widget _buildStartFollowingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CommonUi.setPngImage("profile_image", height: 44, width: 44),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "kiero_d,",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                    const TextSpan(
                      text: " zackzone ",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                    TextSpan(
                      text: LanguageString.and.tr,
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "craig_love",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                    const TextSpan(
                      text: " start following ",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                    TextSpan(
                      text: LanguageString.smallYou.tr,
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds a section displaying liked comments.
  Widget _buildCommentLikedSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CommonUi.setPngImage("profile_image", height: 44, width: 44),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(
                      text: "kiero_d",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                    TextSpan(
                      text: ' ${LanguageString.liked.tr} ',
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                    const TextSpan(
                      text: "martini_round's",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.semiBold),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "${LanguageString.comment.tr}:",
                      style: const TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                    const TextSpan(
                      text: " @martini_round ",
                      style: TextStyle(
                          color: AppColors.primaryBlue,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                    const TextSpan(
                      text: "Nice! ",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                    const TextSpan(
                      text: "3h",
                      style: TextStyle(
                          color: AppColors.black,
                          fontSize: 13,
                          fontFamily: AppFonts.regular),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          CommonUi.setPngImage("liked_post", height: 44, width: 44),
        ],
      ),
    );
  }

  /// Builds a row displaying profile information.
  Widget _buildProfileRow(String name, String action, String time) {
    return Row(
      children: [
        CommonUi.setPngImage("profile_image", height: 44, width: 44),
        const SizedBox(width: 12),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: name,
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 13,
                    fontFamily: AppFonts.semiBold),
              ),
              TextSpan(
                text: " $action",
                style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 13,
                    fontFamily: AppFonts.regular),
              ),
              TextSpan(
                text: " $time",
                style: const TextStyle(
                    color: AppColors.semiTransparentBlack,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds a widget displaying stacked profile images.
  Widget _buildStackedProfileImages() {
    return SizedBox(
      height: 44,
      width: 44,
      child: Stack(
        children: [
          CommonUi.setPngImage("profile_image", height: 32, width: 32),
          Positioned(
            top: 11,
            left: 11,
            child: CommonUi.setPngImage("profile_two", height: 32, width: 32),
          ),
        ],
      ),
    );
  }
}
