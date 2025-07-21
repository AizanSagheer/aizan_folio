import 'package:aizan_folio/views/widgets/custom_button.dart';
import 'package:aizan_folio/views/widgets/shimmer_logo.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onAboutPressed;
  final VoidCallback onPortfolioPressed;
  final VoidCallback onContactPressed;

  final VoidCallback onHomePressed;

  const CustomAppBar({
    super.key,
    required this.onAboutPressed,
    required this.onPortfolioPressed,
    required this.onContactPressed,
    required this.onHomePressed,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: isMobile,
      title: Row(
        children: [
          ShimmerLogo(),
          const Spacer(),
          if (!isMobile) ...[
            CustomButton(
              text: 'Home',
              onPressed: onHomePressed,
            ),
            const SizedBox(width: 16.0),
            CustomButton(
              text: 'About me',
              onPressed: onAboutPressed,
            ),
            const SizedBox(width: 16.0),
            CustomButton(
              text: 'Portfolio',
              onPressed: onPortfolioPressed,
            ),
            const SizedBox(width: 16.0),
            CustomButton(
              text: 'Contact me',
              onPressed: onContactPressed,
            ),
          ],
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
