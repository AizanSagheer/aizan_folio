import 'package:flutter/material.dart';
import 'dashboard_intro_section.dart';
import 'dashboard_profile_photo.dart';

class HomeSection extends StatelessWidget {
  final bool isMobile;
  final bool isDownloading;
  final VoidCallback downloadCV;
  const HomeSection({
    super.key,
    required this.isMobile,
    required this.isDownloading,
    required this.downloadCV,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DashboardIntroSection(
            isMobile: true,
            isDownloading: isDownloading,
            downloadCV: downloadCV,
          ),
          DashboardProfilePhoto(isMobile: true),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: DashboardIntroSection(
              isMobile: false,
              isDownloading: isDownloading,
              downloadCV: downloadCV,
            ),
          ),
          const SizedBox(width: 40.0),
          DashboardProfilePhoto(isMobile: false),
        ],
      );
    }
  }
}
