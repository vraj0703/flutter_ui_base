import 'package:flutter/material.dart';

/// Configuration class for the scanner overlay.
///
/// This class allows customization of the scanner overlay's appearance and behavior.
class ScannerOverlayConfig {
  /// The aspect ratio to automatically draw the overlay's size.
  final double aspectRatio;

  /// The empty space on the left and right of the overlay.
  final double horizontalMargin;

  /// Determines if the scan line should be shown.
  final bool showLine;

  /// Determines if a shadow line below the scan line should be shown.
  final bool showShadowLine;

  /// Determines if the corners should be shown.
  final bool showCorners;

  /// The height of the scan line.
  final double scanLineHeight;

  /// The color of the scan line.
  final Color scanLineColor;

  /// The size of the corner decorations.
  final double cornerSize;

  /// The radius of the corner decorations' curves.
  final double cornerRadius;

  /// The width of the border around the corner decorations.
  final double cornerBorderWidth;

  /// The color of the corner decorations' border.
  final Color cornerBorderColor;

  /// The colors used for the gradient of the shadow line. Starts with [Colors.white] and transitions to [Colors.white] with alpha 0.
  final List<Color> shadowColors;

  /// The curve used for the scan line animation.
  final Curve animationCurve;

  /// The duration of the animation in milliseconds.
  final int animationDuration;

  /// Constructs a [ScannerOverlayConfig].
  ///
  /// Allows customization of the scanner overlay, including the visibility and appearance of the scan line,
  /// corner decorations, and shadow line, as well as the animation curve.
  const ScannerOverlayConfig({
    this.aspectRatio = 16 / 9, // Default aspect ratio 16:9.
    this.horizontalMargin = 35.0, // Default horizontal margin.
    this.animationCurve = Curves.easeInOutQuart, // Default animation curve.
    this.animationDuration = 1000, // Default animation duration.
    this.showLine = true, // Show the scan line by default.
    this.showShadowLine = true, // Show the shadow line by default.
    this.showCorners = true, // Show the corners by default.
    this.scanLineHeight = 4.0, // Default scan line height.
    this.scanLineColor = Colors.blue, // Default scan line color.
    this.cornerSize = 25.0, // Default size for corner decorations.
    this.cornerRadius = 8.0, // Default radius for the corners' curves.
    this.cornerBorderWidth = 5.0, // Default border width for the corners.
    this.cornerBorderColor = Colors.white, // Default color for the corners.
    this.shadowColors = const [
      Color(0x66F6F6F6),
      Color(0x00FFFFFF),
    ], // Default colors for the shadow line's gradient.
  });
}
