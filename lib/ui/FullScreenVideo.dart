import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoFullScreenPage extends StatefulWidget {
  final String videoUrl;
  final String title;

  const VideoFullScreenPage({
    super.key,
    required this.videoUrl,
    required this.title,
  });

  @override
  State<VideoFullScreenPage> createState() => _VideoFullScreenPageState();
}

class _VideoFullScreenPageState extends State<VideoFullScreenPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Extrait l'ID de la vidéo YouTube à partir de l'URL
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    if (videoId != null) {
      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(
          autoPlay: true, // Lance la vidéo automatiquement
          mute: false, // Son activé
          enableCaption: true, // Activer les sous-titres
          hideControls: false, // Afficher les contrôles
          isLive: false, // Ce n'est pas une vidéo en direct
        ),
      );
    } else {
      throw Exception('URL de vidéo YouTube invalide');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors: const ProgressBarColors(
            playedColor: Colors.blue,
            handleColor: Colors.blueAccent,
          ),
          onReady: () {
            print('Le lecteur est prêt');
          },
          bottomActions: const [
            CurrentPosition(), // Affiche la position actuelle
            ProgressBar(isExpanded: true), // Barre de progression
            RemainingDuration(), // Temps restant
            FullScreenButton(), // Bouton plein écran
          ],
        ),
      ),
    );
  }
}