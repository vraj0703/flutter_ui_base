import 'package:flutter/material.dart';
import 'package:flutter_core/domain/models/color_percentage.dart';

import 'arc_animation.dart';

class IndicatorArc extends StatelessWidget {
  final double startAngle;
  final double sweepAngle;
  final double strokeWidth;
  final double width;
  final double height;
  final List<ColorPercentage> colorPercentages;
  final Duration animationDuration;

  const IndicatorArc({
    super.key,
    required this.startAngle,
    required this.sweepAngle,
    required this.colorPercentages,
    required this.strokeWidth,
    required this.width,
    required this.height,
    required this.animationDuration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: AnimatedGradientArc(
        duration: animationDuration,
        builder: (BuildContext context, animationValue) => _GradientArcPainter(
          strokeWidth: strokeWidth,
          startAngle: startAngle,
          sweepAngle: sweepAngle * animationValue,
          colorPercentages: colorPercentages,
        ),
      ),
    );
  }
}

class _GradientArcPainter extends CustomPainter {
  final List<ColorPercentage> colorPercentages;
  final double strokeWidth;
  final double startAngle;
  final double sweepAngle;

  _GradientArcPainter({
    required this.colorPercentages,
    required this.strokeWidth,
    required this.startAngle,
    required this.sweepAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    double startAngleRad = startAngle;
    for (var colorPercentage in colorPercentages) {
      final paint = Paint()
        ..color = colorPercentage.color
        ..strokeWidth = strokeWidth
        ..style = PaintingStyle.stroke;

      final double sweepRadian = colorPercentage.percent * sweepAngle;
      canvas.drawArc(rect, startAngleRad, sweepRadian, false, paint);

      startAngleRad += sweepRadian;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
