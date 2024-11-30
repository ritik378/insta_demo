import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/common/custom_app_bar.dart';
import 'package:insta_demo/common/language/language_string.dart';
import 'package:insta_demo/dashboard/profile/profile_controller.dart';
import '../../common/app_fonts.dart';

/// A view representing the profile screen.
class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  /// Controller for managing profile-related state.
  final profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonUi.setSvgImage("private_icon"),
            const SizedBox(width: 6),
            CommonUi.commonText(
              text: "jacob_w",
              size: 16,
              fontFamily: AppFonts.semiBold,
            ),
            const SizedBox(width: 6),
            CommonUi.setSvgImage("down_arrow"),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: CommonUi.setSvgImage("menu_icon"),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 16),
            _buildHighlights(),
            const SizedBox(height: 15),
            Obx(() {
              return DefaultTabController(
                length: 2,
                initialIndex: profileController.currentTabIndex.value,
                child: Column(
                  children: [
                    _buildTabBar(),
                    _buildTabBarView(),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  /// Builds the profile header section.
  ///
  /// \return A widget representing the profile header.
  Widget _buildProfileHeader() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.softGrey, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileStats(),
          const SizedBox(height: 12),
          _buildProfileInfo(),
          const SizedBox(height: 15),
          _buildEditProfileButton(),
        ],
      ),
    );
  }

  /// Builds the profile statistics section.
  ///
  /// \return A widget representing the profile statistics.
  Widget _buildProfileStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CommonUi.customBorderCircleImage(
          childPadding: 5,
          child: CommonUi.setPngImage("profile_image", height: 86, width: 86),
        ),
        _buildStatColumn("54", LanguageString.posts.tr),
        _buildStatColumn("834", LanguageString.followers.tr),
        _buildStatColumn("162", LanguageString.following.tr),
      ],
    );
  }

  /// Builds a column for a profile statistic.
  ///
  /// \param count The count of the statistic.
  /// \param label The label of the statistic.
  /// \return A widget representing the statistic column.
  Widget _buildStatColumn(String count, String label) {
    return Column(
      children: [
        CommonUi.commonText(
            text: count, size: 16, fontFamily: AppFonts.semiBold),
        CommonUi.commonText(
            text: label, size: 13, fontFamily: AppFonts.regular),
      ],
    );
  }

  /// Builds the profile information section.
  ///
  /// \return A widget representing the profile information.
  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonUi.commonText(
            text: "Jacob West", size: 12, fontFamily: AppFonts.semiBold),
        Row(
          children: [
            CommonUi.commonText(
                text: "Digital goodies designer",
                size: 12,
                fontFamily: AppFonts.regular),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: " @pixellz",
                    style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryBlue,
                        fontFamily: AppFonts.regular),
                  ),
                ],
              ),
            ),
          ],
        ),
        CommonUi.commonText(
            text: "Everything is designed.",
            size: 12,
            fontFamily: AppFonts.regular),
      ],
    );
  }

  /// Builds the edit profile button.
  ///
  /// \return A widget representing the edit profile button.
  Widget _buildEditProfileButton() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.softGrey, width: 1),
      ),
      child: Center(
        child: CommonUi.commonText(
            text: LanguageString.editProfile.tr,
            size: 13,
            fontFamily: AppFonts.semiBold),
      ),
    );
  }

  /// Builds the highlights section.
  ///
  /// \return A widget representing the highlights section.
  Widget _buildHighlights() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: profileController.highlightList
            .map((item) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: item))
            .toList(),
      ),
    );
  }

  /// Builds the tab bar.
  ///
  /// \return A widget representing the tab bar.
  Widget _buildTabBar() {
    return Container(
      color: AppColors.white,
      child: TabBar(
        labelColor: AppColors.black,
        unselectedLabelColor: AppColors.customGray,
        indicatorColor: AppColors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 0.1,
        onTap: (index) {
          profileController.currentTabIndex.value = index;
        },
        tabs: [
          Tab(
            child: CommonUi.setSvgImage("grid_icon",
                color: profileController.currentTabIndex.value == 0
                    ? AppColors.black
                    : AppColors.customGray),
          ),
          Tab(
            child: CommonUi.setSvgImage("tags_icon",
                color: profileController.currentTabIndex.value == 1
                    ? AppColors.black
                    : AppColors.customGray),
          ),
        ],
      ),
    );
  }

  /// Builds the tab bar view.
  ///
  /// \return A widget representing the tab bar view.
  Widget _buildTabBarView() {
    return profileController.currentTabIndex.value == 0
        ? _buildGridView(20, "assets/images/liked_post.png")
        : _buildGridView(9, "assets/images/liked_post.png");
  }

  /// Builds a grid view.
  ///
  /// \param itemCount The number of items to display in the grid.
  /// \param imagePath The path to the image to display in the grid items.
  /// \return A widget representing the grid view.
  Widget _buildGridView(int itemCount, String imagePath) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imagePath), fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
