import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
import '../../models/portfolio_project.dart' as model;
import 'portfolio_project.dart';

class DashboardPortfolioSection extends StatelessWidget {
  final List<model.PortfolioProject> projects;
  final GlobalKey portfolioKey;
  const DashboardPortfolioSection(
      {super.key, required this.projects, required this.portfolioKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text('Portfolio',
              style: GoogleFonts.k2d(
                color: AppColors().whiteColor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              )),
        ),
        SizedBox(height: 40.0),
        Container(
          key: portfolioKey,
          child: Wrap(
            spacing: 20.0,
            runSpacing: 20.0,
            alignment: WrapAlignment.center,
            children: [
              for (final project in projects)
                PortfolioProject(
                  imagePath: project.imagePath,
                  projectName: project.projectName,
                  description: project.description,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
