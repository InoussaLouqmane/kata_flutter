import 'package:flutter/material.dart';


class VideoFullScreenPage extends StatelessWidget {
  final String videoUrl;
  final String title;

  const VideoFullScreenPage({
    super.key,
    required this.videoUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: YoutubeVideoPlayer(videoUrl: videoUrl),
      ),
    );
  }
}