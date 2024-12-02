import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_fonts.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/common/custom_app_bar.dart';
import 'package:insta_demo/dashboard/add/add_post_controller.dart';
import 'package:insta_demo/navigation/app_routes.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostView extends StatelessWidget {
  AddPostView({super.key});

  final AddPostController addPostController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Get.back(),
        ),
        title: CommonUi.commonText(
            text: 'New Post', fontFamily: AppFonts.semiBold, size: 20.0),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.post);
            },
            child: CommonUi.commonText(
                text: 'Next',
                fontFamily: AppFonts.semiBold,
                size: 16.0,
                color: AppColors.skyBlue),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Obx(() {
            if (addPostController.selectedImage.value != null) {
              return Image.file(
                addPostController.selectedImage.value!,
                height: 400,
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
          }),
          _buildHeader(),
          Expanded(
            child: Obx(() => GridView.builder(
                  itemCount: addPostController.assets.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    AssetEntity asset = addPostController.assets[index];
                    bool isSelected =
                        addPostController.selectedAssets.contains(asset);
                    return GestureDetector(
                      onTap: () => addPostController.selectImage(asset),
                      child: FutureBuilder<Uint8List?>(
                        future: asset.thumbnailDataWithSize(
                            const ThumbnailSize.square(200)),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData) {
                            return Image.memory(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            );
                          }
                          return Container(color: Colors.grey[300]);
                        },
                      ),
                    );
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget _placeholder() {
    return Container(
      height: 400,
      color: AppColors.white,
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 50,
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            Row(
              children: [
                CommonUi.commonText(
                  text: 'Recents',
                  size: 18.0,
                  fontFamily: AppFonts.medium,
                ),
                const SizedBox(width: 5),
                CommonUi.setSvgImage("down_arrow", height: 8, width: 8),
              ],
            ),
            const Spacer(),
            _buildSelectMultipleButton(),
            const SizedBox(width: 5),
            _buildCameraButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectMultipleButton() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CommonUi.commonText(
            text: 'SELECT MULTIPLE',
            size: 14.0,
            fontFamily: AppFonts.medium,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildCameraButton() {
    return Container(
      width: 32,
      decoration: BoxDecoration(
        color: Colors.grey[600],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: IconButton(
          icon: const Icon(Icons.camera_alt, color: Colors.white, size: 15),
          onPressed: () async {
            addPostController.selectedImage.value = null;
            await addPostController.pickImageFromCamera();
            if (addPostController.selectedImage.value != null) {
              Get.toNamed(AppRoutes.post);
            }
          },
        ),
      ),
    );
  }
}
