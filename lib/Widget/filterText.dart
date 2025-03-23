import 'package:flutter/material.dart';

class Filtertext extends StatelessWidget {
  final String content;
  final Color fontColor;

  Filtertext({super.key, required this.content, required this.fontColor});

  @override
  Widget build(BuildContext context) {
    return  Text(
      content,
      style: TextStyle(color: fontColor, fontSize: 12, fontWeight: FontWeight.w400),
    );
  }
}
