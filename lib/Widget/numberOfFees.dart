import 'package:flutter/material.dart';
import 'package:kata_mobile_frontui/Widget/colors.dart';


class numberOfFees extends StatelessWidget {
  final String title;
  const numberOfFees({super.key, required this.title});

  @override
  Widget build(BuildContext context) {

    return  Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: FigmaColors.feesSubtitleGrey
      ),
    );
  }
}


