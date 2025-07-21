import 'package:aizan_folio/utils/external_links.dart';
import 'package:aizan_folio/views/widgets/shimmer_logo.dart';
import 'package:aizan_folio/views/widgets/social_icon.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors().containerBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Column(
        children: [
          ShimmerLogo(),
          const SizedBox(height: 40),
          // Social Icons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIcon(
                  icon: AppImages.linkedin,
                  url: ExternalLinks.linkedIn,
                ),
                const SizedBox(width: 16.0),
                SocialIcon(
                  icon: AppImages.github,
                  url: ExternalLinks.github,
                ),
                const SizedBox(width: 16.0),
                SocialIcon(
                  icon: AppImages.stackoverflow,
                  url: ExternalLinks.stackOverflow,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          // Contact Information
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ContactInfo(
                  icon: Icons.email_outlined,
                  text: ExternalLinks.email,
                ),
                const SizedBox(width: 40.0),
                _ContactInfo(
                  icon: Icons.phone_outlined,
                  text: ExternalLinks.phone,
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: 400,
            height: 1,
            color: AppColors().textColor.withOpacity(0.2),
          ),
          const SizedBox(height: 20),
          // Copyright Text
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Built using ',
                style: TextStyle(
                  color: AppColors().textColor.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              SvgPicture.asset(
                AppImages.flutterLogo,
                height: 16,
              ),
              Text(
                ' with ',
                style: TextStyle(
                  color: AppColors().textColor.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              Icon(
                Icons.favorite,
                color: Colors.lightBlue,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Copyright © 2025 Aizan. All rights reserved.',
            style: TextStyle(
              color: AppColors().textColor.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactInfo({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: AppColors().textColor.withOpacity(0.7),
          size: 20,
        ),
        const SizedBox(width: 8.0),
        Text(
          text,
          style: TextStyle(
            color: AppColors().textColor.withOpacity(0.7),
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
