import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  const SectionTitle({super.key, required this.title, this.fontSize = 22});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
      ),
    );
  }
}
