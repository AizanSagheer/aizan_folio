import '../models/portfolio_project.dart';
import '../models/skill.dart';
import '../utils/images.dart';
import '../utils/external_links.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardController {
   List<Skill> getSkills() {
    return [
      Skill(
          skillName: 'Flutter & Dart',
          iconPath: AppImages.flutterLogo,
          percentage: 95),

      Skill(
          skillName: 'Git & Version Control',
          iconPath: AppImages.git,
          percentage: 95),
     
      Skill(
          skillName: 'Testing & Debugging',
          iconPath: AppImages.debug,
          percentage: 100),
      Skill(
          skillName: 'FastAPI',
          iconPath: AppImages.fastApi,
          percentage: 90),

      Skill(
          skillName: 'Kotlin',
          iconPath: AppImages.kotlin,
          percentage: 90),
      Skill(
          skillName: 'PostgreSQL',
          iconPath: AppImages.postgresql,
          percentage: 90),
      Skill(
          skillName: 'Python',
          iconPath: AppImages.python,
          percentage: 90),
    ];
  }

   List<PortfolioProject> getProjects() {
    return [
      // Astria Digital Library
      PortfolioProject(
        imagePath: AppImages.astriaDigitalLibrary,
        projectName: 'Astria Digital Library',
        description: '''
An online platform offering a vast collection of e-books and digital materials in multiple languages including English, French, Portuguese, Russian, and Spanish. Features include offline reading, bookmarking, text highlighting, and customizable reading preferences. The platform has partnered with universities across Africa (Zambia, DRC, Malawi, Botswana) to provide academic materials, textbooks, research papers, and scholarly articles. User interface available in English and French with intuitive search functionality.

Impact highlights (my contribution):
• Optimized reading experience and navigation flows to keep scrolling/reading smooth on large content.
• Improved offline reliability with better caching and sync handling for user content (bookmarks/highlights).
• Strengthened stability with defensive error handling and edge-case fixes across core reader flows.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.astrialibrary',
          'https://apps.apple.com/ae/app/astria-digital-library/id6446678559',
          'https://apps.apple.com/ae/app/astria-digital-library/id6446678559',
        ],
      ),

      // ACMS Student App
      PortfolioProject(
        imagePath: AppImages.acmsStudentApp,
        projectName: 'ACMS - Student App',
        description: '''
Astria Campus Management System (ACMS) is a cutting-edge Student Information System crafted by Astria Learning to elevate the student journey in modern educational ecosystems. ACMS seamlessly integrates students into educational institutions, providing a comprehensive platform for managing academic information, courses, schedules, and campus resources. Designed to enhance the educational experience with modern technology.

Impact highlights (my contribution):
• Improved app responsiveness by refining state handling and reducing unnecessary rebuilds in key screens.
• Enhanced reliability of API-driven screens with consistent loading/error states and retry strategies.
• Hardened the app for production by addressing performance bottlenecks and fixing stability issues.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.acmsapp.acms',
          'https://apps.apple.com/ae/app/acms-student-app/id6476657861',
        ],
      ),

      // Social Chat App
      PortfolioProject(
        imagePath: AppImages.afrikchat,
        projectName: 'Afrikchat - Social Platform',
        description: '''
A dynamic social app designed to connect friends, family, and communities across Africa and around the world. Features include real-time messaging, photo and video sharing, trending topics exploration, and interest-based groups. Users can stay connected in real-time, follow pages, discover fresh content, and build connections within a diverse, vibrant community. Includes secure messaging, customizable profiles, and a lively newsfeed for an engaging social experience.

Impact highlights (my contribution):
• Enhanced real-time UX by tightening chat/feed interactions and improving perceived speed of updates.
• Optimized media-heavy screens (images/video lists) to reduce memory pressure and improve smooth scrolling.
• Improved stability by fixing edge cases in networking, pagination, and session handling.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=affrikchat.app.webview',
        ],
      ),

      // E-commerce Platform
      PortfolioProject(
        imagePath: AppImages.afrikwaveUser,
        projectName: 'Afrikwave E-Commerce Platform',
        description: '''
A comprehensive e-commerce solution with separate user and seller applications. Features include product browsing, shopping cart, secure payments, order management, seller dashboard, inventory management, analytics, and real-time notifications. Built for scalability and high-performance transactions.

Impact highlights (my contribution):
• Implemented and stabilized checkout flows, including payment integration and transaction-safe UI states.
• Improved performance of product/catalog browsing using pagination, caching, and list optimizations.
• Enabled real-time updates via notifications for orders, fulfilment events, and user engagement.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.afrikwave.userapp',
          'https://play.google.com/store/apps/details?id=com.afrikwave.sellerapp',
        ],
      ),

      // Health & Fitness App
      PortfolioProject(
        imagePath: AppImages.wellness,
        projectName: 'Ring of Well - Health & Fitness',
        description: '''
An advanced health and fitness application featuring 3D exercise modeling for interactive workout guidance. Users can follow detailed 3D animated exercise demonstrations, track their fitness progress, create personalized workout plans, and monitor their health metrics. The app provides immersive visual guidance for proper exercise form and technique.

Impact highlights (my contribution):
• Improved responsiveness of workout flows and tracking screens for a smoother daily-use experience.
• Optimized heavy UI/asset screens to reduce jank and improve runtime efficiency on mid-range devices.
• Strengthened app stability by addressing memory/performance issues and refining error handling.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.hollysoft.ringofwell1',
        ],
      ),

      // Precious Metals Trading Platform - Category Group
      PortfolioProject(
        imagePath: AppImages.zelatofx,
        projectName: 'ZelatoFX',
        category: 'Precious Metals Trading Platform',
        description: '''
A comprehensive financial application for tracking live rates of copper, gold, and other precious metals. Features include real-time price updates, market analytics, price alerts, historical charts, and advanced trading tools for professional traders and investors.

Impact highlights (my contribution):
• Improved live-rate refresh behaviour to keep updates fast and consistent under varying network conditions.
• Implemented alert/notification flows for price thresholds with reliable background handling.
• Enhanced performance and stability for frequently updating screens (charts/lists), reducing UI lag.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.adrobz.zelatofx',
        ],
      ),

      PortfolioProject(
        imagePath: AppImages.cityGoldBullion,
        projectName: 'City Gold Bullion',
        category: 'Precious Metals Trading Platform',
        description: '''
An informative platform providing live bullion rates, latest news insights, and market updates. Features include customizable price alert alarms, notifications, and quick contact options via call, WhatsApp, email, and location access. Stay informed and never miss an opportunity in the bullion market.

Impact highlights (my contribution):
• Implemented alert/alarm + notification flows with clean UX for managing thresholds.
• Improved reliability of market updates (refresh, retry, and graceful fallback for API failures).
• Optimized rate screens to reduce jank and keep scrolling smooth during frequent updates.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.artifitia.city_gold_app',
          'https://apps.apple.com/us/app/city-gold/id6463396485',
        ],
      ),

      PortfolioProject(
        imagePath: AppImages.alSabayek,
        projectName: 'AL-Sabayek Bullion',
        category: 'Precious Metals Trading Platform',
        description: '''
A comprehensive bullion trading platform offering live rates, market insights, and real-time updates. Features include customizable price alerts, news updates, and convenient contact options. Designed to keep traders and investors informed about precious metals markets.

Impact highlights (my contribution):
• Strengthened notification reliability and user control for alert settings and market updates.
• Improved performance of live rates + news feeds via better state handling and list optimizations.
• Reduced production issues by fixing edge cases and improving runtime stability.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.artifitia.al_sabayek',
          'https://apps.apple.com/us/app/al-sabayek/id6473886138',
        ],
      ),

      PortfolioProject(
        imagePath: AppImages.ceekay,
        projectName: 'Ceekay',
        category: 'Precious Metals Trading Platform',
        description: '''
A financial application for tracking and trading precious metals with real-time market data, price alerts, and comprehensive trading tools. Features include live rates, market analytics, and customizable notifications.

Impact highlights (my contribution):
• Optimized frequently refreshing screens to keep live updates smooth and responsive.
• Improved alert + notification UX and reliability for price monitoring.
• Enhanced stability with robust API error handling and defensive state management.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.adrobz.ceekay',
        ],
      ),

      PortfolioProject(
        imagePath: AppImages.ang,
        projectName: 'ANG',
        category: 'Precious Metals Trading Platform',
        description: '''
A trading platform for precious metals with live rates, market analytics, and trading capabilities for investors and traders. Features include real-time price updates, historical charts, and price alerts.

Impact highlights (my contribution):
• Improved runtime efficiency of market screens (charts/rates) for a smoother experience.
• Implemented and stabilized price alerts/notifications with clean user controls.
• Reduced production friction by fixing edge cases and strengthening network/state handling.
''',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.adrobz.ang',
        ],
      ),

      // Request More Projects Card
      PortfolioProject(
        imagePath: AppImages.education,
        projectName: 'See more?',
        description: '''
I have additional projects and work samples available. Please feel free to request more information during our conversation. I'd be happy to share more details about my experience and portfolio.
''',
        appLinks: null,
      ),
    ];
  }

  // Download CV logic - Opens Google Drive link
  Future<void> downloadCV() async {
    final Uri cvUri = Uri.parse(ExternalLinks.cvDriveLink);
    
    if (await canLaunchUrl(cvUri)) {
      await launchUrl(
        cvUri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw Exception('Could not open CV link');
    }
  }
}
