import 'package:flutter/material.dart';
import '../../utils/images.dart';

class ProfilePhotoWithCircle extends StatelessWidget {
  final double imageSize;
  final double circleSize;

  const ProfilePhotoWithCircle({
    super.key,
    this.imageSize = 300,
    this.circleSize = 500,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: circleSize,
        height: circleSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF18181A),
        ),
        child: ClipOval(
          child: Image.asset(
            AppImages.aizanSmiling,
            width: circleSize,
            height: circleSize,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
