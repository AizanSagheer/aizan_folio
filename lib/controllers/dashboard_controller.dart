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
      // E-commerce Platform
      PortfolioProject(
        imagePath: AppImages.wallet,
        projectName: 'Afrikwave E-Commerce Platform',
        description:
            'A comprehensive e-commerce solution with separate user and seller applications. Features include product browsing, shopping cart, secure payments, order management, seller dashboard, inventory management, analytics, and real-time notifications. Built for scalability and high-performance transactions.',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.afrikwave.userapp',
          'https://play.google.com/store/apps/details?id=com.afrikwave.sellerapp',
        ],
      ),
      
      // Hair Salon Booking App
      PortfolioProject(
        imagePath: AppImages.task,
        projectName: 'CareChair - Hair Salon Booking',
        description:
            'A complete salon management system with customer booking app and owner management panel. Customers can book appointments, view services, manage their profile, and receive notifications. Salon owners can manage appointments, staff, services, customer database, and generate business analytics reports.',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.carechair.panel_customer',
          'https://play.google.com/store/apps/details?id=com.carechair.panel_owner',
        ],
      ),
      
      // Healthcare Appointment App
      PortfolioProject(
        imagePath: AppImages.wellness,
        projectName: 'Doctor Appointment & Telemedicine',
        description:
            'A healthcare platform connecting patients with doctors through appointments, video consultations, and messaging. Patients can search for doctors, book appointments, have video calls, and chat with healthcare providers. Doctors can manage their schedule, conduct video consultations, and communicate with patients through an integrated messaging system.',
        appLinks: [
          'https://play.google.com/store/apps/details?id=app.patient.doctors',
          'https://play.google.com/store/apps/details?id=app.doctors.doctor',
        ],
      ),
      
      // Health & Fitness App
      PortfolioProject(
        imagePath: AppImages.wellness,
        projectName: 'Ring of Well - Health & Fitness',
        description:
            'An advanced health and fitness application featuring 3D exercise modeling for interactive workout guidance. Users can follow detailed 3D animated exercise demonstrations, track their fitness progress, create personalized workout plans, and monitor their health metrics. The app provides immersive visual guidance for proper exercise form and technique.',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.hollysoft.ringofwell1',
        ],
      ),
      
      // Precious Metals Trading Apps
      PortfolioProject(
        imagePath: AppImages.wallet,
        projectName: 'Precious Metals Trading Platform',
        description:
            'A suite of financial applications for tracking live rates of copper, gold, and other precious metals. Features include real-time price updates, market analytics, price alerts, historical charts, and trading tools. Available in multiple variants (ZelatoFX, Ceekay, Manthoora) tailored for different markets and user preferences.',
        appLinks: [
          'https://play.google.com/store/apps/details?id=com.adrobz.zelatofx',
          'https://play.google.com/store/apps/details?id=com.adrobz.ceekay',
          'https://play.google.com/store/apps/details?id=com.adrobz.manthoora',
        ],
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
