import 'package:easy_learning/chapitre/chap_1/chepitre1_view.dart';
import 'package:easy_learning/utils/app_colors.dart';
import 'package:easy_learning/utils/drawer.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChapitreList extends StatelessWidget {
  const ChapitreList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoPlayerController = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4');
    return ScaffoldWidget(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(children: [
          Chapitre1View(),
        ]),
      ),
    );
  }
}
