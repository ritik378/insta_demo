import 'package:get/get.dart';

class SearchViewController extends GetxController {
  // Make filteredImages an observable list
  var filteredImages = <String>[].obs;

  // Fetch images from an API or generate dummy data
  Future<List<String>> fetchImage() async {
    final List<String> images = List.generate(
      100000,
          (index) => 'https://picsum.photos/200/300?random=$index',
    );
    return images;
  }

  @override
  void onInit() async {
    // Fetch and assign the images to filteredImages
    filteredImages.value = await fetchImage();
    super.onInit();
  }

  // Method to filter the images based on the search query
  void filterSearchResults(String query) {
    final results = filteredImages
        .where((image) => image.contains(query))
        .toList();
    filteredImages.value = results;
  }
}
