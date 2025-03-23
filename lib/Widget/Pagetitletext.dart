import 'package:flutter/cupertino.dart';

class Pagetitletext extends StatelessWidget {

  final String content;
   Pagetitletext({super.key,  required this.content});

  @override
  Widget build(BuildContext context) {
    return  Text(
      content, style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),);
  }

}
