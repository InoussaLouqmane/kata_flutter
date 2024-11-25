import 'package:flutter/material.dart';


class Feesnametitle extends StatelessWidget {

  final String title;

   const Feesnametitle({super.key,
    required this.title
   });

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,

      style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,

      ),
    );
  }
}

