import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String textContent;

  const SectionTitle({super.key, required this.textContent});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.textContent,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
    );
  }
}
