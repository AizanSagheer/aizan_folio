import 'package:flutter/material.dart';
import '../../utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillItem extends StatefulWidget {
  final String skillName;
  final String iconPath;
  final double percentage;

  const SkillItem({
    super.key,
    required this.skillName,
    required this.iconPath,
    required this.percentage,
  });

  @override
  State<SkillItem> createState() => _SkillItemState();
}

class _SkillItemState extends State<SkillItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasAnimated = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: widget.percentage).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!_hasAnimated && info.visibleFraction > 0.2) {
      _controller.forward();
      _hasAnimated = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VisibilityDetector(
          key: Key(widget.skillName),
          onVisibilityChanged: _onVisibilityChanged,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: CircularProgressIndicator(
                          value: _animation.value / 100,
                          strokeWidth: 4,
                          backgroundColor: Colors.grey[800],
                          color: AppColors().secondaryColor,
                        ),
                      ),
                      SvgPicture.asset(
                        widget.iconPath,
                        height: 40,
                        width: 40,
                        colorFilter: ColorFilter.mode(
                          Colors.grey[400]!,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    '${_animation.value.toInt()}%',
                    style: TextStyle(
                      color: AppColors().secondaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        SizedBox(height: 8),
        Text(
          widget.skillName,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
