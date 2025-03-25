import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/UserModel.dart';

class StudentSearchDelegate extends SearchDelegate<UserModel?> {
  final List<UserModel> students;

  StudentSearchDelegate(this.students);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Effacer le champ de recherche
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Ferme l'écran de recherche
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = students.where((student) {
      return student.firstName.toLowerCase().contains(query.toLowerCase()) ||
          student.lastName.toLowerCase().contains(query.toLowerCase()) ||
          student.email.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${results[index].firstName} ${results[index].lastName}'),
          subtitle: Text(results[index].email),
          onTap: () {
            close(context, results[index]); // Ferme la recherche avec le résultat sélectionné
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = students.where((student) {
      return student.firstName.toLowerCase().contains(query.toLowerCase()) ||
          student.lastName.toLowerCase().contains(query.toLowerCase()) ||
          student.email.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${suggestions[index].firstName} ${suggestions[index].lastName}'),
          subtitle: Text(suggestions[index].email),
          onTap: () {
            query = suggestions[index].firstName;
            showResults(context); // Affiche les résultats
          },
        );
      },
    );
  }
}
