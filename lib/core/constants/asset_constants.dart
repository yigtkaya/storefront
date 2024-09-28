import 'package:flutter/material.dart';

class AssetConstants {
  static AssetIcons icons = AssetIcons();
  static AssetImages images = AssetImages();
  static AssetVideos videos = AssetVideos();

  static String toLotti(String name) => 'assets/lottie/$name.json';
  static String toJpg(String name) => 'assets/images/$name.jpg';
  static String toJpeg(String name) => 'assets/images/$name.jpeg';
  static String toPng(String name) => 'assets/images/$name.png';
  static String toIcon(String name) => 'assets/icons/ic_$name.svg';
  static String toJson(String name) => 'assets/mock/$name.json';
  static String toMp4(String name) => 'assets/videos/$name.mp4';
}

@immutable
final class AssetIcons {
  final String ideasoft = AssetConstants.toIcon("ideasoft_logo");
}

@immutable
final class AssetImages {
  final String cuteCatExample = AssetConstants.toPng("cute_cat_example");
  final String studentCard = AssetConstants.toPng("student_card");
}

@immutable
final class AssetVideos {
  final String backgroundVideo = AssetConstants.toMp4("background_video_1");
  final String backgroundVideo2 = AssetConstants.toMp4("background_video_2");
}
