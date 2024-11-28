import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryModel {
  StoryModel({
    this.id,
    this.avatar,
    this.label,
    this.cards,
  });

  int? id;
  Widget? avatar;
  Text? label;
  List<StoryCardModel>? cards;
}

class StoryCardModel {
  StoryCardModel({

    this.duration = const Duration(seconds: 2),
    this.color = const Color(0xff333333),
    this.childOverlay,
    this.child,
  }) : visited = false.obs;

  RxBool visited;
  Duration duration;
  Color color;
  Widget? childOverlay;
  Widget? child;
}