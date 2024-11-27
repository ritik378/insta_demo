import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/dashboard/home/story_model.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_story/flutter_story.dart';

class HomeController extends GetxController {
  // var userStories = <StoryModel>[
  //   StoryModel(userName: "Rahul", userImage: "profile_image"),
  //   StoryModel(userName: "Ritik", userImage: "profile_image"),
  //   StoryModel(userName: "Ankit", userImage: "profile_image"),
  //   StoryModel(userName: "Vashu", userImage: "profile_image"),
  //   StoryModel(userName: "Priyanshu", userImage: "profile_image"),
  //   StoryModel(userName: "Harshit", userImage: "profile_image"),
  // ];
  var postIndex = 0.obs;
  List<String> postUrls = [
    "https://plus.unsplash.com/premium_photo-1691030925341-71b0a6994815?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8c291dGglMjBpbmRpYW4lMjB0ZW1wbGV8ZW58MHx8MHx8fDA%3D",
    "https://t3.ftcdn.net/jpg/06/18/51/68/360_F_618516899_5MTPaCA96bARDcFysmB2XZYfzuOiJrtx.jpg",
    "https://media.istockphoto.com/id/1432894575/photo/view-of-the-main-entrance-tower-of-jambukeswarar-temple-thiruvanaikaval-which-represent.jpg?s=612x612&w=0&k=20&c=exMeR-_PRybIBTgbZYu4nJR2L0D8KWYbrS2tLFzNq2o=",
    "https://static.videezy.com/system/resources/previews/000/000/168/original/Record.mp4",
  ];

  var mediaController = <VideoPlayerController>[];
  var isPlaying = false.obs;
  var storyController = StoryController().obs;
  late List<StoryModel> stories;


  @override
  void onInit() async {
    stories = getStories();
    await shortData();
    print(stories.length);
    super.onInit();
  }

  List<StoryModel> getStories() {
    List<StoryModel> storyList = [];
    for (int i = 1; i <= 10; i++) {
      storyList.add(StoryModel(
          id: i + 2,
          avatar: Image.asset("assets/images/profile_image.png"),
          label: Text(
            userLabel(i),
            style: const TextStyle(color: Colors.black),
          ),
          cards: [
            storyCard1(i),
            storyCard2(i),
          ]));
    }
    return storyList;
  }


  StoryCardModel storyCard1(int i) => StoryCardModel(
    color: Colors.purple,
    childOverlay: Container(
      margin: const EdgeInsets.all(50),
      child: const Center(
        child: Text(
          "Lorem Ipsum is simply dummy text of the printing "
              "and typesetting industry. Lorem Ipsum has been the industry's "
              "standard dummy text ever since the 1500s, when an unknown "
              "printer took a galley of type and scrambled it to "
              "make a type specimen book. It has survived not only five centuries,"
              " but also the leap into electronic typesetting, "
              "remaining essentially unchanged. It was popularised in the 1960s "
              "with the release of Letraset sheets containing "
              "Lorem Ipsum passages, and more recently with "
              "desktop publishing software like Aldus PageMaker "
              "including versions of Lorem Ipsum.",
          style: TextStyle(color: Colors.white, fontSize: 20, height: 1.5),
        ),
      ),
    ),
  );

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
              child: Text(
                "user $i",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
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
              child: Text(
                "This is a container widget",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 350,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.black.withAlpha(50),
                border: Border.all(color: Colors.white, width: 1)),
            child: Center(
              child: Text(
                "This is a container widget",
                style:
                TextStyle(color: Colors.white, fontSize: 20, shadows: [
                  Shadow(
                      color: Colors.black.withAlpha(150),
                      blurRadius: 20,
                      offset: const Offset(0, 0))
                ]),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              "Story $i",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                shadows: [
                  Shadow(
                      color: Colors.red,
                      blurRadius: 20,
                      offset: Offset(0, 0))
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

  String userLabel(int storyIndex) {
    String label = "";
    switch (storyIndex) {
      case 1:
        return "Oliver";
      case 2:
        return "Liam";
      case 3:
        return "Benjamin";
      case 4:
        return "James";
      case 5:
        return "Alexander";
      case 6:
        return "John";
      case 7:
        return "Ava";
      case 8:
        return "Emma";
      case 9:
        return "Ava";
      case 10:
        return "Lili";
    }
    return label;
  }

  Future<void> shortData() async {
    List<Future<void>> initControllers = [];
    for (var url in postUrls) {
      if (url.endsWith('.mp4')) {
        var controller = VideoPlayerController.networkUrl(Uri.parse(url));
        initControllers.add(
          controller.initialize().then((_) {
            mediaController.add(controller);
            controller.setLooping(true); // Optionally enable looping
          }).catchError((error) {
            print('Error initializing video controller: $error');
          }),
        );
      } else {
        mediaController
            .add(VideoPlayerController.asset(url)); // For images, if applicable
      }
    }

    // Wait for all controllers to be initialized
    Future.wait(initControllers).then((_) {
      update(); // Call update only once after all controllers are initialized
    });
  }

  @override
  void onClose() {
    // Dispose video controllers when the controller is closed
    for (var controller in mediaController) {
      controller.dispose();
    }
    super.onClose();
  }


  void onChangePostIndex(int index) {
    postIndex.value = index;

    // Play the video when it is swiped into view
    if (mediaController.isNotEmpty && index < mediaController.length) {
      final controller = mediaController[index];

      // Ensure the controller is initialized before attempting to play
      if (controller.value.isInitialized) {
        if (controller.value.isPlaying) {
          // If it's already playing, pause it before restarting
          controller.pause();
        }
        controller.play();
        isPlaying.value = true; // Set play state to true
      } else {
        // Wait for the video to initialize before playing
        controller.addListener(() {
          if (controller.value.isInitialized && !controller.value.isPlaying) {
            controller.play();
            isPlaying.value = true;
          }
        });
      }
    }
  }

// Method to toggle play/pause
// void togglePlayPause(int index) {
//   if (mediaController.isNotEmpty && index < mediaController.length) {
//     final controller = mediaController[index];
//     if (controller.value.isInitialized) {
//       if (controller.value.isPlaying) {
//         controller.pause();
//         isPlaying.value = false; // Set play state to false
//       } else {
//         controller.play();
//         isPlaying.value = true; // Set play state to true
//       }
//     }
//   }
// }
}
