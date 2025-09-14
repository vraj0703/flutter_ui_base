import 'package:flutter/material.dart';

import 'arc_animation.dart';

class GradientArc extends StatelessWidget {
  final double startAngle;
  final double sweepAngle;
  final double strokeWidth;
  final List<Color> colors;
  final List<double> colorStops;
  final double width;
  final double height;
  final Duration animationDuration;

  const GradientArc({
    super.key,
    required this.startAngle,
    required this.sweepAngle,
    required this.strokeWidth,
    required this.colors,
    required this.colorStops,
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
        builder: (context, animationValue) {
          return _GradientArcPainter(
            colors: colors,
            colorStops: colorStops,
            strokeWidth: strokeWidth,
            startAngle: startAngle,
            sweepAngle: sweepAngle * animationValue,
          );
        },
      ),
    );
  }
}

class _GradientArcPainter extends CustomPainter {
  final List<Color> colors;
  final List<double> colorStops;
  final double strokeWidth;
  final double startAngle;
  final double sweepAngle;

  _GradientArcPainter({
    required this.colors,
    required this.colorStops,
    required this.strokeWidth,
    required this.startAngle,
    required this.sweepAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);
    final gradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: colors,
      stops: colorStops,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
