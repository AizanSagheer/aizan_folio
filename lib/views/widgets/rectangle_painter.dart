import 'package:flutter/material.dart';

class RectangleSvgPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..style = PaintingStyle.fill;

    final width = size.width;
    final height = size.height;

    final path = Path()
      ..moveTo(0, height * 261.5 / 676)
      ..cubicTo(
        0,
        height * 117.078 / 676,
        width * 117.078 / 523,
        0,
        width * 261.5 / 523,
        0,
      )
      ..cubicTo(
        width * 405.922 / 523,
        0,
        width,
        height * 117.078 / 676,
        width,
        height * 261.5 / 676,
      )
      ..lineTo(width, height * 656.68 / 676)
      ..cubicTo(
        width,
        height * 663.514 / 676,
        width,
        height * 666.931 / 676,
        width * 521.649 / 523,
        height * 669.532 / 676,
      )
      ..cubicTo(
        width * 520.51 / 523,
        height * 671.723 / 676,
        width * 518.723 / 523,
        height * 673.51 / 676,
        width * 516.532 / 523,
        height * 674.649 / 676,
      )
      ..cubicTo(
        width * 513.931 / 523,
        height * 676 / 676,
        width * 510.514 / 523,
        height * 676 / 676,
        width * 503.68 / 523,
        height * 676 / 676,
      )
      ..lineTo(width * 19.32 / 523, height * 676 / 676)
      ..cubicTo(
        width * 12.4861 / 523,
        height * 676 / 676,
        width * 9.06917 / 523,
        height * 676 / 676,
        width * 6.46831 / 523,
        height * 674.649 / 676,
      )
      ..cubicTo(
        width * 4.27659 / 523,
        height * 673.51 / 676,
        width * 2.48955 / 523,
        height * 671.723 / 676,
        width * 1.35104 / 523,
        height * 669.532 / 676,
      )
      ..cubicTo(
        0,
        height * 666.931 / 676,
        0,
        height * 663.514 / 676,
        0,
        height * 656.68 / 676,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class RectangleSvgWidget extends StatelessWidget {
  final double width;
  final double height;

  const RectangleSvgWidget({
    super.key,
    this.width = 523,
    this.height = 676,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: RectangleSvgPainter(),
    );
  }
}
