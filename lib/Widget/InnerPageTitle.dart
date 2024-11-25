import 'package:flutter/material.dart';


class InnerPageTitle extends StatelessWidget {

  final String title;

   const InnerPageTitle({super.key,
    required this.title
   });

  @override
  Widget build(BuildContext context) {
    return  Text(
      title,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

