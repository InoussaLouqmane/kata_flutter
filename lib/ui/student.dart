import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/models/UserModel.dart';

import '../Widget/colors.dart';

class StudentsPage extends StatefulWidget {
  final List<UserModel?> students;

  const StudentsPage({super.key, required this.students});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final List<String> _randomImages = [
    'assets/images/doctor.jpg',
    'assets/images/frieda.jpeg',
    'assets/images/katakid.png',
    'assets/images/marti.jpeg',
    'assets/images/mummy.jpg',
  ];

  int counter = 0;

  // Fonction pour obtenir une image aléatoire
  String _getRandomImage() {
    counter++;
    final random = counter % 5;
    return _randomImages[random];
  }

  List<UserModel> get allStudents =>
      widget.students.whereType<UserModel>().toList();

  List<UserModel> filteredStudents = [];
  final TextEditingController _searchController = TextEditingController();
  bool _showSearchBar = false;

  // Filtres
  List<String> filters = ['Tous', 'Actif', 'Inactif'];
  int filterIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredStudents = allStudents;
    _searchController.addListener(_filterStudents);
  }

  void _filterStudents() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredStudents = allStudents.where((student) {
        final matchesSearch = student.firstName.toLowerCase().contains(query) ||
            student.lastName.toLowerCase().contains(query) ||
            student.email.toLowerCase().contains(query);

        final matchesFilter =
            filterIndex == 0 || student.status == filters[filterIndex];

        return matchesSearch && matchesFilter;
      }).toList();
    });
  }

  Widget _buildFilters() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
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
                  _filterStudents();
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color:
                      filterIndex == index ? Colors.blue : Colors.transparent,
                  border: Border.all(
                    color: filterIndex == index ? Colors.blue : Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    color: filterIndex == index ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<int, List<UserModel>> studentsByGrade = {};
    for (var student in filteredStudents) {
      studentsByGrade.putIfAbsent(student.grade, () => []).add(student);
    }

    final sortedGrades = studentsByGrade.keys.toList()..sort();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: FigmaColors.backgroundColors,
        title: const Text('Élèves'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                _showSearchBar = !_showSearchBar;
              });
            },
          ),
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 12.0, right: 12.0, bottom: 12.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: IconButton(
              onPressed: () {
                // Action à exécuter
              },
              icon: const Icon(Icons.add, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Barre de recherche conditionnelle
            if (_showSearchBar)
              Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      labelText: 'Rechercher...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            // Boutons de filtre (version unique)
            _buildFilters(),
            const SizedBox(height: 20),
            // Liste des étudiants par grade
            Expanded(
              child: ListView.builder(
                itemCount: sortedGrades.length,
                itemBuilder: (context, index) {
                  final grade = sortedGrades[index];
                  final students = studentsByGrade[grade]!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Grade $grade',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: List.generate(students.length, (i) {
                            return Column(
                              children: [
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage(_getRandomImage()),
                                  ),
                                  title: Row(children: [
                                    Container(
                                      constraints:
                                          const BoxConstraints(maxWidth: 160),
                                      child: Text(
                                        '${students[i].firstName} ${students[i].lastName}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: students[i].status == 'Actif'
                                            ? Colors.green
                                            : Colors.red,
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                      child: Text(
                                        students[i].status,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    )
                                  ]),
                                  trailing: const Icon(
                                    Icons.more_vert,
                                    color: FigmaColors.dashboardSubtitleGrey,
                                  ),
                                  subtitle: Row(children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Icon(
                                      Icons.email,
                                      size: 16,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      constraints:
                                          BoxConstraints(maxWidth: 180),
                                      child: Text(students[i].email,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1),
                                    ),
                                  ]),
                                ),
                                if (i < students.length - 1)
                                  const Divider(
                                    color: Color(0xffc4c4c4),
                                  ),
                              ],
                            );
                          }),
                        ),
                      ),
                      if (index < sortedGrades.length - 1)
                        const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
