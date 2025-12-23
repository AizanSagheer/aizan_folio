import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/colors.dart';

class SocialIcon extends StatefulWidget {
  final String icon;
  final String url;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.url,
  });

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  final ValueNotifier<bool> isHoveredNotifier = ValueNotifier(false);

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(widget.url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  void dispose() {
    isHoveredNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => isHoveredNotifier.value = true,
      onExit: (_) => isHoveredNotifier.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: isHoveredNotifier,
        builder: (context, isHovered, _) {
          return InkWell(
            onTap: _launchUrl,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isHovered
                      ? AppColors().secondaryColor
                      : AppColors().textColor.withOpacity(0.2),
                ),
              ),
              child: SvgPicture.asset(
                widget.icon,
                height: 20,
                width: 20,
                colorFilter: ColorFilter.mode(
                  AppColors().textColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
