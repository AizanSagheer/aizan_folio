import 'package:flutter/material.dart';
import '../../models/portfolio_project.dart' as model;
import 'dashboard_portfolio_section.dart';

class PortfolioSection extends StatelessWidget {
  final List<model.PortfolioProject> projects;
  final GlobalKey portfolioKey;
  const PortfolioSection(
      {super.key, required this.projects, required this.portfolioKey});

  @override
  Widget build(BuildContext context) {
    return DashboardPortfolioSection(
        projects: projects, portfolioKey: portfolioKey);
  }
}
