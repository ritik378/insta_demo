import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/app_colors.dart';
import 'package:insta_demo/common/app_fonts.dart';
import 'package:insta_demo/common/common_ui.dart';
import 'package:insta_demo/dashboard/search/search_controller.dart';

/// A view representing the search screen.
class SearchView extends StatelessWidget {
  SearchView({super.key});

  /// Controller for managing search-related state.
  final searchController = Get.find<SearchViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          _buildSearchBar(),
          _buildCategoryList(),
          _buildImageGrid(),
        ],
      ),
    );
  }

  /// Builds the search bar widget.
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.softGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CommonUi.setSvgImage('search_icon',
                        height: 14,
                        width: 14,
                        color: AppColors.semiTransparentBlack),
                    const SizedBox(width: 6),
                    const Text(
                      'Search',
                      style: TextStyle(
                          color: AppColors.semiTransparentBlack,
                          fontSize: 16,
                          fontFamily: AppFonts.regular),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CommonUi.setSvgImage("live"),
        ],
      ),
    );
  }

  /// Builds the category list widget.
  Widget _buildCategoryList() {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _categoryButton("IGTV", icon: "igtv_category"),
            _categoryButton("Shop", icon: "shope_icon"),
            _categoryButton("Style"),
            _categoryButton("Sports"),
            _categoryButton("Auto"),
            _categoryButton("Fashion"),
          ],
        ),
      ),
    );
  }

  /// Builds the image grid widget.
  Widget _buildImageGrid() {
    return Expanded(
      child: GridView.custom(
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 4,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          repeatPattern: QuiltedGridRepeatPattern.inverted,
          pattern: [
            const QuiltedGridTile(2, 2),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          childCount: searchController.filteredImages.length,
          (context, index) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(searchController.filteredImages[index]),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds a category button widget.
  Widget _categoryButton(String text, {String? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.softGrey),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              if (icon != null)
                CommonUi.setSvgImage(icon, height: 15, width: 13),
              const SizedBox(width: 6),
              Text(
                text,
                style: const TextStyle(
                  color: AppColors.black,
                  fontSize: 14,
                  fontFamily: AppFonts.semiBold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
