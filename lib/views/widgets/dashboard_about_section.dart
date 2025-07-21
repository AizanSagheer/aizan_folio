import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import 'rectangle_painter.dart';

class DashboardAboutSection extends StatelessWidget {
  final GlobalKey aboutKey;
  const DashboardAboutSection({super.key, required this.aboutKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('About Me',
              style: GoogleFonts.k2d(
                color: AppColors().whiteColor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              )),
        ),
        SizedBox(height: 20),
        Text(
          'Programmer of visual things. Interpolation enthusiast. Matrix advocate. Professional amateur. Able to create bugs in many languages',
          style: GoogleFonts.k2d(
            color: AppColors().whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 150),
        Container(
          key: aboutKey,
          constraints: BoxConstraints(maxWidth: 800),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 450.0,
                height: 400.0,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    RectangleSvgWidget(
                      width: 400.0,
                      height: 370.0,
                    ),
                    Positioned(
                      bottom: 18.0,
                      child: Image.asset(
                        AppImages.aizan,
                        height: 450.0,
                        width: 450.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 40.0),
              Expanded(
                child: Text(
                  "I'm a Flutter developer with 5 years of experience building cross-platform apps for Android, iOS, web, Windows, and macOS. I specialise in clean design patterns, robust optimisation, and creating smooth, reliable user experiences — from IoT integrations and real-time sockets to secure payments with Stripe, Google Pay, and Apple Pay. I've scaled and migrated native Android apps to Flutter, implemented offline-first functionality with Hive, and fine-tuned performance to cut crashes and render times by up to 60%. I believe in writing secure, maintainable code, using modern tools like DevTools, Fastlane, FFI, and native Kotlin when needed. I love working with cross-functional teams to deliver polished apps that users trust — and I'm always learning to keep my skills sharp.",
                  style: GoogleFonts.k2d(
                    color: AppColors().whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 150),
      ],
    );
  }
}
