import 'package:flutter/material.dart';
import '../../utils/images.dart';
import 'profile_photo_with_circle.dart';
import 'rectangle_painter.dart';

class DashboardProfilePhoto extends StatelessWidget {
  final bool isMobile;
  const DashboardProfilePhoto({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double maxWidth = constraints.maxWidth;
            final double rectWidth = maxWidth * 0.7;
            final double rectHeight = rectWidth * 0.93;
            final double photoSize = rectWidth * 1.1;
            final double stackHeight = rectHeight + (photoSize * 0.3);
            return SizedBox(
              width: rectWidth,
              height: stackHeight,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: photoSize * 0.28,
                    child: RectangleSvgWidget(
                      width: rectWidth,
                      height: rectHeight,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    child: Image.asset(
                      AppImages.aizan2,
                      height: photoSize + 33,
                      width: photoSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else {
      return const ProfilePhotoWithCircle();
    }
  }
}
