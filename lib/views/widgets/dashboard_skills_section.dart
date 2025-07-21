import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/colors.dart';
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
          style: GoogleFonts.k2d(
            color: AppColors().whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
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
