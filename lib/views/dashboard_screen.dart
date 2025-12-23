import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/dashboard_controller.dart';
import '../utils/colors.dart';
import '../utils/external_links.dart';
import '../utils/images.dart';
import 'widgets/contact_form_widget.dart';
import 'widgets/footer_widget.dart';
import 'widgets/app_bar.dart';
import 'widgets/skill_item.dart';
import 'widgets/portfolio_project.dart';
import 'widgets/custom_outlined_button.dart';
import 'widgets/responsive_widget.dart';
import 'widgets/profile_photo_with_circle.dart';
import 'widgets/rectangle_painter.dart';
import 'widgets/dashboard_drawer.dart';
import 'widgets/contact_section.dart';
import 'widgets/section_title.dart';
import 'widgets/social_icons_row.dart';
import 'widgets/horizontal_section.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController _controller = DashboardController();
  final ScrollController _scrollController = ScrollController();
  final ScrollController _skillsScrollController = ScrollController();
  final ScrollController _portfolioScrollController = ScrollController();
  final GlobalKey homeKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey portfolioKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();
  final ValueNotifier<bool> isDownloadingNotifier = ValueNotifier(false);

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  Future<void> downloadCV() async {
    isDownloadingNotifier.value = true;
    try {
      await _controller.downloadCV();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to download CV. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      isDownloadingNotifier.value = false;
    }
  }

  @override
  void dispose() {
    isDownloadingNotifier.dispose();
    _scrollController.dispose();
    _skillsScrollController.dispose();
    _portfolioScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final skills = _controller.getSkills();
    final projects = _controller.getProjects();
    return Scaffold(
      appBar: CustomAppBar(
        onHomePressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
        },
        onAboutPressed: () => scrollToSection(aboutKey),
        onPortfolioPressed: () => scrollToSection(portfolioKey),
        onContactPressed: () => scrollToSection(contactKey),
      ),
      drawer: isMobile
          ? DashboardDrawer(
              onHomePressed: () {
                Navigator.of(context).pop();
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.easeInOut,
                );
              },
              onAboutPressed: () {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  scrollToSection(aboutKey);
                });
              },
              onPortfolioPressed: () {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  scrollToSection(portfolioKey);
                });
              },
              onContactPressed: () {
                Navigator.of(context).pop();
                scrollToSection(contactKey);
              },
            )
          : null,
      body: ResponsiveWidget(
        desktop: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 90),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Hello, I am\n',
                                    style: TextStyle(
                                      color: AppColors().textColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Aizan Sagheer\n',
                                    style: TextStyle(
                                      color: AppColors().textColor,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Flutter Developer',
                                    style: TextStyle(
                                      color: AppColors().secondaryColor,
                                      fontSize: 45,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            SocialIconsRow(),
                            SizedBox(height: 30),
                            ValueListenableBuilder<bool>(
                              valueListenable: isDownloadingNotifier,
                              builder: (context, isDownloading, _) {
                                return CustomOutlinedButton(
                                  text: 'Download CV',
                                  onPressed: downloadCV,
                                  isLoading: isDownloading,
                                );
                              },
                            ),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 24),
                              decoration: BoxDecoration(
                                color: AppColors().containerBackgroundColor,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: [
                                  StatItem(
                                      count: '5+',
                                      label: 'Years of Experience'),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    color:
                                        AppColors().textColor.withOpacity(0.5),
                                  ),
                                  StatItem(count: '20+', label: 'Project done'),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 24),
                                    color:
                                        AppColors().textColor.withOpacity(0.5),
                                  ),
                                  StatItem(
                                      count: '1 M+', label: 'users served'),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 40.0),
                        ProfilePhotoWithCircle(),
                      ],
                    ),
                    SizedBox(height: 40),
                    SectionTitle(
                      title: 'About Me',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Programmer of visual things. Interpolation enthusiast. Matrix advocate. Professional amateur. Able to create bugs in many languages',
                      style: TextStyle(
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
                            width: 450,
                            height: 400,
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                RectangleSvgWidget(
                                  width: 400,
                                  height: 370,
                                ),
                                Positioned(
                                  bottom: 18,
                                  child: Image.asset(
                                    AppImages.aizan,
                                    height: 450.0,
                                    width: 450.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 40),
                          Expanded(
                            child: Text(
                              'I\'m a Flutter developer with 5 years of experience building cross-platform apps for Android, iOS, web, Windows, and macOS. I specialise in clean design patterns, robust optimisation, and creating smooth, reliable user experiences — from IoT integrations and real-time sockets to secure payments with Stripe, Google Pay, and Apple Pay. I\'ve scaled and migrated native Android apps to Flutter, implemented offline-first functionality with Hive, and fine-tuned performance to cut crashes and render times by up to 60%. I believe in writing secure, maintainable code, using modern tools like DevTools, Fastlane, FFI, and native Kotlin when needed. I love working with cross-functional teams to deliver polished apps that users trust — and I\'m always learning to keep my skills sharp.',
                              style: TextStyle(
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

                    // Skills Section
                    SectionTitle(
                      title: 'My Skills',
                    ),
                    SizedBox(height: 40),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      alignment: WrapAlignment.center,
                      children: [
                        for (final skill in skills)
                          SkillItem(
                            skillName: skill.skillName,
                            iconPath: skill.iconPath,
                            percentage: skill.percentage.toDouble(),
                          ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: Text('Portfolio',
                          style: TextStyle(
                            color: AppColors().whiteColor,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    SizedBox(height: 40),
                    // Portfolio Section
                    Container(
                      key: portfolioKey,
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        alignment: WrapAlignment.center,
                        children: [
                          for (final project in projects)
                            PortfolioProject(
                              imagePath: project.imagePath,
                              projectName: project.projectName,
                              description: project.description,
                              appLinks: project.appLinks,
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    // Contact Section
                    Container(
                      key: contactKey,
                      child: Column(
                        children: [
                          Center(
                            child: Text('Contact Me',
                                style: TextStyle(
                                  color: AppColors().whiteColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          SizedBox(height: 40),
                          Text(
                            'Say Hello! or have any questions?',
                            style: TextStyle(
                              color: AppColors().whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          ContactFormWidget(),
                          Center(
                            child: Text('Or',
                                style: TextStyle(
                                  color: AppColors().whiteColor,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                          SizedBox(height: 40),
                          Center(
                            child: CustomOutlinedButton(
                              text: 'Email me directly',
                              onPressed: () async {
                                final Uri emailUri = Uri(
                                  scheme: 'mailto',
                                  path: ExternalLinks.email,
                                );
                                if (await canLaunchUrl(emailUri)) {
                                  await launchUrl(emailUri);
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
              const FooterWidget(),
            ],
          ),
        ),
        mobile: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Intro Text
                SizedBox(height: 24),
                RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hello, I am\n',
                        style: TextStyle(
                          color: AppColors().textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: 'Aizan Sagheer\n',
                        style: TextStyle(
                          color: AppColors().textColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: 'Flutter Developer',
                        style: TextStyle(
                          color: AppColors().secondaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double maxWidth = constraints.maxWidth;
                      final double rectWidth = maxWidth * 0.7;
                      final double photoSize = rectWidth * 0.8;
                      return ProfilePhotoWithCircle(
                        imageSize: photoSize,
                        circleSize: photoSize,
                      );
                    },
                  ),
                ),
                // 3. Social Icons
                SizedBox(height: 16),
                SocialIconsRow(),
                // 4. Download CV Button
                SizedBox(height: 16),
                ValueListenableBuilder<bool>(
                  valueListenable: isDownloadingNotifier,
                  builder: (context, isDownloading, _) {
                    return CustomOutlinedButton(
                      text: 'Download CV',
                      onPressed: downloadCV,
                      isLoading: isDownloading,
                    );
                  },
                ),
                // 5. Stats Row
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors().containerBackgroundColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      StatItem(count: '5+', label: 'Years of Experience'),
                      Container(
                        height: 40.0,
                        width: 1,
                        color: AppColors().textColor.withOpacity(0.5),
                      ),
                      StatItem(count: '20+', label: 'Project done'),
                      Container(
                        height: 40.0,
                        width: 1,
                        color: AppColors().textColor.withOpacity(0.5),
                      ),
                      StatItem(count: '1 M+', label: 'users served'),
                    ],
                  ),
                ),
                // 6. About Me Title & Line
                SizedBox(height: 32),
                SectionTitle(
                  title: 'About Me',
                ),
                SizedBox(height: 8),
                Container(
                  key: aboutKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            final double maxWidth = constraints.maxWidth;
                            final double rectWidth = maxWidth * 0.7;
                            final double rectHeight = rectWidth * 0.93;
                            final double photoSize = rectWidth * 1.1;
                            final double stackHeight =
                                rectHeight + (photoSize * 0.3);
                            return SizedBox(
                              width: rectWidth,
                              height: stackHeight,
                              child: Stack(
                                alignment: Alignment.center,
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: photoSize * 0.28,
                                    child: RectangleSvgWidget(
                                      width: rectWidth,
                                      height: rectHeight,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    child: Image.asset(
                                      AppImages.aizan,
                                      height: photoSize + 33,
                                      width: photoSize,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        "I'm a Flutter developer with 5 years of experience building cross-platform apps for Android, iOS, web, Windows, and macOS. I specialise in clean design patterns, robust optimisation, and creating smooth, reliable user experiences — from IoT integrations and real-time sockets to secure payments with Stripe, Google Pay, and Apple Pay. I've scaled and migrated native Android apps to Flutter, implemented offline-first functionality with Hive, and fine-tuned performance to cut crashes and render times by up to 60%. I believe in writing secure, maintainable code, using modern tools like DevTools, Fastlane, FFI, and native Kotlin when needed. I love working with cross-functional teams to deliver polished apps that users trust — and I'm always learning to keep my skills sharp.",
                        style: TextStyle(
                          color: AppColors().whiteColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                // 9. My Skills Title
                SizedBox(height: 32),
                HorizontalSection(
                  title: 'My Skills',
                  height: 260,
                  controller: _skillsScrollController,
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor:
                        MaterialStateProperty.all(AppColors().secondaryColor),
                    thickness: MaterialStateProperty.all(8),
                    radius: const Radius.circular(8),
                  ),
                  children: [
                    for (final skill in skills)
                      SkillItem(
                        skillName: skill.skillName,
                        iconPath: skill.iconPath,
                        percentage: skill.percentage.toDouble(),
                      ),
                  ],
                ),
                // 11. Portfolio Title
                SizedBox(height: 32),
                HorizontalSection(
                  key: portfolioKey,
                  title: 'Portfolio',
                  height: 220,
                  controller: _portfolioScrollController,
                  scrollbarTheme: ScrollbarThemeData(
                    thumbColor:
                        MaterialStateProperty.all(AppColors().secondaryColor),
                    thickness: MaterialStateProperty.all(8),
                    radius: const Radius.circular(8),
                  ),
                  children: [
                    for (final project in projects) ...[
                      PortfolioProject(
                        imagePath: project.imagePath,
                        projectName: project.projectName,
                        description: project.description,
                        appLinks: project.appLinks,
                      ),
                      const SizedBox(
                          width: 16), // Add horizontal space between items
                    ],
                  ],
                ),
                SizedBox(height: 32),
                ContactSection(contactKey: contactKey),
                FooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({
    super.key,
    required this.count,
    required this.label,
  });

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
