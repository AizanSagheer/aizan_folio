import 'package:flutter/material.dart';
import '../../utils/images.dart';
import '../../utils/external_links.dart';
import 'social_icon.dart';

class SocialIconsRow extends StatelessWidget {
  final double spacing;
  const SocialIconsRow({super.key, this.spacing = 16.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SocialIcon(
          icon: AppImages.linkedin,
          url: ExternalLinks.linkedIn,
        ),
        SizedBox(width: spacing),
        SocialIcon(
          icon: AppImages.github,
          url: ExternalLinks.github,
        ),
        SizedBox(width: spacing),
        SocialIcon(
          icon: AppImages.stackoverflow,
          url: ExternalLinks.stackOverflow,
        ),
      ],
    );
  }
}
