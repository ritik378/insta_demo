import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:insta_demo/common/common_ui.dart';

class ProfileController extends GetxController {
  /// List of highlight widgets to be displayed in the profile.
  var highlightList = <Widget>[
    _buildHighlight("New", "add_highlight", isSvg: true),
    _buildHighlight("Sports", "profile_image"),
    _buildHighlight("Travel", "profile_image"),
    _buildHighlight("Food", "profile_image"),
    _buildHighlight("Music", "profile_image"),
    _buildHighlight("Fashion", "profile_image"),
    _buildHighlight("Movies", "profile_image"),
    _buildHighlight("Books", "profile_image"),
  ];

  /// Observable variable to track the current tab index.
  var currentTabIndex = 0.obs;

  /// Helper method to create a highlight widget.

  static Widget _buildHighlight(String title, String imagePath,
      {bool isSvg = false}) {
    return CommonUi.customBorderCircleImage(
      height: 64,
      width: 64,
      title: title,
      childPadding: isSvg?23: 4,
      child: isSvg
          ? CommonUi.setSvgImage(imagePath)
          : CommonUi.setPngImage(imagePath),
    );
  }
}
