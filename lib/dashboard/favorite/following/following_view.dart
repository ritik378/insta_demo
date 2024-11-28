import 'package:flutter/material.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_fonts.dart';
import 'package:insta_demo/common/common_ui.dart';

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
  ///
  /// [itemCount] is the number of items to display in the grid.
  Widget _buildGridLikedPostsSection(int itemCount) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          _buildProfileRow("karennne", "liked $itemCount posts.", "3h"),
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
                return CommonUi.setPngImage("liked_post", height: 44, width: 44);
              },
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a section displaying multiple liked posts by different users.
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
              _buildRichText("kiero_d, zackzone", "and", "craig_love"),
              _buildRichText("liked", "joshua_l", "photo. 3h"),
            ],
          ),
          const Spacer(),
          CommonUi.setPngImage("liked_post", height: 44, width: 44),
        ],
      ),
    );
  }

  /// Builds a section displaying a user starting to follow another user.
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
              _buildRichText("kiero_d", "start following", ""),
              _buildRichText("craig_love.", "3h", ""),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds a section displaying a liked comment.
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
              _buildRichText("kiero_d", "liked", "martini_round's"),
              _buildRichText("comment:", "@martini_round Nice! 3h", ""),
            ],
          ),
          const Spacer(),
          CommonUi.setPngImage("liked_post", height: 44, width: 44),
        ],
      ),
    );
  }

  /// Builds a row displaying a profile image, action, and time.
  ///
  /// [name] is the name of the user.
  /// [action] is the action performed by the user.
  /// [time] is the time when the action was performed.
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
                    color: AppColors.darkCharcoal,
                    fontSize: 13,
                    fontFamily: AppFonts.semiBold),
              ),
              TextSpan(
                text: " $action",
                style: const TextStyle(
                    color: AppColors.darkCharcoal,
                    fontSize: 13,
                    fontFamily: AppFonts.regular),
              ),
              TextSpan(
                text: " $time",
                style: const TextStyle(
                  color: AppColors.semiTransparentBlack,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
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

  /// Builds a [RichText] widget with three text spans.
  ///
  /// [text1] is the first part of the text.
  /// [text2] is the second part of the text.
  /// [text3] is the third part of the text.
  Widget _buildRichText(String text1, String text2, String text3) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: const TextStyle(
                color: AppColors.darkCharcoal,
                fontSize: 13,
                fontFamily: AppFonts.semiBold),
          ),
          TextSpan(
            text: " $text2",
            style: const TextStyle(
                color: AppColors.darkCharcoal,
                fontSize: 13,
                fontFamily: AppFonts.regular),
          ),
          TextSpan(
            text: " $text3",
            style: const TextStyle(
              color: AppColors.darkCharcoal,
              fontSize: 13,
              fontFamily: AppFonts.semiBold,
            ),
          ),
        ],
      ),
    );
  }
}