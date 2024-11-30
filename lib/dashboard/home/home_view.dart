import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story/flutter_story.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_fonts.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/common/custom_app_bar.dart';
import 'package:insta_demo/common/language/language_string.dart';
import 'package:insta_demo/dashboard/home/home_controller.dart';
import 'package:insta_demo/dashboard/home/story_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:video_player/video_player.dart';

/// A view representing the home screen with stories and posts.
class HomeView extends StatelessWidget {
  /// Creates a [HomeView] widget.
  HomeView({super.key});

  /// The controller for managing the home state.
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildStories(),
          Expanded(child: _buildPostList()),
        ],
      ),
    );
  }

  /// Builds the custom app bar for the home screen.
  CustomAppBar _buildAppBar() {
    return CustomAppBar(
      title: CommonUi.setSvgImage('instagram_text', height: 28, width: 105),
      leading: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CommonUi.setSvgImage('camera_icon'),
      ),
      centerTitle: true,
      actions: [
        CommonUi.setSvgImage('igtv_icon'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: CommonUi.setSvgImage('messanger'),
        ),
      ],
    );
  }

  /// Builds the stories section.
  Widget _buildStories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return Story.builder(
            controller: homeController.storyController.value,
            itemCount: homeController.stories.length,
            itemBuilder: (context, index) {
              StoryModel s = homeController.stories[index];
              return StoryUser(
                avatar: s.avatar,
                label: s.label,
                margin: const EdgeInsets.symmetric(horizontal: 7),
                children: s.cards?.map((card) {
                      return StoryCard(
                        visited: card.visited.value,
                        onVisited: (cardIndex) {
                          card.visited.value = true;
                          homeController.stories.refresh();
                        },
                        footer: StoryCardFooter(
                          messageBox: StoryCardMessageBox(
                            child: Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: MediaQuery.of(context).size.width / 1.5,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildReactionRow(["😂", "😮", "😍"]),
                                    const SizedBox(height: 30),
                                    _buildReactionRow(["😢", "👏", "🔥"]),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          likeButton:
                              StoryCardLikeButton(onLike: (cardLike) {}),
                          forwardButton:
                              StoryCardForwardButton(onForward: (cardIndex) {}),
                        ),
                        cardDuration: card.duration,
                        childOverlay: card.childOverlay,
                        child: card.child,
                      );
                    }).toList() ??
                    [],
              );
            },
          );
        }),
        const Divider(
          height: 0,
          color: AppColors.semiTransparentBlack,
          thickness: 0.5,
        ),
      ],
    );
  }

  /// Builds a row of reaction emojis.
  Widget _buildReactionRow(List<String> emojis) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: emojis.map((emoji) {
        return MaterialButton(
          minWidth: 0,
          padding: EdgeInsets.zero,
          shape: const CircleBorder(),
          child: Text(emoji, style: const TextStyle(fontSize: 32)),
          onPressed: () {},
        );
      }).toList(),
    );
  }

  /// Builds the list of posts.
  Widget _buildPostList() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => _buildPost(),
    );
  }

  /// Builds a single post.
  Widget _buildPost() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPostHeader(),
        _buildPostCarousel(),
        _buildPostActions(),
        _buildPostLikes(),
        _buildPostDescription(),
      ],
    );
  }

  /// Builds the header of a post.
  Widget _buildPostHeader() {
    return Padding(
      padding: const EdgeInsets.all(11),
      child: Row(
        children: [
          CommonUi.setPngImage('profile_image', height: 40, width: 40),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CommonUi.commonText(
                      text: "joshua_i",
                      size: 13,
                      fontFamily: AppFonts.semiBold),
                  const SizedBox(width: 4),
                  CommonUi.setSvgImage('blue_tick'),
                ],
              ),
              CommonUi.commonText(
                  text:
                      "${LanguageString.tokyo.tr}, ${LanguageString.japan.tr}",
                  color: AppColors.black,
                  size: 11.0,
                  fontFamily: AppFonts.regular),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(5),
            child: CommonUi.setSvgImage("more_horizontal"),
          ),
        ],
      ),
    );
  }

  /// Builds the carousel of post content.
  Widget _buildPostCarousel() {
    return GetBuilder<HomeController>(
      builder: (logic) {
        return CarouselSlider.builder(
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: false,
            initialPage: homeController.postIndex.value,
            onPageChanged: (index, reason) {
              homeController.onChangePostIndex(index);
              for (var i = 0; i < homeController.mediaController.length; i++) {
                if (i != index &&
                    homeController.mediaController[i].value.isPlaying) {
                  homeController.mediaController[i].pause();
                }
              }
            },
          ),
          itemCount: homeController.postUrls.length,
          itemBuilder: (context, index, realIndex) {
            final controller = homeController.mediaController[index];
            final contentUrl = homeController.postUrls[index];

            if (contentUrl.endsWith('.mp4')) {
              return Center(
                child: FutureBuilder<void>(
                  future: controller.initialize(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return AspectRatio(
                        aspectRatio: controller.value.aspectRatio,
                        child: VideoPlayer(controller),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(child: Text('Error loading video'));
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              );
            } else {
              return Container(
                margin: const EdgeInsets.only(right: 2),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(contentUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  /// Builds the actions row for a post.
  Widget _buildPostActions() {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CommonUi.setSvgImage("favorite_icon"),
              const SizedBox(width: 14),
              CommonUi.setSvgImage("comment"),
              const SizedBox(width: 14),
              CommonUi.setSvgImage("messanger"),
            ],
          ),
          Obx(
            () => AnimatedSmoothIndicator(
              activeIndex: homeController.postIndex.value,
              count: homeController.postUrls.length,
              effect: const SlideEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: AppColors.skyBlue,
                dotColor: AppColors.customGray,
              ),
            ),
          ),
          Row(
            children: [
              CommonUi.setSvgImage("comment", color: Colors.transparent),
              const SizedBox(width: 14),
              CommonUi.setSvgImage("messanger", color: Colors.transparent),
              const SizedBox(width: 14),
              CommonUi.setSvgImage("save"),
            ],
          ),
        ],
      ),
    );
  }

  /// Builds the likes section of a post.
  Widget _buildPostLikes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        children: [
          CommonUi.setPngImage("profile_image", height: 18, width: 18),
          const SizedBox(width: 6),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${LanguageString.liked.tr} ",
                  style: const TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.regular,
                      fontSize: 13),
                ),
                TextSpan(
                  text: "${LanguageString.by.tr} ",
                  style: const TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.regular,
                      fontSize: 13),
                ),
                const TextSpan(
                  text: "craig_love, ",
                  style: TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.semiBold,
                      fontSize: 13),
                ),
                TextSpan(
                  text: LanguageString.and.tr,
                  style: const TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.regular,
                      fontSize: 13),
                ),
                const TextSpan(
                  text: " 44,484 ",
                  style: TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.semiBold,
                      fontSize: 13),
                ),
                TextSpan(
                  text: LanguageString.others.tr,
                  style: const TextStyle(
                      color: AppColors.black,
                      fontFamily: AppFonts.semiBold,
                      fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the description section of a post.
  Widget _buildPostDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      child: RichText(
        text: const TextSpan(
          children: [
            TextSpan(
              text: "joshua_i ",
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: AppFonts.semiBold,
                  fontSize: 13),
            ),
            TextSpan(
              text:
                  "The game in Japan was amazing and I want to share some photos",
              style: TextStyle(
                  color: AppColors.black,
                  fontFamily: AppFonts.regular,
                  fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
