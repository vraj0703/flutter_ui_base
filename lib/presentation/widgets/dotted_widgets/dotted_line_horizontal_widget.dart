import 'package:flutter/material.dart';

class DottedLineHorizontalWidget extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final double dashSpacing;
  final Color color;

  const DottedLineHorizontalWidget({
    super.key,
    this.dashWidth = 6,
    this.dashHeight = 1,
    this.dashSpacing = 6,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, dashHeight),
      painter: DashedHorizontalLinePainter(
        dashWidth: dashWidth,
        dashHeight: dashHeight,
        dashSpacing: dashSpacing,
        color: color,
      ),
    );
  }
}

class DashedHorizontalLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashHeight;
  final double dashSpacing;

  DashedHorizontalLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashHeight,
    required this.dashSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    double startX = 0;
    final paint = Paint()
      ..color = color
      ..strokeWidth = dashHeight;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpacing;
    }
  }

  @override
  @override
  bool shouldRepaint(covariant DashedHorizontalLinePainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.dashWidth != dashWidth ||
        oldDelegate.dashHeight != dashHeight ||
        oldDelegate.dashSpacing != dashSpacing;
  }
}
