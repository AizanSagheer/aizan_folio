import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class ShimmerLogo extends StatefulWidget {
  const ShimmerLogo({super.key});

  @override
  State<ShimmerLogo> createState() => _ShimmerLogoState();
}

class _ShimmerLogoState extends State<ShimmerLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                AppColors().secondaryColor,
                AppColors().whiteColor,
                AppColors().secondaryColor,
              ],
              begin: Alignment(-1.0 + 2.0 * _controller.value, 0),
              end: Alignment(1.0 + 2.0 * _controller.value, 0),
            ).createShader(bounds);
          },
          child: Text(
            'Aizan.',
            style: TextStyle(
              color: AppColors().whiteColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
