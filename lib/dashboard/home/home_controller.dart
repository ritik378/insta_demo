import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/dashboard/home/story_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_story/flutter_story.dart';

/// Controller for managing the home dashboard.
class HomeController extends GetxController {
  /// Observable index of the current post.
  var postIndex = 0.obs;

  /// Observable flag indicating if a video is playing.
  var isPlaying = false.obs;

  /// Observable controller for managing stories.
  var storyController = StoryController().obs;

  /// List of URLs for posts (images and videos).
  List<String> postUrls = [
    "https://plus.unsplash.com/premium_photo-1691030925341-71b0a6994815?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c291dGglMjBpbmRpYW4lMjB0ZW1wbGV8ZW58MHx8MHx8fDA%3D",
    "https://t3.ftcdn.net/jpg/06/18/51/68/360_F_618516899_5MTPaCA96bARDcFysmB2XZYfzuOiJrtx.jpg",
    "https://media.istockphoto.com/id/1432894575/photo/view-of-the-main-entrance-tower-of-jambukeswarar-temple-thiruvanaikaval-which-represent.jpg?s=612x612&w=0&k=20&c=exMeR-_PRybIBTgbZYu4nJR2L0D8KWYbrS2tLFzNq2o=",
    "https://static.videezy.com/system/resources/previews/000/000/168/original/Record.mp4",
  ];

  /// List of video player controllers for managing video posts.
  var mediaController = <VideoPlayerController>[];

  /// List of story models.
   var stories = [].obs;

  /// Initializes the controller.
  @override
  void onInit() async {
    stories.value = getStories();
    await shortData();
    super.onInit();
  }

  /// Generates a list of story models.
  List<StoryModel> getStories() {
    return List.generate(10, (i) => StoryModel(
      id: i + 3,
      avatar: Image.asset("assets/images/profile_image.png"),
      label: Text(userLabel(i + 1), style: const TextStyle(color: Colors.black)),
      cards: [storyCard1(i + 1), storyCard2(i + 1)],
    ));
  }

  /// Creates the first story card model.
  StoryCardModel storyCard1(int i) => StoryCardModel(
    color: Colors.purple,
    childOverlay: Container(
      margin: const EdgeInsets.all(50),
      child: const Center(
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
          style: TextStyle(color: Colors.white, fontSize: 20, height: 1.5),
        ),
      ),
    ),
  );

  /// Creates the second story card model.
  StoryCardModel storyCard2(int i) => StoryCardModel(
    child: Container(
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text("user $i", style: const TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ),
          const SizedBox(height: 10),
          Image.asset("assets/images/profile_image.png"),
          const SizedBox(height: 10),
          Container(
            width: 250,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.red.withAlpha(150),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: const Center(
              child: Text("This is a container widget", style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 350,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(50),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: Center(
              child: Text(
                "This is a container widget",
                style: TextStyle(color: Colors.white, fontSize: 20, shadows: [
                  Shadow(color: Colors.black.withAlpha(150), blurRadius: 20, offset: const Offset(0, 0))
                ]),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Story $i",
              style: const TextStyle(color: Colors.white, fontSize: 20, shadows: [
                Shadow(color: Colors.red, blurRadius: 20, offset: Offset(0, 0))
              ]),
            ),
          ),
        ],
      ),
    ),
  );

  /// Returns the label for a user based on the story index.
  String userLabel(int storyIndex) {
    switch (storyIndex) {
      case 1: return "Oliver";
      case 2: return "Liam";
      case 3: return "Benjamin";
      case 4: return "James";
      case 5: return "Alexander";
      case 6: return "John";
      case 7: return "Ava";
      case 8: return "Emma";
      case 9: return "Ava";
      case 10: return "Lili";
      default: return "";
    }
  }

  /// Initializes video player controllers for the post URLs.
  Future<void> shortData() async {
    List<Future<void>> initControllers = postUrls.map((url) async {
      if (url.endsWith('.mp4')) {
        var controller = VideoPlayerController.networkUrl(Uri.parse(url));
        await controller.initialize();
        mediaController.add(controller);
        controller.setLooping(true);
      } else {
        mediaController.add(VideoPlayerController.asset(url));
      }
    }).toList();

    await Future.wait(initControllers);
    update();
  }

  /// Disposes of the video player controllers.
  @override
  void onClose() {
    for (var controller in mediaController) {
      controller.dispose();
    }
    super.onClose();
  }

  /// Changes the current post index and manages video playback.
  void onChangePostIndex(int index) {
    postIndex.value = index;
    if (mediaController.isNotEmpty && index < mediaController.length) {
      final controller = mediaController[index];
      if (controller.value.isInitialized) {
        if (controller.value.isPlaying) {
          controller.pause();
        }
        controller.play();
        isPlaying.value = true;
      } else {
        controller.addListener(() {
          if (controller.value.isInitialized && !controller.value.isPlaying) {
            controller.play();
            isPlaying.value = true;
          }
        });
      }
    }
  }
}