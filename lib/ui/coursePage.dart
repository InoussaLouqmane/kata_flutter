import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/Widget/colors.dart';
import 'package:kata_mobile_frontui/Widget/Pagetitletext.dart';
import 'package:kata_mobile_frontui/Widget/filterText.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../Widget/YoutubeVideoPlayer.dart';
import 'FullScreenVideo.dart'; // Importe le widget YoutubeVideoPlayer

class Videopage extends StatefulWidget {
  const Videopage({super.key});

  @override
  State<Videopage> createState() => _VideopageState();
}

class _VideopageState extends State<Videopage> {
  int filterIndex = 0;
  final List<String> filters = ['Tous','Kata', 'Kihon', 'Kumite'];

  // Exemple de données pour les vidéos
  final List<Map<String, dynamic>> videos = [
    {
      'title': 'How to settle attractive thumbnails?',
      'type': 'Kata',
      'date': '12 Sep 2024',
      'videoUrl': 'https://www.youtube.com/watch?v=g0GBz7wak2Y', // URL de la vidéo
      'description': 'Apprenez à créer des miniatures attrayantes pour vos vidéos.',
    },
    {
      'title': 'Advanced Kata Techniques',
      'type': 'Kata',
      'date': '10 Sep 2024',
      'videoUrl': 'https://www.youtube.com/watch?v=g0GBz7wak2Y', // URL de la vidéo
      'description': 'Découvrez des techniques avancées pour maîtriser les Katas.',
    },
    {
      'title': 'Kihon Basics for Beginners',
      'type': 'Kihon',
      'date': '8 Sep 2024',
      'videoUrl': 'https://www.youtube.com/watch?v=g0GBz7wak2Y', // URL de la vidéo
      'description': 'Les bases du Kihon pour les débutants.',
    },
    {
      'title': 'Kumite Strategies',
      'type': 'Kumite',
      'date': '5 Sep 2024',
      'videoUrl': 'https://www.youtube.com/watch?v=g0GBz7wak2Y', // URL de la vidéo
      'description': 'Stratégies efficaces pour le Kumite.',
    },
  ];

  // Filtre les vidéos en fonction du type sélectionné
  List<Map<String, dynamic>> get filteredVideos {
    if (filterIndex == 0) return videos; // Affiche toutes les vidéos
    return videos.where((video) => video['type'] == filters[filterIndex]).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F1F6), // Couleur de fond
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // En-tête de la page
              _buildHeader(context),
              const SizedBox(height: 20),
              // Filtres
              _buildFilters(),
              const SizedBox(height: 20),
              // Liste des vidéos filtrées
              _buildVideoList(),
            ],
          ),
        ),
      ),
    );
  }

  // En-tête de la page
  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Pagetitletext(content: 'COURS'), // Titre de la page
          IconButton(
            onPressed: () {
              // Logique pour ajouter un cours
              print('Ajouter un cours');
            },
            icon: const Icon(
              Icons.add_circle,
              size: 36,
              color: Colors.blue, // Couleur de l'icône
            ),
          ),
        ],
      ),
    );
  }

  // Filtres
  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: filters.asMap().entries.map((entry) {
          final index = entry.key;
          final filter = entry.value;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              onTap: () {
                setState(() {
                  filterIndex = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: filterIndex == index ? FigmaColors.filterColor : Colors.transparent,
                  border: Border.all(
                    color: filterIndex == index ? FigmaColors.filterColor : Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Filtertext(
                  content: filter,
                  fontColor: filterIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Liste des vidéos filtrées
  Widget _buildVideoList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: filteredVideos.map((video) {
          return _buildVideoCard(
            title: video['title'] as String, // Conversion en String
            type: video['type'] as String,  // Conversion en String
            date: video['date'] as String,  // Conversion en String
            videoUrl: video['videoUrl'] as String, // URL de la vidéo
            description: video['description'] as String, // Description de la vidéo
          );
        }).toList(),
      ),
    );
  }

  // Carte vidéo
  // Carte vidéo
  Widget _buildVideoCard({
    required String title,
    required String type,
    required String date,
    required String videoUrl,
    required String description,
  }) {
    return GestureDetector(
      onTap: () {
        // Navigue vers la page de la vidéo en plein écran
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoFullScreenPage(
              videoUrl: videoUrl,
              title: title,
            ),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Titre de la vidéo

              // Miniature de la vidéo (optionnelle)
              Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(videoUrl)}/0.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),


              const SizedBox(height: 10),
              // Description de la vidéo

              const SizedBox(height: 4),
              // Type et date
              Row(
                children: [
                  Text(
                    type,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.blue, // Couleur pour le type
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Ajouté le $date',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}