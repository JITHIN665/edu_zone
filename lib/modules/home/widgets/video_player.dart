import 'package:edu_zone/themes/widgets/app_transition.dart';
import 'package:flutter/material.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoUrl;
  final String videoType;

  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    required this.videoType,
  });

  static Route route({required String videoUrl, required String videoType}) {
    return AppFadeTransition(
        page: VideoPlayerWidget(
      videoType: videoType,
      videoUrl: videoUrl,
    ));
  }

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    super.initState();

    if (widget.videoType == "YouTube") {
      String? videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
      if (videoId != null) {
        _youtubeController = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
            enableCaption: true,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.videoType == "YouTube" && _youtubeController != null) {
      return YoutubePlayer(
        controller: _youtubeController!,
        showVideoProgressIndicator: true,
        onReady: () {
        },
      );
    } else if (widget.videoType == "Vimeo") {
      String url = widget.videoUrl;
      String? videoId = RegExp(r'vimeo\.com/(\d+)').firstMatch(url)?.group(1);
      return  VimeoPlayer(
        videoId: videoId!,
      );
    } else {
      return const Center(
        child: Text("Unsupported video type or invalid URL"),
      );
    }
  }
}
