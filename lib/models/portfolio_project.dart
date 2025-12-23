class PortfolioProject {
  final String imagePath;
  final String projectName;
  final String description;
  final List<String>? appLinks;

  PortfolioProject({
    required this.imagePath,
    required this.projectName,
    required this.description,
    this.appLinks,
  });
}
