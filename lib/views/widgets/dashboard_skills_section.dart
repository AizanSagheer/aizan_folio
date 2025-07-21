import 'package:flutter/material.dart';
import '../../models/skill.dart';
import 'skill_item.dart';

class DashboardSkillsSection extends StatelessWidget {
  final List<Skill> skills;
  const DashboardSkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'My Skills',
        ),
        SizedBox(height: 40.0),
        Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
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
        SizedBox(height: 40.0),
      ],
    );
  }
}
