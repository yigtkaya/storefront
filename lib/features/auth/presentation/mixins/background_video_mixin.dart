import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:storefront/core/constants/asset_constants.dart';
import 'package:storefront/features/auth/presentation/get_started_view.dart';
import 'package:video_player/video_player.dart';

mixin BackgroundVideoMixin on State<BackgroundVideo> {
  late VideoPlayerController controller;

  String chooseRandomVideo() {
    final random = Random().nextInt(1) + 1;
    return random == 0 ? AssetConstants.videos.backgroundVideo2 : AssetConstants.videos.backgroundVideo;
  }

  @override
  void initState() {
    controller = VideoPlayerController.asset(chooseRandomVideo())
      ..initialize().then((_) {
        controller.setLooping(true);
        controller.play();
        setState(() {});
      });
    super.initState();
  }
}
