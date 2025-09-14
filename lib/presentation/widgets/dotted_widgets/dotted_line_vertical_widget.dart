import 'package:flutter/material.dart';

class DottedLineVerticalWidget extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final double dashSpacing;
  final Color color;

  const DottedLineVerticalWidget({
    super.key,
    this.dashWidth = 1.0,
    this.dashHeight = 4.0,
    this.dashSpacing = 4.0,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(dashWidth, double.infinity),
      painter: DottedLineVerticalPainter(
        dashWidth: dashWidth,
        dashHeight: dashHeight,
        dashSpacing: dashSpacing,
        color: color,
      ),
    );
  }
}

class DottedLineVerticalPainter extends CustomPainter {
  final double dashWidth;
  final double dashHeight;
  final double dashSpacing;
  final Color color;

  DottedLineVerticalPainter({
    required this.dashWidth,
    required this.dashHeight,
    required this.dashSpacing,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = dashWidth;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
