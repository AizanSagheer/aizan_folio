import 'package:flutter/material.dart';
import 'home_section.dart';
import 'about_section.dart';
import 'portfolio_section.dart';
import 'contact_section.dart';
import '../../models/portfolio_project.dart' as model;

class DesktopDashboardSections extends StatelessWidget {
  final bool isDownloading;
  final VoidCallback downloadCV;
  final GlobalKey aboutKey;
  final List<model.PortfolioProject> projects;
  final GlobalKey portfolioKey;
  final GlobalKey contactKey;
  const DesktopDashboardSections({
    super.key,
    required this.isDownloading,
    required this.downloadCV,
    required this.aboutKey,
    required this.projects,
    required this.portfolioKey,
    required this.contactKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        HomeSection(
            isMobile: false,
            isDownloading: isDownloading,
            downloadCV: downloadCV),
        const SizedBox(height: 40),
        AboutSection(aboutKey: aboutKey),
        const SizedBox(height: 40),
        PortfolioSection(projects: projects, portfolioKey: portfolioKey),
        const SizedBox(height: 40),
        ContactSection(contactKey: contactKey),
      ],
    );
  }
}
