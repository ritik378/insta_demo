import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostController extends GetxController {
  var assets = <AssetEntity>[].obs;
  var selectedImage = Rx<File?>(null);
  var cameraImage = Rx<File?>(null);
  RxList<AssetEntity> selectedAssets = <AssetEntity>[].obs;

  // Instance of ImagePicker for camera/gallery selection
  final ImagePicker _picker = ImagePicker();
  @override
  void onInit() {
    super.onInit();
    fetchGalleryImages();
  }



  Future<void> fetchGalleryImages() async {
    final PermissionState result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
      );
      if (albums.isNotEmpty) {
        List<AssetEntity> media =
            await albums[0].getAssetListPaged(page: 0, size: 100);
        assets.value = media;
      }
    } else {
      PhotoManager.openSetting();
    }
  }

  Future<void> selectImage(AssetEntity asset) async {
    File? file = await asset.file;
    if (file != null) {
      selectedImage.value = file;
    }
  }

  void uploadPost() {
    if (selectedImage.value != null) {
      Get.snackbar("Uploading", "Post is being uploaded.");
    } else {
      Get.snackbar("No Image Selected", "Please select an image to upload.");
    }
  }

  // Function to pick an image from the camera
  Future<void> pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  // Function to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }
}
