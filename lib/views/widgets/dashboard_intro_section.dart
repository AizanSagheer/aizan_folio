import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import 'social_icon.dart';
import 'custom_outlined_button.dart';

class DashboardIntroSection extends StatelessWidget {
  final bool isMobile;
  final bool isDownloading;
  final VoidCallback downloadCV;
  const DashboardIntroSection({
    super.key,
    required this.isMobile,
    required this.isDownloading,
    required this.downloadCV,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: isMobile ? 24 : 90),
        Text(
          'Hello, I am',
          style: TextStyle(
            color: AppColors().textColor,
            fontSize: isMobile ? 18 : 24,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          'Aizan Sagheer',
          style: TextStyle(
            color: AppColors().textColor,
            fontSize: isMobile ? 22 : 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'Flutter Developer',
          style: TextStyle(
            color: AppColors().secondaryColor,
            fontSize: isMobile ? 28 : 45,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: isMobile ? 16 : 20),
        Row(
          mainAxisAlignment: isMobile
              ? MainAxisAlignment.start
              : MainAxisAlignment.spaceBetween,
          children: [
            SocialIcon(
              icon: AppImages.linkedin,
              url: 'https://www.linkedin.com/in/aizan-sagheer-46074b11a/',
            ),
            const SizedBox(width: 16),
            SocialIcon(
              icon: AppImages.github,
              url: 'https://github.com/AizanSagheer',
            ),
            const SizedBox(width: 16),
            SocialIcon(
              icon: AppImages.stackoverflow,
              url: 'https://stackoverflow.com/users/15968808/aizan-sagheer',
            ),
          ],
        ),
        SizedBox(height: isMobile ? 16 : 30),
        CustomOutlinedButton(
          text: 'Download CV',
          onPressed: downloadCV,
          isLoading: isDownloading,
        ),
        SizedBox(height: isMobile ? 16 : 30),
        _DashboardStatsRow(isMobile: isMobile),
      ],
    );
  }
}

class _DashboardStatsRow extends StatelessWidget {
  final bool isMobile;
  const _DashboardStatsRow({required this.isMobile});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: isMobile ? 12 : 20, horizontal: isMobile ? 8 : 24),
      decoration: BoxDecoration(
        color: AppColors().containerBackgroundColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment:
            isMobile ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.start,
        children: [
          _StatItem(count: '5+', label: 'Years of Experience'),
          Container(
            height: isMobile ? 40.0 : 50.0,
            width: 1,
            margin:
                isMobile ? null : const EdgeInsets.symmetric(horizontal: 24),
            color: AppColors().textColor.withOpacity(0.5),
          ),
          _StatItem(count: '20+', label: 'Project done'),
          Container(
            height: isMobile ? 40.0 : 50.0,
            width: 1,
            margin:
                isMobile ? null : const EdgeInsets.symmetric(horizontal: 24),
            color: AppColors().textColor.withOpacity(0.5),
          ),
          _StatItem(count: '10+', label: 'Happy Clients'),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;
  const _StatItem({required this.count, required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          count,
          style: TextStyle(
            color: AppColors().secondaryColor,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: AppColors().whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
