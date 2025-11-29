import 'package:flutter_ui_base/common_libs.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    super.key,
    this.vertical = false,
    this.color = Colors.white,
    this.dashSize = 3,
    this.gapSize = 3,
  });

  final bool vertical;
  final Color color;
  final double dashSize;
  final double gapSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: vertical ? 2 : double.infinity,
      height: vertical ? double.infinity : 2,
      child: CustomPaint(
        painter: _DashedLinePainter(
          vertical: vertical,
          color: color,
          dashSize: dashSize,
          gapSize: gapSize,
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  _DashedLinePainter({
    required this.vertical,
    required this.color,
    required this.dashSize,
    required this.gapSize,
  });

  final bool vertical;
  final Color color;
  final double dashSize;
  final double gapSize;

  @override
  void paint(Canvas canvas, Size size) {
    double pos = 0;
    final paint = Paint()..color = color;
    if (vertical) {
      while (pos < size.height) {
        canvas.drawLine(Offset(0, pos), Offset(0, pos + dashSize), paint);
        pos += dashSize + gapSize;
      }
    } else {
      while (pos < size.width) {
        canvas.drawLine(Offset(pos, 0), Offset(pos + dashSize, 0), paint);
        pos += dashSize + gapSize;
      }
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter oldDelegate) {
    return oldDelegate.vertical != vertical ||
        oldDelegate.color != color ||
        oldDelegate.dashSize != dashSize ||
        oldDelegate.gapSize != gapSize;
  }
}
