import 'package:edu_zone/infrastructure/home/models/videos.dart';
import 'package:edu_zone/modules/home/widgets/video_player.dart';
import 'package:edu_zone/themes/app_theme.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatelessWidget {
  final Videos video;
  const VideoWidget({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, VideoPlayerWidget.route(videoType: video.videoType??'',videoUrl: video.videoUrl??''));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: appColor(context).border,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/play_icon.png',
              height: 60,
            ),
            Text(
              video.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: appColor(context).errorText),
            )
          ],
        ),
      ),
    );
  }
}
