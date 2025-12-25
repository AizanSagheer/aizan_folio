import 'package:flutter/material.dart';
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
    // Group projects by category
    final Map<String, List<model.PortfolioProject>> groupedProjects = {};
    final List<model.PortfolioProject> uncategorizedProjects = [];
    
    for (final project in projects) {
      if (project.category != null && project.category!.isNotEmpty) {
        groupedProjects.putIfAbsent(project.category!, () => []).add(project);
      } else {
        uncategorizedProjects.add(project);
      }
    }
    
    return Column(
      children: [
        Center(
          child: Text('Portfolio',
              style: TextStyle(
                color: AppColors().whiteColor,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              )),
        ),
        SizedBox(height: 40.0),
        Container(
          key: portfolioKey,
          child: Column(
            children: [
              // Render uncategorized projects first
              if (uncategorizedProjects.isNotEmpty)
                Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  alignment: WrapAlignment.center,
                  children: [
                    for (final project in uncategorizedProjects)
                      PortfolioProject(
                        imagePath: project.imagePath,
                        projectName: project.projectName,
                        description: project.description,
                        appLinks: project.appLinks,
                      ),
                  ],
                ),
              
              // Render categorized projects with category headers
              for (final entry in groupedProjects.entries) ...[
                SizedBox(height: uncategorizedProjects.isNotEmpty || groupedProjects.keys.first != entry.key ? 40.0 : 0),
                Center(
                  child: Text(
                    entry.key,
                    style: TextStyle(
                      color: AppColors().whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  alignment: WrapAlignment.center,
                  children: [
                    for (final project in entry.value)
                      PortfolioProject(
                        imagePath: project.imagePath,
                        projectName: project.projectName,
                        description: project.description,
                        appLinks: project.appLinks,
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
