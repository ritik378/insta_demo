import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/custom_app_bar.dart';
import 'package:insta_demo/dashboard/add/add_post_controller.dart';

class PostView extends StatelessWidget {
  PostView({super.key});

  final AddPostController addPostController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        addPostController.selectedImage.value = null;
        return true;
      },
      child: Scaffold(
        appBar: CustomAppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              addPostController.selectedImage.value = null;
              Get.back();
            },
          ),
        ),
        body: Obx(
          () {
            if (addPostController.selectedImage.value != null) {
              return Image.file(
                addPostController.selectedImage.value!,
                width: double.infinity,
                fit: BoxFit.cover,
              );
            } else if (addPostController.assets.isNotEmpty) {
              return FutureBuilder<File?>(
                future: addPostController.assets[0].file,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return snapshot.hasData
                        ? Image.file(
                            snapshot.data!,
                            height: 400,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : _placeholder();
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            } else {
              return _placeholder();
            }
          },
        ),
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      height: 400,
      color: Colors.black,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }
}
