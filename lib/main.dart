import 'package:flutter/material.dart';
import 'views/dashboard_screen.dart';
import 'package:aizan_folio/utils/colors.dart';
import 'views/not_found_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors().primaryColor,
          primary: AppColors().primaryColor,
          secondary: AppColors().secondaryColor,
        ),
        useMaterial3: true,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all(AppColors().textColor),
            overlayColor: WidgetStateProperty.resolveWith<Color>((states) {
              if (states.contains(WidgetState.hovered)) {
                return AppColors().secondaryColor;
              }
              return Colors.transparent;
            }),
          ),
        ),
        textTheme: GoogleFonts.k2dTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors().primaryColor,
          foregroundColor: AppColors().textColor,
        ),
        scaffoldBackgroundColor: AppColors().primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/' || settings.name == '/home') {
          return MaterialPageRoute(
              builder: (context) => const DashboardScreen());
        }
        // Unknown route
        return MaterialPageRoute(builder: (context) => const NotFoundScreen());
      },
    );
  }
}
