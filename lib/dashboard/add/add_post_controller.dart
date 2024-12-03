import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';

class AddPostController extends GetxController {
  /// List of assets (images) available in the gallery.
  var assets = <AssetEntity>[].obs;

  /// The currently selected image file.
  var selectedImage = Rx<File?>(null);

  /// List of selected assets (images).
  var selectedAssets = <AssetEntity>[].obs;

  /// Instance of ImagePicker for picking images from the gallery or camera.
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    fetchGalleryImages();
  }

  /// Fetches images from the gallery and updates the [assets] list.
  Future<void> fetchGalleryImages() async {
    final result = await PhotoManager.requestPermissionExtend();
    if (result.isAuth) {
      final albums = await PhotoManager.getAssetPathList(type: RequestType.image);
      if (albums.isNotEmpty) {
        final media = await albums[0].getAssetListPaged(page: 0, size: 100);
        assets.value = media;
      }
    } else {
      PhotoManager.openSetting();
    }
  }

  /// Selects an image from the gallery and updates the [selectedImage].
  Future<void> selectImage(AssetEntity asset) async {
    final file = await asset.file;
    if (file != null) {
      selectedImage.value = file;
    }
  }

  /// Uploads the selected post.
  void uploadPost() {
    if (selectedImage.value != null) {
      Get.snackbar("Uploading", "Post is being uploaded.");
    } else {
      Get.snackbar("No Image Selected", "Please select an image to upload.");
    }
  }

  /// Picks an image from the camera and updates the [selectedImage].
  Future<void> pickImageFromCamera() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  /// Picks an image from the gallery and updates the [selectedImage].
  Future<void> pickImageFromGallery() async {
    try {
      final image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        selectedImage.value = File(image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }
}