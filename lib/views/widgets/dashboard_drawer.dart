import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';

class DashboardDrawer extends StatelessWidget {
  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onPortfolioPressed;
  final VoidCallback onContactPressed;
  const DashboardDrawer({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onPortfolioPressed,
    required this.onContactPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors().primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors().secondaryColor,
              ),
              child: Text(
                'Aizan.',
                style: GoogleFonts.k2d(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: onHomePressed,
            ),
            ListTile(
              title:
                  const Text('About me', style: TextStyle(color: Colors.white)),
              onTap: onAboutPressed,
            ),
            ListTile(
              title: const Text('Portfolio',
                  style: TextStyle(color: Colors.white)),
              onTap: onPortfolioPressed,
            ),
            ListTile(
              title: const Text('Contact me',
                  style: TextStyle(color: Colors.white)),
              onTap: onContactPressed,
            ),
          ],
        ),
      ),
    );
  }
}
