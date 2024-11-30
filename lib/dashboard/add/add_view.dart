import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class AddView extends StatelessWidget {
   AddView({super.key});

  List<File> _imageFiles = [];
// Function to pick an image from the gallery
  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
        _imageFiles.add(File(pickedFile.path)); // Add image to the list
    }
  }
  // Function to pick an image from the camera
  Future<void> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
        _imageFiles.add(File(pickedFile.path)); // Add image to the lis
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Instagram Grid", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo, color: Colors.white),
            onPressed: () {
              // Open the image picker options (Gallery or Camera)
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Select Image Source"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          pickImageFromGallery();
                          Navigator.pop(context);
                        },
                        child: Text("Gallery"),
                      ),
                      TextButton(
                        onPressed: () {
                          pickImageFromCamera();
                          Navigator.pop(context);
                        },
                        child: Text("Camera"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 columns for grid
            crossAxisSpacing: 8.0, // Space between columns
            mainAxisSpacing: 8.0, // Space between rows
            childAspectRatio: 1.0, // Square cells
          ),
          itemCount: _imageFiles.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // You can add a detailed view for each image here.
                print("Image tapped: ${_imageFiles[index].path}");
              },
              child: Image.file(
                _imageFiles[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }

}



