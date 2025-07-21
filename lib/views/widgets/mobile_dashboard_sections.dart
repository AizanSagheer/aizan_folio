import 'package:flutter/material.dart';
import 'home_section.dart';
import 'about_section.dart';
import 'portfolio_section.dart';
import 'contact_section.dart';
import '../../models/portfolio_project.dart' as model;

class MobileDashboardSections extends StatelessWidget {
  final bool isDownloading;
  final VoidCallback downloadCV;
  final GlobalKey aboutKey;
  final List<model.PortfolioProject> projects;
  final GlobalKey portfolioKey;
  final GlobalKey contactKey;
  const MobileDashboardSections({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeSection(
              isMobile: true,
              isDownloading: isDownloading,
              downloadCV: downloadCV),
          const SizedBox(height: 32),
          AboutSection(aboutKey: aboutKey),
          const SizedBox(height: 32),
          PortfolioSection(projects: projects, portfolioKey: portfolioKey),
          const SizedBox(height: 32),
          ContactSection(contactKey: contactKey),
        ],
      ),
    );
  }
}
