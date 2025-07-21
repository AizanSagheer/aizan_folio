import 'package:flutter/material.dart';
import 'dashboard_about_section.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey aboutKey;
  const AboutSection({super.key, required this.aboutKey});

  @override
  Widget build(BuildContext context) {
    return DashboardAboutSection(aboutKey: aboutKey);
  }
}
