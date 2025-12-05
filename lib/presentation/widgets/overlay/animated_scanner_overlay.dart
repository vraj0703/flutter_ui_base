import 'package:flutter/material.dart';
import 'package:flutter_ui_base/presentation/modals/scanner_overlay_config.dart';

/// A widget that creates an animated scanner overlay.
///
/// This widget uses [ScannerOverlayConfig] to customize its appearance and behavior.
/// The animation and appearance of the scanner overlay, including scan lines and corner decorations,
/// are configured through [config].
class AnimatedScannerOverlay extends StatefulWidget {
  final ScannerOverlayConfig config;
  final GlobalKey overlayGlobalKey;

  const AnimatedScannerOverlay(
      {super.key, required this.overlayGlobalKey, required this.config});

  @override
  State<StatefulWidget> createState() => _AnimatedScannerOverlayState();
}

/// The state class for [AnimatedScannerOverlay].
///
/// Manages the animation of the scanner overlay based on the provided [ScannerOverlayConfig].
class _AnimatedScannerOverlayState extends State<AnimatedScannerOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.config.animationDuration))
      ..repeat(reverse: true);
    _animation = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: widget.config.animationCurve))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.config.horizontalMargin),
      child: AspectRatio(
        aspectRatio: widget.config.aspectRatio,
        child: AnimatedBuilder(
          key: widget.overlayGlobalKey,
          animation: _animation,
          builder: (_, child) {
            return CustomPaint(
              painter: _ScannerOverlayPainter(
                animationValue: _animation.value,
                animationStatus: _animation.status,
                config: widget.config,
              ),
              child: Container(), // This forces CustomPaint to expand
            );
          },
        ),
      ),
    );
  }
}

/// A custom painter for drawing the scanner overlay.
///
/// This painter uses the current [animationValue] and [animationStatus] to dynamically
/// adjust the overlay's appearance during the animation. The appearance and behavior
/// of the overlay are further customized through [config].
class _ScannerOverlayPainter extends CustomPainter {
  final double animationValue;
  final AnimationStatus animationStatus;
  final ScannerOverlayConfig config;

  _ScannerOverlayPainter(
      {required this.animationValue,
        required this.animationStatus,
        required this.config});

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate the line position
    final linePosition = size.height * animationValue;

    if (config.showShadowLine && config.showLine) {
      // Draw the shadow
      bool isMovingDown = animationStatus == AnimationStatus.forward;
      final gradient = LinearGradient(
        colors: config.shadowColors,
        begin: isMovingDown ? Alignment.bottomCenter : Alignment.topCenter,
        end: isMovingDown ? Alignment.topCenter : Alignment.bottomCenter,
      );
      final shadowSize =
          (size.height / 2) * (1 - 2 * (animationValue - 0.5).abs());
      final shadowHeight =
      isMovingDown ? linePosition - shadowSize : linePosition + shadowSize;
      final shadowRect = Rect.fromPoints(
          Offset(0, linePosition), Offset(size.width, shadowHeight));
      final shadowPaint = Paint()
        ..style = PaintingStyle.fill
        ..shader = gradient.createShader(shadowRect);
      canvas.drawRect(shadowRect, shadowPaint);
    }

    if (config.showLine) {
      // Draw the moving line
      final scanLinePath = Path()
        ..moveTo(0, linePosition)
        ..lineTo(size.width, linePosition);
      final linePaint = Paint()
        ..color = config.scanLineColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = config.scanLineHeight;
      canvas.drawPath(scanLinePath, linePaint);
    }

    if (config.showCorners) {
      // Top-left corner
      final Path topLeftCorner = Path()
        ..moveTo(0, config.cornerRadius)
        ..quadraticBezierTo(0, 0, config.cornerRadius, 0)
        ..lineTo(config.cornerSize, 0)
        ..moveTo(config.cornerRadius, 0)
        ..quadraticBezierTo(0, 0, 0, config.cornerRadius)
        ..lineTo(0, config.cornerSize);

      // Top-right corner
      final Path topRightCorner = Path()
        ..moveTo(size.width - config.cornerSize, 0)
        ..lineTo(size.width - config.cornerRadius, 0)
        ..quadraticBezierTo(size.width, 0, size.width, config.cornerRadius)
        ..lineTo(size.width, config.cornerSize);

      // Bottom-left corner
      final Path bottomLeftCorner = Path()
        ..moveTo(0, size.height - config.cornerSize)
        ..lineTo(0, size.height - config.cornerRadius)
        ..quadraticBezierTo(0, size.height, config.cornerRadius, size.height)
        ..lineTo(config.cornerSize, size.height);

      // Bottom-right corner
      final Path bottomRightCorner = Path()
        ..moveTo(size.width - config.cornerSize, size.height)
        ..lineTo(size.width - config.cornerRadius, size.height)
        ..quadraticBezierTo(size.width, size.height, size.width,
            size.height - config.cornerRadius)
        ..lineTo(size.width, size.height - config.cornerSize);

      // Draw the corners
      final cornerBorderPaint = Paint()
        ..color = config.cornerBorderColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = config.cornerBorderWidth;
      canvas.drawPath(topLeftCorner, cornerBorderPaint);
      canvas.drawPath(topRightCorner, cornerBorderPaint);
      canvas.drawPath(bottomLeftCorner, cornerBorderPaint);
      canvas.drawPath(bottomRightCorner, cornerBorderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
