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
          skillName: 'State Management',
          iconPath: AppImages.package,
          percentage: 95),
      Skill(
          skillName: 'Firebase & Rest APIs',
          iconPath: AppImages.firebase,
          percentage: 90),
      Skill(
          skillName: 'Git & Version Control',
          iconPath: AppImages.git,
          percentage: 95),
      Skill(
          skillName: 'CI/CD & Deployment',
          iconPath: AppImages.pipeline,
          percentage: 95),
      Skill(
          skillName: 'Testing & Debugging',
          iconPath: AppImages.debug,
          percentage: 90),
    ];
  }

   List<PortfolioProject> getProjects() {
    return [
      PortfolioProject(
        imagePath: AppImages.library,
        projectName: 'Solar Digital Library',
        description:
            'A comprehensive digital library platform enabling users to access, organize, and read thousands of e-books and research papers. Features include advanced search, personalized recommendations, offline reading, and seamless syncing across devices for students and professionals.',
      ),
      PortfolioProject(
        imagePath: AppImages.food,
        projectName: 'FoodieGo - Food Delivery App',
        description:
            'A modern food delivery application connecting users with local restaurants and cafes. Includes real-time order tracking, secure payments, user reviews, and a loyalty rewards system. Built with scalable architecture for high-traffic environments.',
      ),
      PortfolioProject(
        imagePath: AppImages.task,
        projectName: 'ZALWA Task Manager',
        description:
            'A productivity and collaboration tool for teams to manage projects, assign tasks, and track progress. Features Kanban boards, real-time notifications, file sharing, and integrations with Slack and Google Calendar.',
      ),
      PortfolioProject(
        imagePath: AppImages.travel,
        projectName: 'TravelNest - Vacation Planner',
        description:
            'An intuitive vacation planning app that helps users discover destinations, create itineraries, and book hotels and activities. Includes AI-powered suggestions, budget tracking, and collaborative trip planning for groups.',
      ),
      PortfolioProject(
        imagePath: AppImages.education,
        projectName: 'EduConnect LMS',
        description:
            'A learning management system for schools and universities, offering course management, interactive lessons, quizzes, and analytics dashboards for educators. Supports video lectures, discussion forums, and student progress tracking.',
      ),
      PortfolioProject(
        imagePath: AppImages.wellness,
        projectName: 'FitTrack Wellness',
        description:
            'A health and fitness tracking app that monitors workouts, nutrition, and sleep patterns. Provides personalized fitness plans, progress charts, and integration with wearable devices for holistic wellness management.',
      ),
      PortfolioProject(
        imagePath: AppImages.garden,
        projectName: 'GreenThumb - Smart Gardening',
        description:
            'A smart gardening assistant app that helps users monitor plant health, schedule watering, and receive gardening tips. Integrates with IoT sensors for real-time soil and weather data.',
      ),
      PortfolioProject(
        imagePath: AppImages.wallet,
        projectName: 'SafePay Wallet',
        description:
            'A secure digital wallet for managing payments, transfers, and budgeting. Includes biometric authentication, transaction analytics, bill reminders, and support for multiple currencies and payment methods.',
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
